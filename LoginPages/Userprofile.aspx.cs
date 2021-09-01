using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection
using System.Diagnostics;

namespace ShoppingWebsite.LoginPages
{
    public partial class Userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.Listeners.Add(new TextWriterTraceListener(Console.Out));
            Debug.AutoFlush = true;

            if (!Page.IsPostBack)
            {
                try
                {
                    if ((string)Session["username"] == "" || Session["username"] == null)
                    {
                        Response.Write("<script>alert('Session Expired Login Again');</script>");
                        Response.Redirect("~/LoginPages/LoginUser.aspx");
                    }
                    else
                    {
                        Debug.WriteLine("Profile Opened"); 
                        GetUserPersonalDetails();
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert(" + ex + ");</script> ");
                    Debug.WriteLine(ex);
                }
            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            
            UpdateUserPersonalDetails();
        }


        // user defined function

        void Connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void UpdateUserPersonalDetails()
        {

            try
            {
                Connect();

                SqlCommand cmd = new SqlCommand("UPDATE Customer SET fname=@fname, lname=@lname, contact=@contact, email=@email, address=@address, state=@state, city=@city, pincode=@pincode WHERE Id='" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);

                cmd.Parameters.AddWithValue("@fname", firstName.Text.Trim());
                cmd.Parameters.AddWithValue("@lname", lastName.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", pincode.Text.Trim());

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {

                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    GetUserPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex + ");</script>");
            }
        }


        void GetUserPersonalDetails()
        {
            try
            {
                Debug.WriteLine("Getting Info");

                con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                Debug.WriteLine("Connection Open");

                SqlCommand cmd = new SqlCommand("SELECT * from Customer where Id='" + (string)Session["Id"] + "' and username = '" + (string)Session["username"] + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Debug.WriteLine("Got Info");

                //Debug.WriteLine(dt.Rows[0]["fname"].ToString() + dt.Rows[0]["lname"].ToString() + dt.Rows[0]["contact"].ToString() + dt.Rows[0]["email"].ToString() + dt.Rows[0]["address"].ToString() + dt.Rows[0]["state"].ToString().Trim() + dt.Rows[0]["city"].ToString() + dt.Rows[0]["pincode"].ToString());
                //Debug.WriteLine(dt.Rows[0]["username"].ToString());

                firstName.Text = dt.Rows[0]["fname"].ToString();
                lastName.Text = dt.Rows[0]["lname"].ToString();
                contact.Text = dt.Rows[0]["contact"].ToString();
                email.Text = dt.Rows[0]["email"].ToString();
                address.Text = dt.Rows[0]["address"].ToString();
                state.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                city.Text = dt.Rows[0]["city"].ToString();
                pincode.Text = dt.Rows[0]["pincode"].ToString();
                //Username.Text = dt.Rows[0]["username"].ToString();
                Username.Text = (string)Session["username"];
                password.Attributes.Add("value", dt.Rows[0]["password"].ToString());

                Debug.WriteLine("Added Info");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                Debug.WriteLine("Something went wrong");
                Debug.WriteLine(ex);
            }
        }

        protected void Oldpsw_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Oldpsw.Text))
            {
                Connect();

                //SqlCommand cmd = new SqlCommand("SELECT password from Customer where Id = '" + (string)Session["Id"] + "' and username = '" + (string)Session["username"] + "'; ", con);
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                //DataTable dt = new DataTable();
                //da.Fill(dt);

                SqlCommand cmd = new SqlCommand("select * from Customer where Id = '" + (string)Session["Id"] + "' and password=@psw;", con);
                cmd.Parameters.AddWithValue("@psw", Oldpsw.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    //cnfpsw.Attributes["value"] = cnfpsw.Text;
                //    if ((string)dt.Rows[0]["password"] == Oldpsw.Text)
                //{
                    lblmsg.Visible = true;
                    pswsucc.Visible = true;
                    check.Attributes.Add("class", "fas fa-check-circle text-success");
                    lblmsg.Text = "";
                    Btnnext1.Enabled = true;
                }
                else
                {
                    lblmsg.Visible = true;
                    pswsucc.Visible = true;
                    check.Attributes.Add("class", "fas fa-times-circle text-danger");
                    lblmsg.Text = "Incorrect Password..!!";
                    Btnnext1.Enabled = false;
                    Oldpsw.Focus();
                }
            }
            else
            {
                lblmsg.Visible = false;
                pswsucc.Visible = false;
                Btnnext1.Enabled = false;
            }
        }

        protected void Btnnext1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(passwordconfirm.Text))
            {
                Connect();

                SqlCommand cmd = new SqlCommand("update Customer set password=@password where Id = '" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                //passwordconfirm.Attributes["value"] = passwordconfirm.Text;
                cmd.Parameters.AddWithValue("@password", passwordconfirm.Text);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    //Response.Write("<script>alert('Password Updated Successfully');</script>");
                    updCheck.Visible = true;
                }
                else
                {
                    Debug.WriteLine("Invalid entry");
                }
            }
        }
    }
}