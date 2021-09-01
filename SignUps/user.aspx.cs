using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection

namespace ShoppingWebsite.SignUps
{
    public partial class user : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnnext2_Click1(object sender, EventArgs e)
        {
            if (checkUserExists())
            {

                Response.Write("<script>alert('User Already Exist with this Username, try other username');</script>");
            }
            else
            {
                signUpNewUser();
            }

        }

        // user defined method
        bool checkUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Customer where username='" + username.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable(); //temp storage
                da.Fill(dt);  //dt is table data got after firing query
                if (dt.Rows.Count >= 1)  //if there are more than 1 data available with same username
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void signUpNewUser()
        {
            Response.Write("<script>alert('Thanks For Signing In');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon); //strcon is Connection String
                //check if connection is open with database or not
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO Customer(fname,lname,contact,email,address,state,city,pincode,username,password) values(@fname,@lname,@contact,@email,@address,@state,@city,@pincode,@username,@password)", con);
                cmd.Parameters.AddWithValue("@fname", firstName.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", lastName.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pincode.Text.Trim());
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                Response.Redirect("../LoginPages/LoginUser.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void CheckUserNameAvailability(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(username.Text))
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Customer where username=@un", con);
                cmd.Parameters.AddWithValue("@un", username.Text);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    checkun.Visible = true;
                    //shwimg.ImageUrl = "Cancel.png";
                    checkicon.Attributes.Add("class", "fas fa-times-circle text-danger");
                    lblmsg.Text = "UserName Already Exist..!!";
                    username.Focus();
                }
                else
                {
                    checkun.Visible = false;
                    unsucc.Visible = true;
                    //shwimg.ImageUrl = "Accepted.png";
                    check.Attributes.Add("class", "fas fa-check-circle text-success");
                }
            }
            else
            {
                checkun.Visible = false;
            }
        }

    }
}