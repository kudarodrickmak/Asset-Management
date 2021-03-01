using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Collections;

namespace AssetManagement
{
    public partial class DeviceBookings : System.Web.UI.Page
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
                    lblsuccess.Visible = false;
                    lblerror.Visible = false;
                    FillGridView();
                    GridView1.Visible = false;

                }
            }

            else
            {
                Response.Redirect("~/Login.aspx");
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }


        public void Clear()
        {
            //HiddenField1.Value = "";
            ReqID.Text = TextBox1.Text = ReqType.Text = Date.Text = RDate.Text = ST.Text = ET.Text =  Device.Text= Email.Text =  "";
            Button2.Text = "OK";
            lblsuccess.Text = lblerror.Text = "";

        }
        public int ReturnMemberID(SqlConnection con)
        {
            SqlCommand sqlCmd = new SqlCommand("IDofUser", con);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter UserID = new SqlParameter("@UserName", Session["CurUser"]);
            sqlCmd.Parameters.Add(UserID);
            return (int)sqlCmd.ExecuteScalar();
        }

        protected void CustDateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = (DateTime.TryParse(args.Value, out dt)
                            && dt > DateTime.Today);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            string FirstNameQuery = "select FName from Users where Username ='" + Session["CurUser"] + "';";
            string LastNameQuery = "select LName from Users where Username ='" + Session["CurUser"] + "';";
            SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
            string FName = FNAmeCom.ExecuteScalar().ToString();
            SqlCommand LNameCom = new SqlCommand(LastNameQuery, con);
            string LName = LNameCom.ExecuteScalar().ToString();

            int UserI = ReturnMemberID(con);

            if (Button2.Text == "OK")
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    SqlCommand sqlCmd = new SqlCommand("DeviceBook", con);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@RequestID", ReqID.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Module", TextBox1.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@RType", ReqType.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@SDate", Date.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ReturnDate", Date.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@STime", ST.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ETime", ET.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Device", Device.Text.Trim());
                    //sqlCmd.Parameters.AddWithValue("@Device", Device.Text.Trim());
                    //sqlCmd.Parameters.AddWithValue("@Cost", Cost.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserID", UserI);
                    sqlCmd.Parameters.AddWithValue("@Status", "On Loan");

                    string changeConfirm = "UPDATE Request  SET [Confirmed] = 'Confirmed' Where [Request_ID] =" + "'" + ReqID.Text.Trim() + "'";

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

                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("amtcompsci@gmail.com");
                    msg.To.Add(Email.Text);
                    msg.Subject = "Asset Booking Confirmation Computing Sciences Department";

                    msg.Body = string.Format(" Hello!  " + FName + " " + LName + " has confirmed your request for a device. Collect your device from room 2045 main building second floor.  For more details, contact Hayley Irvine.  Regards !", HttpContext.Current.Request.Url.Host);

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

                    int ReturnCode = (int)sqlCmd.ExecuteScalar();
                    if (ReturnCode == -1)
                    {
                        // Booking exists.
                        lblsuccess.ForeColor = System.Drawing.Color.Green;
                        lblsuccess.Text = "Booking Already Exists.";
                        lblsuccess.Visible = true;
                    }
                    else
                    {
                        lblerror.ForeColor = System.Drawing.Color.Green;
                        lblerror.Text = "Booking Saved Successfully";
                        lblerror.Visible = true;
                    }
                }


                lblsuccess.Text = "Booking Saved Successfully";
                

                FillGridView();
                con.Close();
                Response.Write("<script>alert('Device Booking Successfully Confirmed.');</script>");
                Clear();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            Label3.Visible = true;
        }
        void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("RViewAllD", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;


            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();


        }

        protected void lnk_OnClick(object sender, EventArgs e)
        {
            int Request_ID = Convert.ToInt32((sender as LinkButton).CommandArgument.Trim());
            if (con.State == ConnectionState.Closed)
                con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("RViewByIDD", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@RequestID", Request_ID);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();

            ReqID.Text = dtbl.Rows[0]["Request_ID"].ToString();
            TextBox1.Text = dtbl.Rows[0]["Mod_Code"].ToString();
            ReqType.Text = dtbl.Rows[0]["Request_Type"].ToString();
            Date.Text = dtbl.Rows[0]["Start_Date"].ToString();
            RDate.Text = dtbl.Rows[0]["End_Date"].ToString();
            ST.Text = dtbl.Rows[0]["Start_Time"].ToString();
            ET.Text = dtbl.Rows[0]["End_Time"].ToString();
            //Lab.Text = dtbl.Rows[0]["Lab_Num"].ToString();
            Device.Text = dtbl.Rows[0]["MoveableAsset"].ToString();
            Email.Text = dtbl.Rows[0]["BookingEmail"].ToString();


        }


    }
}