using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration; //for ConfigurationManager
using System.Data; //for ConnectionState
using System.Data.SqlClient; //for SqlConnection

namespace ShoppingWebsite
{
    public partial class addproduct : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        
        DateTime thisDay;
        string fileName;
        string filePath;
        int prodID, stockID;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //Image
            AddImage();

            //Insert in Table
            try
            {
                //Response.Write("Product");
                AddProductData();

                //Response.Write("Product Done");
                AddStockData();

                //Response.Write("Stock Added");

                Response.Write("<script>alert('Success');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
            //Response.Redirect(Request.Url.AbsoluteUri);
        }


        void AddImage()
        {
            //Extract Image File Name.
            fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);

            //Set the Image File Path.
            filePath = "~/Uploads/" + fileName;

            //Save the Image File in Folder.
            FileUpload1.PostedFile.SaveAs(Server.MapPath(filePath));

            filePath = "/Uploads/" + fileName;

        }

        void AddProductData()
        {
            try
            {
                // Get the current date.
                thisDay = DateTime.Today;

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    string sql = "INSERT INTO [dbo].[Product] ([name], [brand], [desc], [mrp], [price], [care_instr], [fit_type], [color], [more_details], [img_name], [img_path], [stocked_date], [category_type], [category_subtype]) values(@name,@brand,@desc,@mrp,@price,@care_instr,@fit_type,@color,@more_details,@img_name,@img_path,@stocked_date,@category_type,@category_subtype);";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {


                        cmd.Parameters.AddWithValue("@name", Name.Text.Trim());
                        cmd.Parameters.AddWithValue("@brand", brand.Text.Trim());
                        cmd.Parameters.AddWithValue("@desc", Desc.Text.Trim());
                        cmd.Parameters.AddWithValue("@mrp", int.Parse(mrp.Text.Trim()));
                        cmd.Parameters.AddWithValue("@price", int.Parse(productPrice.Text.Trim()));
                        cmd.Parameters.AddWithValue("@care_instr", care_instr.Text.Trim());
                        cmd.Parameters.AddWithValue("@fit_type", fit_type.Text.Trim());
                        cmd.Parameters.AddWithValue("@color", color.Text.Trim());
                        cmd.Parameters.AddWithValue("@more_details", more_details.Text.Trim());
                        cmd.Parameters.AddWithValue("@img_name", fileName);
                        cmd.Parameters.AddWithValue("@img_path", filePath);
                        cmd.Parameters.AddWithValue("@stocked_date", thisDay.ToString("D"));
                        cmd.Parameters.AddWithValue("@category_type", Categories.SelectedItem.Value);
                        if(Categories.SelectedItem.Value == "Women")
                        {
                            cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList1.SelectedItem.Value);
                        }
                        if (Categories.SelectedItem.Value == "Men")
                        {
                            cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList2.SelectedItem.Value);
                        }
                        if (Categories.SelectedItem.Value == "Kids")
                        {
                            cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList3.SelectedItem.Value);
                        }
                        if (Categories.SelectedItem.Value == "Accessories")
                        {
                            cmd.Parameters.AddWithValue("@category_subtype", RadioButtonList4.SelectedItem.Value);
                        }

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    
                }
                //Response.Redirect(Request.Url.AbsoluteUri);

                //Response.Write("<script>alert('" + Name.Text.Trim() + brand.Text.Trim() + Desc.Text.Trim() + 
                //    mrp.Text.Trim() + productPrice.Text.Trim() + care_instr.Text.Trim() + fit_type.Text.Trim() + 
                //    color.Text.Trim() + more_details.Text.Trim() + fileName + filePath + thisDay.ToString("D") + "');</script>");
                //Response.Write("Product Added");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //protected void Stocks4_TextChanged(object sender, EventArgs e)
        //{
        //    int totalstock = int.Parse(Stocks1.Text) + int.Parse(Stocks2.Text) + int.Parse(Stocks3.Text) + int.Parse(Stocks4.Text) + int.Parse(Stocks5.Text);
        //    TotalStock.Text = totalstock.ToString();
        //}

        void AddStockData()
        {
            //***********************************Insert in Stock Table and Mapping Table*******************************************

            //Get the current date.
            thisDay = DateTime.Today;

            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }


            for (int i = 0; i < checkboxlist1.Items.Count; i++)
            {
                if (checkboxlist1.Items[i].Selected == true)// getting selected value from CheckBox List  
                {
                    string sql = "INSERT INTO [dbo].[StockDetails] ([size], [stock_no], [stock_date]) VALUES (@size, @stock_no, @stock_date);";
                    using (SqlCommand cmd1 = new SqlCommand(sql, con))
                    {
                        cmd1.Parameters.AddWithValue("@size", checkboxlist1.Items[i].Text);
                        //Response.Write("<script>alert('" + checkboxlist1.Items[i].Text + "');</script>");
                        if (i == 0)
                        {
                            cmd1.Parameters.AddWithValue("@stock_no", int.Parse(Stocks1.Text.Trim()));
                            //Response.Write("<script>alert('" + int.Parse(Stocks1.Text.Trim()) + "');</script>");
                        }
                        else if (i == 1)
                        {
                            cmd1.Parameters.AddWithValue("@stock_no", int.Parse(Stocks2.Text.Trim()));
                            //Response.Write("<script>alert('" + int.Parse(Stocks2.Text.Trim()) + "');</script>");
                        }
                        else if (i == 2)
                        {
                            cmd1.Parameters.AddWithValue("@stock_no", int.Parse(Stocks3.Text.Trim()));
                            //Response.Write("<script>alert('" + int.Parse(Stocks3.Text.Trim()) + "');</script>");
                        }
                        else if (i == 3)
                        {
                            cmd1.Parameters.AddWithValue("@stock_no", int.Parse(Stocks4.Text.Trim()));
                            //Response.Write("<script>alert('" + int.Parse(Stocks4.Text.Trim()) + "');</script>");
                        }
                        else if (i == 4)
                        {
                            cmd1.Parameters.AddWithValue("@stock_no", int.Parse(Stocks5.Text.Trim()));
                            //Response.Write("<script>alert('" + int.Parse(Stocks5.Text.Trim()) + "');</script>");
                        }

                        // Display the date in the default (general) format.
                        cmd1.Parameters.AddWithValue("@stock_date", thisDay.ToString("D"));
                        //Response.Write("<script>alert('" + thisDay.ToString("D") + "');</script>");
                        cmd1.ExecuteNonQuery();
                        using (SqlCommand cmd3 = new SqlCommand("SELECT Max(Id) AS 'Identity' from [dbo].[Product];", con))
                        {
                            //Get value by executing query and store productID in prodID variable
                            prodID = (int)cmd3.ExecuteScalar();
                            //Response.Write(prodID);
                            //Response.Write("<script>alert('" + prodID + "');</script>");
                        }

                        string sql1 = "SELECT Max(Id) AS 'Identity' from [dbo].[StockDetails];";
                        using (SqlCommand cmd2 = new SqlCommand(sql1, con))
                        {
                            // Get value by executing query and store productID in prodID variable
                            stockID = (int)cmd2.ExecuteScalar();
                            //Response.Write("<script>alert('" + prodID + "');</script>");
                            //Response.Write("<script>alert('" + stockID + "');</script>");
                        }
                        //Response.Write(prodID);
                        //Response.Write(stockID);

                        string sql2 = "INSERT INTO [dbo].[MappingTable]([product_id],[stock_id]) values(@product_id,@stock_id);";
                        using (SqlCommand cmd3 = new SqlCommand(sql2, con))
                        {
                            cmd3.Parameters.AddWithValue("@stock_id", stockID);
                            cmd3.Parameters.AddWithValue("@product_id", prodID);
                            cmd3.ExecuteNonQuery();
                        }
                        //Response.Write("Mapping Added");
                    }
                }
            }
        }

            //void AddMapping(int stockID)
            //{

            //}
        }
}
