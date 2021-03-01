using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace AssetManagement
{
    public partial class Contact : Page
    {

        SqlConnection con = new SqlConnection(@"Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurUser"] != null)
            {
                if (!IsPostBack)
                {
                    // Calendar1.SelectedDate = DateTime.Now.Date;
                    // BindDetailsView();
                    
                }
            }

            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void CustDateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = (DateTime.TryParse(args.Value, out dt)
                            && dt > DateTime.Today);
        } 
        protected void btnSend_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            { 
                if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("SpRequestD", con);
            sqlCmd.CommandType = CommandType.StoredProcedure;

            string FirstNameQuery = "select FName from Users where Username ='" + Session["CurUser"] + "';";
            string LastNameQuery = "select LName from Users where Username ='" + Session["CurUser"] + "';";
            SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
            string FName = FNAmeCom.ExecuteScalar().ToString();
            SqlCommand LNameCom = new SqlCommand(LastNameQuery, con);
            string LName = LNameCom.ExecuteScalar().ToString();

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("amtcompsci@gmail.com");
            msg.To.Add("s217016960@mandela.ac.za");
            msg.Subject = "New Device Request Received from " + LName;

            msg.Body = string.Format(" Hello!  " + FName + " " + LName + "  has sent a new Device request to you. Please click on the link to visit the 'The Asset Management Tool' Request Page :)  <a href='http://localhost:51244/Login'> The Cave </a>   Regards !", HttpContext.Current.Request.Url.Host);

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            System.Net.NetworkCredential ntwd = new NetworkCredential();
            ntwd.UserName = "amtcompsci@gmail.com"; //Your Email ID  
            ntwd.Password = "25896#atm"; // Your Password  
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = ntwd;
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.Send(msg);

            sqlCmd.Parameters.AddWithValue("@Module", drop1.Text.Trim()); //good
            sqlCmd.Parameters.AddWithValue("@StartDate", startddate.Text.Trim());//good
            sqlCmd.Parameters.AddWithValue("@EndDate", Enddate.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@StartTime", DropDownList3.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@EndTime", DropDownList4.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Devices", DropDownList1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@RequestType", DropDownList2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@BookingEmail", bEmail.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Confirm", "Not Confirmed");
            sqlCmd.Parameters.AddWithValue("@UserID", ReturnUserID(con));

            sqlCmd.ExecuteNonQuery();

            con.Close();
            Clear();

                Response.Write("<script>alert('Request Sent Successfully');</script>");
                lblStatus.ForeColor = System.Drawing.Color.Green;
                lblStatus.Text = "Request Sent";
            }
            else
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Request not sent! Please enter the required information!";
            }
        }

        public int ReturnUserID(SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand("IdUser", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter UserName = new SqlParameter("@username", Session["CurUser"]);
            cmd.Parameters.Add(UserName);

            return (int)cmd.ExecuteScalar();

        }
        public void Clear()
        {
            
            startddate.Text = "";
            Enddate.Text = "";
            DropDownList3.SelectedIndex = 0;
            DropDownList4.SelectedIndex = 0;
            lblStatus.Visible = false;
            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            
            bEmail.Text = "";
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {

            Clear();


        }


    }
}