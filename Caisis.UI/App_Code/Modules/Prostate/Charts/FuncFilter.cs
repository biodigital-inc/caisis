using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Caisis.UI.Modules.Prostate.DataAnalysis
{
    public struct FPoint : IComparable<FPoint>
    {
        public double x;
        public double y;

        public FPoint(double x, double y) { this.x = x; this.y = y; }

        #region IComparable<FPoint> Members

        public int CompareTo(FPoint other)
        {
            return this.x.CompareTo(other.x);
        }

        #endregion
    }

    public struct FRange
    {
        public double low;
        public bool includeLow;
        public double high;
        public bool includeHigh;
        public double attractor;

        public bool Includes(double value)
        {
            bool lowCheck = value.CompareTo(low) > (includeLow ? -1 : 0);
            bool highCheck = value.CompareTo(high) < (includeHigh ? 1 : 0);
            return lowCheck && highCheck;
        }
    }

    public class FuncFilter
    {
        public static IEnumerable<FPoint> Filter(
            IEnumerable<FPoint> points,
            IEnumerable<FRange> filter)
        {
            if (filter == null)
            {
                foreach (FPoint p in points)
                    yield return p;
            }
            else
            {
                FRange range = new FRange();
                List<FPoint> accum = new List<FPoint>(); // we could use a sum and count instead of a list for performance

                List<FPoint> sortedPoints = new List<FPoint>(points);
                sortedPoints.Sort();

                var p = sortedPoints.GetEnumerator();
                var e = filter.GetEnumerator();

                while (p.MoveNext())
                {
                    FPoint point = p.Current;

                    // if p is not in the current range, emit the P(range.attractor, median(p.y)) of the current range
                    // if p is in current range, accum into a list
                    if (range.Includes(point.x))
                    {
                        accum.Add(point);
                    }
                    else
                    {
                        if (accum.Count > 0)
                        {
                            yield return new FPoint(range.attractor, accum.Select(q => q.y).Average());
                            accum.Clear();
                        }

                        while (true)
                        {
                            if (e.MoveNext())
                            {
                                if (e.Current.Includes(point.x))
                                {
                                    range = e.Current;
                                    accum.Add(point);
                                    break;
                                }
                            }
                            else
                            {
                                yield break;
                            }
                        }
                    }
                }

                if (accum.Count > 0)
                    yield return new FPoint(range.attractor, accum.Select(q => q.y).Average());
            }
        }
    }
}
