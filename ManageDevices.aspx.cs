using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AssetManagement
{
    public partial class View_Request : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurUser"] != null)
            {
                if (!IsPostBack)
                {
                    
                    FillGridView();
                    FillGridView2();
                    //lblsuccess.Visible = false;
                    //lblerror.Visible = false;
                    //GridView1.Visible = true;
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }

        }
        void FillGridView2()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("ManageReturns", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;


            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            GridView2.DataSource = dtbl;
            GridView2.DataBind();


        }
        void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("ManageD", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;


            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();


        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int B_ID = Convert.ToInt32((sender as LinkButton).CommandArgument.Trim());
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("OverDueView", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@B_ID", B_ID);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();

            TextBox1.Text = dtbl.Rows[0]["FName"].ToString();
            Email2.Text = dtbl.Rows[0]["BookingEmail"].ToString();
            


        }

        protected void lnk2_OnClick(object sender, EventArgs e)
        {
            int B_ID = Convert.ToInt32((sender as LinkButton).CommandArgument.Trim());
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("Returnss", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@B_ID", B_ID);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
                                   
            con.Close();
            TextBox2.Text = dtbl.Rows[0]["B_ID"].ToString();
            TextBox1.Text = dtbl.Rows[0]["FName"].ToString();
            Email2.Text = dtbl.Rows[0]["BookingEmail"].ToString();
            
            Button1.Text = "Confirm Return";


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("amtcompsci@gmail.com");
                msg.To.Add(Email2.Text);
                msg.Subject = "Overdue Asset!";

                msg.Body = string.Format(" Hello!  " + TextBox1 + "  your asset is overdue. Please return to the administrator's office.  :)  <a href='http://Login'> The  </a>   Regards The AMT Team!", HttpContext.Current.Request.Url.Host);

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
                Response.Write("<script>alert('Notification Sent.');</script>");
                Clear();
            

            if (con.State == ConnectionState.Closed)
                con.Open();

                if (Button1.Text == "Confirm Return")
                {
                    MailMessage msgg = new MailMessage();
                    msgg.From = new MailAddress("amtcompsci@gmail.com");
                    msgg.To.Add(Email2.Text);
                    msgg.Subject = "Confirmation: Device Return";

                    msgg.Body = string.Format(" Hello!  " + TextBox1 + "  This serves to confirm that you have returned the asset loaned out. Thank you. Regards The AMT Team!", HttpContext.Current.Request.Url.Host);

                    SmtpClient smtpp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential ntwdd = new NetworkCredential();
                    ntwdd.UserName = "amtcompsci@gmail.com"; //Your Email ID  
                    ntwdd.Password = "25896#atm"; // Your Password  
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = ntwd;
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Send(msgg);

                    string changeConfirm = "UPDATE DeviceBookings  SET [Status] = 'Returned' Where [B_ID] =" + "'" + TextBox2.Text.Trim() + "'";

                    using (SqlCommand command = new SqlCommand(changeConfirm, con))
                    {

                        using (var reader = command.ExecuteReader())
                        {
                            command.Connection = con;
                            command.CommandText = changeConfirm;
                            command.CommandType = CommandType.Text;

                            reader.Close();
                        }


                    }
                }
                FillGridView2();
                FillGridView();
                con.Close();
                Response.Write("<script>alert('Confirmed.');</script>");
                Clear();                
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Clear();

        }
        public void Clear()
        {
            TextBox2.Text= TextBox1.Text = Email2.Text = TextBox4.Text = "";

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            Clear();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            GridView1.Visible = false;
            Clear();
        }
    }
}