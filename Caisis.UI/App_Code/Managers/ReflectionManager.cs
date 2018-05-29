using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Reflection.Emit;
using System.Threading;

using System.Linq;

using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{
    // delegate types used for Dynamic Methods
    public delegate ICaisisInputControl MetaConstructor();
    public delegate object MetaGetterMethod(ICaisisInputControl cic);
    public delegate void MetaStringSetter(ICaisisInputControl cic, string val);
    public delegate void MetaBoolSetter(ICaisisInputControl cic, bool val);
    public delegate void MetaIntSetter(ICaisisInputControl cic, int val);
    public delegate void MetaDoubleSetter(ICaisisInputControl cic, double val);

    /// <summary>
    /// Static class used for handling Reflection and Dynamic Methods
    /// </summary>

    public static class ReflectionManager
    {
        public static Type BaseInterfaceType = typeof(ICaisisInputControl);
        public static Type InvokeableAttributeType = typeof(ICaisisInputControl);

        // private lookup maps
        private static Dictionary<string, CaisisDynamicControlModifier> _constructorMap;
        private static Dictionary<string, Dictionary<string, CaisisMetaDataField>> _metaFieldMap;

        private static ReaderWriterLockSlim mapLock = new ReaderWriterLockSlim();

        /// <summary>
        /// Static init
        /// </summary>
        static ReflectionManager()
        {
            _RefreshReflectionCache();
        }

        public static void RefreshReflectionCache()
        {
            _RefreshReflectionCache();
        }

        private static void _RefreshReflectionCache()
        {
            mapLock.EnterWriteLock();

            try
            {
                _BuildReflectionCache();
            }
            finally
            {
                mapLock.ExitWriteLock();
            }
        }

        private static void _BuildReflectionCache()
        {
            Assembly currentAssembly = Assembly.GetExecutingAssembly();
            var currentTypes = currentAssembly.GetTypes();
            // get ICaisisInputControl Types
            var inputTypes = currentTypes.Where(t => t.GetInterface(typeof(ICaisisInputControl).Name) != null);
            // build input constructor map
            _constructorMap = inputTypes.ToDictionary(
                                t => t.Name,
                                t => new CaisisDynamicControlModifier(t));
            // built input fields map
            _metaFieldMap = inputTypes.ToDictionary(
                                t => t.Name,
                                t => (from p in CaisisDynamicControlModifier.EnumerateTypeMemberHierarchy(t)
                                      let cm = Attribute.GetCustomAttribute(p, typeof(CaisisMetaDataField), true) as CaisisMetaDataField
                                      where cm != null
                                      select new
                                      {
                                          Name = p.Name,
                                          Attribute = cm
                                      }).ToDictionary(
                                    p => p.Name,
                                    p => p.Attribute));
        }

        /// <summary>
        /// Returns a list of ICaisisInputControl type names
        /// </summary>
        /// <returns></returns>
        public static IEnumerable<string> GetMetaInputControlNames()
        {
            mapLock.EnterReadLock();

            try
            {
                return _constructorMap.Keys;
            }
            finally
            {
                mapLock.ExitReadLock();
            }
        }

        /// <summary>
        /// Returns a list of Public Properties which are marked with atttibute CaisisMetaDataField for the specific. 
        /// </summary>
        /// <param name="icicType"></param>
        /// <returns></returns>
        public static IEnumerable<string> GetMetaDataFieldNames(ICaisisInputControl icic)
        {
            mapLock.EnterReadLock();

            try
            {
                return _metaFieldMap[icic.GetType().Name].Keys;
            }
            finally
            {
                mapLock.ExitReadLock();
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public class CaisisDynamicControlModifier
    {
        private Type modifierType;
        private MetaConstructor controlConstructor;
        private Dictionary<string, CaisisDynamicPropertyModifier> controlGetterSetters = new Dictionary<string, CaisisDynamicPropertyModifier>();

        /// <summary>
        /// 
        /// </summary>
        public Dictionary<string, CaisisDynamicPropertyModifier> PropertyModifiers
        {
            get
            {
                return controlGetterSetters;
            }
        }

        public CaisisDynamicControlModifier(Type iCICType)
        {
            if (iCICType.GetInterface(typeof(ICaisisInputControl).Name) != null)
            {
                this.modifierType = iCICType;
                this.controlConstructor = CreateConstructorDelegate(iCICType);
                IEnumerable<PropertyInfo> propList = EnumerateTypeMemberHierarchy(iCICType);
                foreach (PropertyInfo prop in propList)
                {
                    CaisisMetaDataField cicMetaProp = Attribute.GetCustomAttribute(prop, typeof(CaisisMetaDataField), true) as CaisisMetaDataField;
                    string propKey = prop.Name;
                    if (cicMetaProp != null && !controlGetterSetters.ContainsKey(propKey))
                    {
                        CaisisDynamicPropertyModifier cfh = new CaisisDynamicPropertyModifier(iCICType, propKey);
                        controlGetterSetters.Add(propKey, cfh);
                    }
                }
            }
            else
            {
                string err = "Unable to create {0}, Type '{1}' must implement interface {2} and be marked with Attribute [{3}].";
                throw new Exception(string.Format(err, this.GetType().Name, iCICType.Name, ReflectionManager.BaseInterfaceType.Name, ReflectionManager.InvokeableAttributeType.Name));
            }
        }

        /// <summary>
        /// Creates a new ICaisisInputControl specified by base type
        /// </summary>
        /// <returns></returns>
        public ICaisisInputControl InvokeControl()
        {
            if (controlConstructor != null)
            {
                return controlConstructor();
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="srcControl"></param>
        /// <returns></returns>
        public ICaisisInputControl CloneControl(ICaisisInputControl srcControl)
        {
            ICaisisInputControl clonedCIC = this.InvokeControl();
            foreach (CaisisDynamicPropertyModifier dynProp in this.controlGetterSetters.Values)
            {
                dynProp.CopyField(srcControl, clonedCIC);
            }
            return clonedCIC;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCICInstance"></param>
        /// <param name="propName"></param>
        /// <param name="propValue"></param>
        public void SetProperty(ICaisisInputControl iCICInstance, string propName, object propValue)
        {
            CaisisDynamicPropertyModifier cfh = GetFieldHelper(propName);
            if (cfh != null)
            {
                cfh.SetFieldValue(iCICInstance, propValue);
            }
            else
            {
                throw new Exception();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="iCICInstance"></param>
        /// <param name="propName"></param>
        /// <returns></returns>
        public object GetProperty(ICaisisInputControl iCICInstance, string propName)
        {
            CaisisDynamicPropertyModifier cfh = GetFieldHelper(propName);
            if (cfh != null)
            {
                return cfh.GetFieldValue(iCICInstance);
            }
            else
            {
                throw new Exception();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="propName"></param>
        /// <returns></returns>
        public bool CanSetGetProperty(string propName)
        {
            return controlGetterSetters.ContainsKey(propName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="propName"></param>
        /// <returns></returns>
        private CaisisDynamicPropertyModifier GetFieldHelper(string propName)
        {
            if (controlGetterSetters.ContainsKey(propName))
            {
                return controlGetterSetters[propName];
            }
            else
            {
                throw new Exception();
            }
        }

        #region DYNAMIC METHODS - Used for creating dynamic delegates

        /// <summary>
        /// 
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public static IEnumerable<PropertyInfo> EnumerateTypeMemberHierarchy(Type t)
        {
            foreach (Type i in t.GetInterfaces())
            {
                foreach (PropertyInfo p in i.GetProperties())
                {
                    yield return p;
                }
            }

            foreach (PropertyInfo p in t.GetProperties())
            {
                yield return p;
            }
        }

        private static MetaConstructor CreateConstructorDelegate(Type iCICType)
        {
            ConstructorInfo cInfo = null;
            if (iCICType.GetInterface(typeof(ICaisisInputControl).FullName) != null && !iCICType.IsInterface)
            {
                cInfo = iCICType.GetConstructor(new Type[] { });
            }
            if (cInfo != null)
            {
                DynamicMethod creator = new DynamicMethod(
              String.Concat("_Creator", cInfo.DeclaringType.Name, "_"), typeof(ICaisisInputControl)
              , new Type[] { }, cInfo.DeclaringType);
                ILGenerator generator = creator.GetILGenerator();
                generator.Emit(OpCodes.Newobj, cInfo);
                generator.Emit(OpCodes.Ret);
                MetaConstructor metaC = creator.CreateDelegate(typeof(MetaConstructor)) as MetaConstructor;
                return metaC;
            }
            else
            {
                return null;
            }

        }

        #endregion
    }

    public class CaisisDynamicPropertyModifier
    {
        private string propertyName;
        private Type reflectedType;
        private MetaGetterMethod getterDelegate;
        private Delegate setterDelegate;

        public string PropertyName
        {
            get
            {
                return propertyName;
            }
        }

        public Type ReflectedType
        {
            get
            {
                return reflectedType;
            }
        }

        public CaisisDynamicPropertyModifier(Type cicType, string propName)
        {
            this.propertyName = propName;
            this.reflectedType = cicType;
            this.getterDelegate = CreateGetterMethod(this.reflectedType, this.propertyName);
            this.setterDelegate = CreateSetterMethod(this.reflectedType, this.propertyName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cic"></param>
        /// <param name="valToSet"></param>
        public void SetFieldValue(ICaisisInputControl iCICInstance, object valToSet)
        {
            string val = valToSet != null ? valToSet.ToString() : null;
            if (setterDelegate != null && val != null)
            {
                if (setterDelegate is MetaStringSetter)
                {
                    (setterDelegate as MetaStringSetter)(iCICInstance, val);
                }
                // parseable values need to be non-empty
                else if (!string.IsNullOrEmpty(val))
                {
                    if (setterDelegate is MetaBoolSetter)
                    {
                        (setterDelegate as MetaBoolSetter)(iCICInstance, bool.Parse(val));
                    }
                    else if (setterDelegate is MetaIntSetter)
                    {
                        (setterDelegate as MetaIntSetter)(iCICInstance, int.Parse(val));
                    }
                    else if (setterDelegate is MetaDoubleSetter)
                    {
                        (setterDelegate as MetaDoubleSetter)(iCICInstance, double.Parse(val));
                    }
                }

            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="cic"></param>
        /// <returns></returns>
        public object GetFieldValue(ICaisisInputControl cic)
        {
            if (getterDelegate != null)
            {
                return getterDelegate(cic);
            }
            else
            {
                return null;
            }
        }

        public void CopyField(ICaisisInputControl srcCIC, ICaisisInputControl destCIC)
        {
            if (this.getterDelegate != null && this.setterDelegate != null)
            {
                SetFieldValue(destCIC, GetFieldValue(srcCIC));
            }
        }


        private static Delegate CreateSetterMethod(Type objectMetaType, string metaFieldName)
        {
            PropertyInfo propertyInfo = objectMetaType.GetProperty(metaFieldName);
            if (propertyInfo == null)
                return null;
            if (!propertyInfo.CanWrite)
                return null;
            MethodInfo setMethod = propertyInfo.GetSetMethod();
            if (setMethod == null)
                return null;

            Type delegateType = typeof(MetaStringSetter);
            if (propertyInfo.PropertyType.Equals(typeof(bool)))
            {
                delegateType = typeof(MetaBoolSetter);
            }
            else if (propertyInfo.PropertyType.Equals(typeof(int)))
            {
                delegateType = typeof(MetaIntSetter);
            }
            else if (propertyInfo.PropertyType.Equals(typeof(double)))
            {
                delegateType = typeof(MetaDoubleSetter);
            }

            /*
            * Create the dynamic method
            */
            Type[] arguments = new Type[2];
            arguments[0] = typeof(ICaisisInputControl);
            arguments[1] = propertyInfo.PropertyType;

            DynamicMethod setter = new DynamicMethod(
              String.Concat("_Dynamic_", propertyInfo.Name, "_Setter"),
              typeof(void), arguments, propertyInfo.DeclaringType);
            ILGenerator generator = setter.GetILGenerator();
            generator.Emit(OpCodes.Ldarg_0);
            generator.Emit(OpCodes.Castclass, propertyInfo.DeclaringType);
            generator.Emit(OpCodes.Ldarg_1);
            if (propertyInfo.PropertyType.IsClass)
                generator.Emit(OpCodes.Castclass, propertyInfo.PropertyType);
            // Case for Value Types such as bool, which is struct, not class
            else
                generator.Emit(OpCodes.Box, propertyInfo.PropertyType);
            generator.EmitCall(OpCodes.Callvirt, setMethod, null);
            generator.Emit(OpCodes.Ret);

            /*
            * Create the delegate and return it
            */
            return setter.CreateDelegate(delegateType);
        }

        private static MetaGetterMethod CreateGetterMethod(Type objectMetaType, string metaFieldName)
        {
            PropertyInfo propertyInfo = objectMetaType.GetProperty(metaFieldName);
            if (propertyInfo == null)
                return null;
            if (!propertyInfo.CanRead)
                return null;

            MethodInfo getMethod = propertyInfo.GetGetMethod();
            if (getMethod == null)
                return null;

            Type[] arguments = new Type[1];
            arguments[0] = typeof(ICaisisInputControl);

            DynamicMethod getter = new DynamicMethod(
              String.Concat("_Dynamic_", propertyInfo.Name, "_Getter"),
              typeof(object), arguments, propertyInfo.DeclaringType);
            ILGenerator generator = getter.GetILGenerator();
            generator.Emit(OpCodes.Ldarg_0);
            generator.EmitCall(OpCodes.Callvirt, getMethod, null);
            // Needed for bool values
            if (propertyInfo.PropertyType.IsValueType)
                generator.Emit(OpCodes.Box, propertyInfo.PropertyType);
            generator.Emit(OpCodes.Ret);

            return getter.CreateDelegate(typeof(MetaGetterMethod)) as MetaGetterMethod;
        }

    }

}