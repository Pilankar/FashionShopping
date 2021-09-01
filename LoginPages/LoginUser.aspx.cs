using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection

namespace ShoppingWebsite.LoginPages
{
    public partial class LoginUser : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //user login
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                //string Password = Page.Request.Form["_password"].ToString();
                password.Attributes["value"] = password.Text.Trim();
                SqlCommand cmd = new SqlCommand("select * from Customer where username COLLATE SQL_Latin1_General_CP1_CS_AS like '" + username.Text.Trim() + "' AND password COLLATE SQL_Latin1_General_CP1_CS_AS like '" + password.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Response.Write("<script>alert('Successful Login');</script>");
                        Session["Id"] = dr.GetValue(0).ToString();
                        Session["username"] = dr.GetValue(9).ToString();
                        Session["firstname"] = dr.GetValue(1).ToString();
                        Session["role"] = "User";
                    }
                    Response.Redirect("~/HomePage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                    //Console.WriteLine(Password);
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex + "');</script>");
                //Console.WriteLine(ex);

            }
        }
    }
}