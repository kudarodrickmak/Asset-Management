using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagement
{
    public partial class SiteMaster : MasterPage
    {
        string userFName;
        string userName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session ["CurUser"] != null)
            {
                userFName = Session["CurFName"].ToString();
                userName = Session["CurUser"].ToString();
                CurrentUserName.Text = userName;

            }
            else
            {
                Response.Redirect("Login.aspx");
            

            }

        }
    }
}