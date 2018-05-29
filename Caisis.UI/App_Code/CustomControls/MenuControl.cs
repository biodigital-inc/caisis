namespace Caisis.UI.Core.Classes
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Xml;

	using Caisis.Security;
	/// <summary>
	///		Summary description for menus.
	/// </summary>
	public class MenuControl : BaseControl
	{
		public MenuControl()
		{

		}


		protected void SetMenuEvents(HtmlAnchor anchor,  string menuName)
		{
			if (anchor != null && anchor.Visible == true)  
			{				
				anchor.Attributes.Add("onmouseover","ypSlideOutMenu.showMenu('" + menuName + "')");
				anchor.Attributes.Add("onmouseout","ypSlideOutMenu.hideMenu('" + menuName + "')");
			}	
		}
		/// <summary>
		/// Shows menu and adds mouseover function to drop down menu.
		/// </summary>
		/// <param name="anchor"></param>
		/// <param name="menuName"></param>
		public void ShowMenu(HtmlAnchor anchor, string menuName)
		{
			if (anchor != null)  
			{				
				anchor.Visible = true;
				anchor.Attributes.Add("onmouseover","ypSlideOutMenu.showMenu('" + menuName + "')");
				anchor.Attributes.Add("onmouseout","ypSlideOutMenu.hideMenu('" + menuName + "')");
			}
			//TODO: add logic to position menus when others are missing
		}

		/// <summary>
		///  If a menu is active, move the succeeding menus to the right
		/// </summary>
		/// <param name="XPos"></param>
		/// <param name="CurrentMenu"></param>
		/// <param name="WidthIncrease"></param>
		/// <returns></returns>
		protected int[] IncrementMenuPositions(int[] XPos, int CurrentMenu, int WidthIncrease)
		{
			int NumMenus = XPos.Length;
			int NextMenu = CurrentMenu + 1;
	
			for (int i=NextMenu; i<NumMenus; i++)
			{
				XPos[i] = XPos[CurrentMenu] + WidthIncrease;
			}

			return XPos;
		}

		/// <summary>
		/// Binds xml to drop down menu. If no data to bind, menu is hidden
		/// </summary>
		/// <param name="nodeList"></param>
		/// <param name="menuRpt"></param>
		/// <param name="menuId"></param>
		protected void BindXmlNodeListToMenu(string nodeName, XmlDocument menusXml, Repeater menuRpt, HtmlAnchor menuId)
		{
			XmlNodeList menuItems = menusXml.SelectNodes("menuItems/menu[@name='" + nodeName + "']/menuItem");
			
			if(menuItems != null && menuItems.Count > 0)
			{
				menuRpt.DataSource = menuItems;
				menuRpt.DataBind();
			}
			else
			{
				menuId.Visible = false;
			}
		}



	}
}
