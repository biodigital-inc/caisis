using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class User_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildUserSortLinks();
        }

        private void BuildUserSortLinks()
        {
            string sortCol = BOL.User.UserLastName;
            string sortDir = "ASC";
            string qSort = Request.QueryString["sortCol"];
            string qDir = Request.QueryString["sortDir"];

            // set sort column from qs
            if (qSort == BOL.User.UserLastName)
            {
                sortCol = BOL.User.UserLastName;
                string lnSort = "DESC";
                if (qDir == "DESC")
                {
                    sortDir = "DESC";
                    lnSort = "ASC";
                }
                BuildSortLink(NameSortLink, sortCol, lnSort);
                BuildSortTitle(NameSortLink, "Last Name", lnSort);
            }
            else if (qSort == BOL.User.UserName)
            {
                sortCol = BOL.User.UserName;
                string nSort = "DESC";
                if (qDir == "DESC")
                {
                    sortDir = "DESC";
                    nSort = "ASC";
                }
                BuildSortLink(UsernameSortLink, sortCol, nSort);
                BuildSortTitle(UsernameSortLink, "Username", nSort);
            }

            // build main users list
            BuildUsers(sortCol, sortDir);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="link"></param>
        /// <param name="sortCol"></param>
        /// <param name="sortDir"></param>
        private void BuildSortLink(HtmlAnchor link, string sortCol, string sortDir)
        {
            link.HRef = "User_List.aspx?sortCol=" + sortCol + "&sortDir=" + sortDir;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="link"></param>
        /// <param name="sortDisplayCol"></param>
        /// <param name="sortDirection"></param>
        private void BuildSortTitle(HtmlAnchor link, string sortDisplayCol, string sortDir)
        {
            string sortDisplayDir = sortDir == "DESC" ? "Descending" : "Ascending";
            UsernameSortLink.Title = "Sort by " + sortDisplayCol + " " + sortDisplayDir;
        }
     
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sortCol"></param>
        /// <param name="sortDir"></param>
        private void BuildUsers(string sortCol, string sortDir)
        {
            var users = BOL.BusinessObject.GetAllAsDataView<BOL.User>();
            users.Sort = sortCol + " " + sortDir;
            UsersRptr.DataSource = users;
            UsersRptr.DataBind();

            // set count
            UsersCount.Text = users.Count.ToString();
        }


    }
}