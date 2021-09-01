using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection

namespace ShoppingWebsite
{
    public partial class Categories : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            connect();
            if (!Page.IsPostBack)
            {
                BindCategory1();
                BindCategory2();
                BindCategory3();
                BindCategory4();
            }
            
        }
        protected void connect()
        {
            con = new SqlConnection(strcon); //strcon is Connection String
            con.Open();
        }
        protected void BindCategory1()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] = 'Women';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepCat1.DataSource = dt;
            RepCat1.DataBind();
        }
        protected void BindCategory2()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] like 'Men';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepCat2.DataSource = dt;
            RepCat2.DataBind();
        }
        protected void BindCategory3()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] like 'Kids';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepCat3.DataSource = dt;
            RepCat3.DataBind();
        }
        protected void BindCategory4()
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[Category] where [name] like 'Accessories';", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RepCat4.DataSource = dt;
            RepCat4.DataBind();
        }
    }
}