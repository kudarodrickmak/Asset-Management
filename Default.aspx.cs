using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using DHTMLX.Scheduler;


namespace AssetManagement
{
    public partial class _Default : Page
    {
        string userFName;
        string userLName;
        string username;
        int UserID;
        //public DHXScheduler Scheduler { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (Session["CurUser"] != null)
            {

                userFName = Session["CurFName"].ToString();
                userLName = Session["CurLName"].ToString();
                username = Session["CurUser"].ToString();

                UserID = (int)Session["CurUserID"];
                CurFirstName.Text = userFName + " " + userLName;

                string cs = ConfigurationManager.ConnectionStrings["AMT_DBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    Session["UserType"] = MemberType(con).ToString();

                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            //this.Scheduler = new DHXScheduler();

            //Scheduler.InitialDate = new DateTime(2016, 11, 24);// the initial data of Scheduler

            //Scheduler.Config.first_hour = 8;//the minimum value of the hour scale
            //Scheduler.Config.last_hour = 19;//the maximum value of the hour scale
            //Scheduler.Config.time_step = 30;//the scale interval for the time selector in the lightbox
            //Scheduler.Config.limit_time_select = true;//sets max and min values for the time selector in the lightbox to the values of the last_hour and first_hour options

            //Scheduler.DataAction = this.ResolveUrl("~/Data.ashx");// the handler which defines loading data to Scheduler
            //Scheduler.SaveAction = this.ResolveUrl("~/Save.ashx");// the handler which defines create/update/delete logic
            //Scheduler.LoadData = true;
            //Scheduler.EnableDataprocessor = true;
        }

            public string MemberType(SqlConnection con)
            {
                SqlCommand cmda = new SqlCommand("UType", con);
                cmda.CommandType = CommandType.StoredProcedure;

                cmda.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["CurUserID"]));

                return cmda.ExecuteScalar().ToString();
            }
        }

    //protected void DateChanged(object sender, EventArgs e)
    //{
    //    // calendarsubjects.DataSource = calendar.SelectedDate.Day.ToString();
    //    calendarsubjects.InnerHtml = Calendar1.SelectedDate.ToString("ddd");
    //    // calendarsubjects.DataBind();

    //}
}