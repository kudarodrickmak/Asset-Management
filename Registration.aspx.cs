using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace AssetManagement
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {

                switch (IsUserAndEmailExists(Server.HtmlEncode(TextBoxUN.Text), Server.HtmlEncode(TextBoxEmail.Text)))
                {
                    case 0:
                        AddUser();
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        break;
                    case -1:
                        InfoLabel.Text = "<p style = 'color:red'>Both email & username are exists<p>";
                        break;
                    case -2:
                        InfoLabel.Text = "<p style = 'color:red'>Email Exists<p>";
                        break;
                    case -3:
                        InfoLabel.Text = "<p style = 'color:red'>Username Exists<p>";
                        break;
                    default:
                        InfoLabel.Text = "<p style = 'color:red'>Something went wrong!! Please Try again later<p>";
                        break;
                }

            }
            else
            {
                LoadingImage.Attributes.CssStyle.Add("opacity", "0");
                submit.Attributes.CssStyle.Add("cursor", "allowed");
            }

        }

        protected void AddUser()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AMT_DBConnectionString"].ConnectionString;
            SqlConnection sqlConnect = new SqlConnection(connectionString) ;

            try
            {

                sqlConnect.Open();

                string SQLCommand = "Insert into Users (Username, FName, LName, EmailAddress, Password, NMUNo) values(@username, @firstname, @surname, @email, @pass, @nmuno)";
                SqlCommand sqlcommand = new SqlCommand(SQLCommand, sqlConnect);
                sqlcommand.Parameters.AddWithValue("@username", Server.HtmlEncode(TextBoxUN.Text));
                sqlcommand.Parameters.AddWithValue("@firstname", Server.HtmlEncode(fname.Text));
                sqlcommand.Parameters.AddWithValue("@surname", Server.HtmlEncode(Surname.Text));
                sqlcommand.Parameters.AddWithValue("@email", Server.HtmlEncode(TextBoxEmail.Text));
                sqlcommand.Parameters.AddWithValue("@pass", Server.HtmlEncode(TextBoxPass.Text));
                sqlcommand.Parameters.AddWithValue("@nmuno", Server.HtmlEncode(NMUNo.Text));

                sqlcommand.ExecuteNonQuery();
                sqlConnect.Close();

            }
            catch (Exception ex)
            {
                InfoLabel.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
            }
            finally
            {
                sqlConnect.Close();
            }

        }


        protected int IsUserAndEmailExists(string username, string email)
        {
            string stringconnection = ConfigurationManager.ConnectionStrings["AMT_DBConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(stringconnection);

            try
            {
                string command_string = "ProcIsUserExist @Uname, @EId";
                SqlCommand sqlcom = new SqlCommand(command_string, sqlconn);
                sqlcom.Parameters.AddWithValue("@Uname", username);
                sqlcom.Parameters.AddWithValue("@Eid", email);

                sqlconn.Open();
                int n = Convert.ToInt32(sqlcom.ExecuteScalar());
                sqlconn.Close();
                return n;
            }
            catch (Exception ex)
            {
                InfoLabel.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
                return -5;
            }
            finally
            {
                sqlconn.Close();
            }
        }
    }
}