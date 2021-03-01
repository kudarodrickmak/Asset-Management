using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AssetManagement
{
    public partial class ViewBookings : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896");
        protected void Page_Load(object sender, EventArgs e)
        {
            //KLab.SelectedValue;
            if (Session["CurUser"] != null)
            {
                if (!IsPostBack)
                {
                    

                }
            }

            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Print", "Print()", true);
            btnPrint.Visible = false;
        }
    }
}