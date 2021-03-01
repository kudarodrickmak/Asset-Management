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
using System.Collections;


namespace AssetManagement
{
    public partial class About : Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = postgrad.nmmu.ac.za; Initial Catalog = AMT_DB; Persist Security Info=True; User ID = AMT_DB_user; Password=Maina25896");
        protected void Page_Load(object sender, EventArgs e)
        {
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

        protected void CustDateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = (DateTime.TryParse(args.Value, out dt)
                            && dt > DateTime.Today);
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {

            Page.Validate();
            if (Page.IsValid) { 
                if (con.State == ConnectionState.Closed)
                con.Open();
            SqlCommand sqlCmd = new SqlCommand("SpRequestL", con);
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
            msg.Subject = "New Request Received from " + LName;

            msg.Body = string.Format(" Hello!  " + FName + " " + LName + "  has sent a new request to you. Please click on the link to visit the 'The Asset Management Tool' Request Page :)  <a href='http://localhost:51244/Login'> The Cave </a>   Regards !", HttpContext.Current.Request.Url.Host);

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
            sqlCmd.Parameters.AddWithValue("@LabNo", Labss.Text.Trim());
            
            sqlCmd.Parameters.AddWithValue("@RequestType", DropDownList2.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@BookingEmail", bEmail.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@AdditionalInfor", Info.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@UserID", ReturnUserID(con));
            sqlCmd.Parameters.AddWithValue("@Confirm", "Not Confirmed");
            sqlCmd.ExecuteNonQuery();

            con.Close();

             Response.Write("<script>alert('Request Sent Successfully');</script>");

                lblStatus.ForeColor = System.Drawing.Color.Green;
             lblStatus.Text = "Request Sent";
            }
            else
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Request not sent! Please enter all the required information above!";
            }
            Clear();
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
            Labss.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
            Info.Text = "";
            bEmail.Text = "";
            Label1.Text = "";
            Label1.Visible = false;
            Label2.Visible = false;
            lblStatus.Visible = false;
           

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

            Clear();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Page.Validate();
            if (Page.IsValid)
            {
                Label1.Text = CheckAvail();
                Label2.Visible = true;
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
                    string etime = "select dtend from BookingDetails where Lab ='" + Labss.Text.Trim() + "';";
                    string edatey = "select Date from BookingDetails where Lab ='" + Labss.Text.Trim() + "';";
                    
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



                    Boolean available = true;
                    for (int i = 0; i < allRecords.Length; i++)
                    {
                        ClassName cur = new ClassName(DropDownList3.Text.Trim(), DropDownList4.Text.Trim(), startddate.Text.Trim());

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
                for (int k = 0; k < tempList.Count; k++)
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
            public bool compareDates(String date1, String date2)
            {
                char[] date1CharArray = date1.ToCharArray();
                char[] date2CharArray = date2.ToCharArray();

                for (int i = 0; i <= 9; i++)
                {
                    if ((i != 4) && (i != 7))
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
                if (this.compareDates("" + comparing.dDate, "" + this.dDate))
                {
                    //NEW METHOD
                    // (query-- get list back) get list of dates in the bookingsdetail tb where the date== comparing.dDate
                    var list = GetBookings(comparing.dDate);

                    foreach (var item in list)
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

        
    }


}