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
    public partial class productView : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //new string Title;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string Title;
            //string id;

            if (!IsPostBack)
            {
                //if (Request.QueryString["title"] != null)
                //{
                //    //name.InnerText = Request.QueryString["product_name"];
                //    //Title = Request.QueryString["title"];
                //    //intro.InnerText = Request.QueryString["intro"];
                //    //id = Request.QueryString["Id"];
                //}
                try
                {
                    //SqlConnection con = new SqlConnection(strcon);
                    //if (con.State == ConnectionState.Closed)
                    //{
                    //    con.Open();
                    //}

                    //SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[StockDetails] INNER JOIN[dbo].[MappingTable] ON [dbo].[StockDetails].[Id] = [dbo].[MappingTable].[stock_id] WHERE [dbo].[MappingTable].[product_id] like '10003'; ", con);
                    //SqlDataAdapter da = new SqlDataAdapter(cmd);
                    //DataTable dt = new DataTable();
                    //da.Fill(dt);
                    //DropDownList3.DataSource = dt;
                    //DropDownList3.DataBind();

                    //intro.InnerText = dt.Rows[0]["intro_para"].ToString();
                    //para1.InnerText = dt.Rows[0]["para1"].ToString();
                    //para2.InnerText = dt.Rows[0]["para2"].ToString();
                    //int length = 6;
                    //for (int i = 0; i < length; i++)
                    //{
                    //    //&#9734;&#9734;&#9734;&#9734;&#9734;
                    //    star_rating.Text = star_rating.Text + "&#9734;";

                    //}


                    

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }

        }
        

    }
}

