using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ShoppingWebsite.Seller
{
    public partial class SellerProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("~/Seller/SellerProfile.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getSellerPersonalDetails();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            updateSellerPersonalDetails();
        }


        // user defined function

        void connect()
        {
            con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void updateSellerPersonalDetails()
        {

            try
            {
                connect();

                SqlCommand cmd = new SqlCommand("UPDATE seller_info SET firstname=@firstname, lastname=@lastname, contact=@contact, adhar_no=@adhar_no, email=@email, address=@address, state=@state, city=@city WHERE Id='" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);

                cmd.Parameters.AddWithValue("@firstname", firstName.Text.Trim());
                cmd.Parameters.AddWithValue("@lastname", lastName.Text.Trim());
                cmd.Parameters.AddWithValue("@adhar_no", adhar_no.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", contact.Text.Trim());
                cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                cmd.Parameters.AddWithValue("@address", address.Text.Trim());
                cmd.Parameters.AddWithValue("@state", state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", city.Text.Trim());

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getSellerPersonalDetails();
                }
                else
                {
                    Response.Write("<script>alert('Invalid entry');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex + ");</script>");
            }
        }

        void getSellerPersonalDetails()
        {
            try
            {
                connect();

                SqlCommand cmd = new SqlCommand("SELECT * from seller_info where Id='" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                firstName.Text = dt.Rows[0]["firstname"].ToString();
                lastName.Text = dt.Rows[0]["lastname"].ToString();
                adhar_no.Text = dt.Rows[0]["adhar_no"].ToString();
                contact.Text = dt.Rows[0]["contact"].ToString();
                email.Text = dt.Rows[0]["email"].ToString();
                address.Text = dt.Rows[0]["address"].ToString();
                state.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                city.Text = dt.Rows[0]["city"].ToString();
                username.Text = dt.Rows[0]["username"].ToString();
                password.Attributes["value"] = dt.Rows[0]["password"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert( "+ ex + ");</script>");
            }
        }

        protected void cnfpsw_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cnfpsw.Text))
            {
                connect();

                SqlCommand cmd = new SqlCommand("SELECT password from seller_info where Id = '" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                //cnfpsw.Attributes["value"] = cnfpsw.Text;
                if (dt.Rows[0]["password"].ToString() == cnfpsw.Text)
                {
                    lblmsg.Visible = true;
                    pswsucc.Visible = true;
                    check.Attributes.Add("class", "fas fa-check-circle text-success");
                    lblmsg.Text = "";
                    btnnext1.Enabled = true;
                }
                else
                {
                    lblmsg.Visible = true;
                    pswsucc.Visible = true;
                    check.Attributes.Add("class", "fas fa-times-circle text-danger");
                    lblmsg.Text = "Incorrect Password..!!";
                    username.Focus();
                }
            }
            else
            {
                lblmsg.Visible = false;
                pswsucc.Visible = false;
                btnnext1.Enabled = false;
            }
        }

        protected void btnnext1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(passwordconfirm.Text))
            {
                connect();

                SqlCommand cmd = new SqlCommand("update seller_info set password=@password where Id = '" + Session["Id"].ToString() + "' and username = '" + Session["username"].ToString() + "'; ", con);
                
                passwordconfirm.Attributes["value"] = passwordconfirm.Text;
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
                    Response.Write("<script>alert('Invalid entry');</script>");
                }
            }
        }

    }
}