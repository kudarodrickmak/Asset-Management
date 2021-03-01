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
    public partial class Bookings : System.Web.UI.Page
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
                    GridView1.Visible =false;
                    Label4.Visible = false;
                    
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
            HiddenField1.Value = "";
            ReqID.Text = TextBox1.Text = ReqType.Text = Date.Text = ST.Text = ET.Text = Lab.Text =  Email.Text = Cost.Text = Label1.Text = Label4.Text ="";
            Button2.Text = "OK";
            lblsuccess.Text = lblerror.Text = "";
            Label4.Visible = false;

        }


        protected void CustDateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = (DateTime.TryParse(args.Value, out dt)
                            && dt > DateTime.Today);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
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
                    SqlCommand sqlCmd = new SqlCommand("NewBookinggg", con);
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.AddWithValue("@RequestID", ReqID.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Module", TextBox1.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@RType", ReqType.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Date", Date.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@STime", ST.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@ETime", ET.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Lab", Lab.Text.Trim());
                    //sqlCmd.Parameters.AddWithValue("@Device", Device.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Cost", Cost.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@UserID", UserI);

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

                    msg.Body = string.Format(" Hello!  " + FName + " " + LName + " has confirmed your request. For more details, contact Hayley Irvine.  Regards !", HttpContext.Current.Request.Url.Host);

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
                    lblsuccess.Text = "Booking Saved Successfully";

                    int ReturnCode = (int)sqlCmd.ExecuteScalar();
                    if (ReturnCode == -1)
                    {
                        // Booking exists.
                        lblsuccess.ForeColor = System.Drawing.Color.Green;
                        lblsuccess.Text = "You already saved this request.";
                        lblsuccess.Visible = true;
                    }
                    else
                    {
                        lblerror.ForeColor = System.Drawing.Color.Green;
                        lblerror.Text = "Request confirmed Successfully";
                        lblerror.Visible = true;
                    }

                    Label4.Visible = false;
                }



                FillGridView();

                con.Close();
                Response.Write("<script>alert('Booking Confirmed Successfully');</script>");

                Clear();
            }


        }

        public int ReturnMemberID(SqlConnection con)
        {
            SqlCommand sqlCmd = new SqlCommand("IDofUser", con);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter UserID = new SqlParameter("@UserName", Session["CurUser"]);
            sqlCmd.Parameters.Add(UserID);
            return (int)sqlCmd.ExecuteScalar();
        }

        void FillGridView()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();

            SqlDataAdapter sqlDa = new SqlDataAdapter("RViewAllLab", con);
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
            SqlDataAdapter sqlDa = new SqlDataAdapter("RViewByID", con);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@RequestID", Request_ID);

            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            con.Close();
            
            ReqID.Text = dtbl.Rows[0]["Request_ID"].ToString();
            TextBox1.Text = dtbl.Rows[0]["Mod_Code"].ToString();
            ReqType.Text = dtbl.Rows[0]["Request_Type"].ToString();
            Date.Text = dtbl.Rows[0]["Start_Date"].ToString();
            ST.Text = dtbl.Rows[0]["Start_Time"].ToString();
            ET.Text = dtbl.Rows[0]["End_Time"].ToString();
            Lab.Text = dtbl.Rows[0]["Lab_Num"].ToString();
           // Device.Text = dtbl.Rows[0]["MoveableAsset"].ToString();
            Email.Text = dtbl.Rows[0]["BookingEmail"].ToString();

            
        }

        

        protected void Button3_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                Label1.Text = CheckAvail();
                Label4.Visible = true;
            }
        }

        string CheckAvail()
        {
            ArrayList list2 = new ArrayList();
            list2.Add("1");
            list2.Add("2");
            list2.Add("3");
            list2.Add("4");
            list2.Add("5");
            list2.Add("6");
            list2.Add("Amazon");
            list2.Add("Seminar Room");
                                                          
            ArrayList tempList = new ArrayList();

            if (con.State == ConnectionState.Closed)

                con.Open();
            {


                for (int p = 0; p < list2.Count; p++)
                {
                    Console.WriteLine(p);
                
                //  SqlDataAdapter sqlDa = new SqlDataAdapter("CheckAvailabity", con);
                string FirstNameQuery = "select dtstart,dtend,Date from BookingDetails where Lab ='" + list2[p] + "';";
                //  string FirstNameQuery = "select dtstart,dtend,Date from BookingDetails where Lab =" + DropDownList3.Text.Trim() +" And Date="+TextBox1.Text.Trim()+";";
                string etime = "select dtend from BookingDetails where Lab ='" + Lab.Text.Trim() + "';";
                string edatey = "select Date from BookingDetails where Lab ='" + Lab.Text.Trim() + "';";
                // string FirstNameQuery = "select FName from Users where Username ='" + Session["CurUser"] + "';";
                /*
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("@Date", TextBox1.Text.Trim());
                sqlDa.SelectCommand.Parameters.AddWithValue("@Stime", DropDownList1.Text.Trim());
                sqlDa.SelectCommand.Parameters.AddWithValue("@ETime", DropDownList2.Text.Trim());
                sqlDa.SelectCommand.Parameters.AddWithValue("@Lab", DropDownList3.Text.Trim());
                */
                SqlCommand FNAmeCom = new SqlCommand(FirstNameQuery, con);
                SqlCommand edateCom = new SqlCommand(etime, con);
                SqlCommand edateyCom = new SqlCommand(edatey, con);
                ClassName[] allRecords = null;

                ArrayList time = new ArrayList();
                using (var command = new SqlCommand(FirstNameQuery, con))
                {

                    using (var reader = command.ExecuteReader())
                    {
                        var list = new List<ClassName>();
                        while (reader.Read())
                            list.Add(new ClassName("" + reader.GetTimeSpan(0), "" + reader.GetTimeSpan(1), "" + reader.GetDateTime(2)));
                        allRecords = list.ToArray();
                        reader.Close();
                    }

                   
                }


                //list2.Add("Seminar Room");

                Boolean available = true;
                for (int i = 0; i < allRecords.Length; i++)
                {
                    ClassName cur = new ClassName(ST.Text.Trim(), ET.Text.Trim(), Date.Text.Trim());

                    // allRecords[i].sTime.
                    if (cur.overlap(allRecords[i]))
                    {

                        available = false;
                    }


                }
                if (available)
                {
                        tempList.Add(list2[p]);
                }

                

            }
                string ToSend = "";
                for(int k = 0; k < tempList.Count; k++)
                {
                    ToSend += tempList[k];
                    ToSend += ", ";
                   // ToSend += "Available labs";
                }
                
                DataTable dtbl = new DataTable();
                
                con.Close();
                return ToSend;
                

            }
        }
     
        public class ClassName
        {
            SqlConnection con = new SqlConnection(@"Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896");


            public string sTime { get; set; }
            public string eTime { get; set; }
            public string dDate { get; set; }
            /*
            public ClassName(string sTime, string eTime)
            {
                this.sTime = sTime;
                this.eTime = eTime;
            }
            */
            public ClassName(string sTime, string eTime, string dDate)
            {
                this.sTime = sTime;
                this.eTime = eTime;
                this.dDate = dDate;
            }

            public int sHour()
            {
                Char[] list = sTime.ToCharArray();
                return int.Parse(list[0] + "" + list[1]);
            }
            public int sMinute()
            {
                Char[] list = sTime.ToCharArray();
                return int.Parse(list[3] + "" + list[4]);
            }
            public int eHour()
            {
                Char[] list = sTime.ToCharArray();
                return int.Parse(list[0] + "" + list[1]);
            }
            public int eMinute()
            {
                Char[] list = sTime.ToCharArray();
                return int.Parse(list[3] + "" + list[4]);
            }
            public bool compareDates(String date1,String date2)
            {
                char[] date1CharArray = date1.ToCharArray();
                char[] date2CharArray = date2.ToCharArray();

                for(int i = 0; i <= 9; i++)
                {
                    if ((i != 4)&&(i!=7))
                    {
                        if (!date1CharArray[i].Equals(date2CharArray[i]))
                        {
                            return false;
                        }
                    }
                   
                }
                return true;
            }
            public List<ClassName> GetBookings(string date)
            {
                if (con.State == ConnectionState.Closed)
                    con.Open();

                var list = new List<ClassName>();

              //  string query = "'select dtstart,dtend,Date from BookingDetails where Date=" + date +"'";
                string query = "select dtstart,dtend,Date from BookingDetails where Date ='" + date + "';";
                using (var command = new SqlCommand(query, con))
                {

                    using (var reader = command.ExecuteReader())
                    {

                        while (reader.Read())
                            list.Add(new ClassName("" + reader.GetTimeSpan(0), "" + reader.GetTimeSpan(1), "" + reader.GetDateTime(2)));

                        reader.Close();
                    }


                }
                return list;
            }


            //NEW METHOD
            // a method that takes date as input
            // query where date==inputDate in the bookingsDetails
            //return list



            public Boolean overlap(ClassName comparing)
            {
                if (this.compareDates(""+comparing.dDate,""+this.dDate))
                {
                    //NEW METHOD
                    // (query-- get list back) get list of dates in the bookingsdetail tb where the date== comparing.dDate
                    var list = GetBookings(comparing.dDate);

                    foreach(var item in list)
                    {
                        //change this.shour to item.shour... and the rest as well
                        if (comparing.sHour() < item.sHour() && (comparing.eHour() < item.sHour()))
                        {
                            return false;
                        }
                        else if (comparing.sHour() == item.sHour() && comparing.sMinute() < item.sMinute() && (comparing.eHour() < item.sHour()))
                        {
                            return false;
                        }
                        else if (comparing.sHour() < item.sHour() && (comparing.eHour() == item.sHour()) && comparing.eMinute() < item.eMinute())
                        {
                            return false;
                        }
                        else if (comparing.sHour() == item.sHour() && comparing.sMinute() < item.sMinute() && (comparing.eHour() == item.sHour()) && comparing.eMinute() < item.eMinute())
                        {
                            return false;
                        }
                        return true;
                    }
                    //for loop of list// or foreach
                    //do this hour/min/sec 

                }
                //if date doesnt exist then just add it
               return false;
            }


        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            Label3.Visible = true;
        }

        
    }
}