using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Data;

namespace AssetManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx", false);
            }


        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["AMT_DBConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("splogin", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter UserName = new SqlParameter("@UserName", TextBoxUN.Text);
                SqlParameter Password = new SqlParameter("@Password", TextBoxPass.Text);

                cmd.Parameters.Add(UserName);
                cmd.Parameters.Add(Password);

                con.Open();
                int ReturnCode = (int)cmd.ExecuteScalar();
                if (ReturnCode == 1)
                {
                    Session["CurUser"] = TextBoxUN.Text;

                    string FirstNameQuery = "select FName from Users Where UserName= '" + TextBoxUN.Text + "'";
                    SqlCommand FNameCom = new SqlCommand(FirstNameQuery, con);
                    string FName = FNameCom.ExecuteScalar().ToString().Replace(" ", "");

                    Session["CurFName"] = FName;

                    string SurnameQuery = "select LName from Users Where UserName= '" + TextBoxUN.Text + "'";
                    SqlCommand SurnameCom = new SqlCommand(SurnameQuery, con);
                    string LName = SurnameCom.ExecuteScalar().ToString();

                    Session["CurLName"] = LName;

                    string UserIDQuery = "select User_ID from Users Where UserName= '" + TextBoxUN.Text + "'";
                    SqlCommand UserIDCom = new SqlCommand(UserIDQuery, con);
                    int UserID = (int)UserIDCom.ExecuteScalar();
                    Session["CurUserID"] = UserID;


                    Response.Redirect("~/Default.aspx");

                }

                else
                {
                    InfoLabel.Text = "Incorrect email address/password.";
                }
              

                
            }
        }
    }
}