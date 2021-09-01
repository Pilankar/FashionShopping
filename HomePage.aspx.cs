using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;
using System.Xml;

namespace ShoppingWebsite
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Console.WriteLine("Mitali");
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string File_name = Server.MapPath("ContactData.xml");
                if (File.Exists(File_name) == true)
                {
                    XmlDocument xmld = new XmlDocument();
                    xmld.Load(Server.MapPath("ContactData.xml"));
                    XmlElement customer = xmld.CreateElement("Customer");
                    XmlElement name = xmld.CreateElement("Name");
                    XmlElement email = xmld.CreateElement("Email-Id");
                    XmlElement msg = xmld.CreateElement("Message");
                    XmlText tname = xmld.CreateTextNode(Name.Text);
                    XmlText temail = xmld.CreateTextNode(Email.Text);
                    XmlText tmsg = xmld.CreateTextNode(Msg.Text);
                    name.AppendChild(tname);
                    email.AppendChild(temail);
                    msg.AppendChild(tmsg);

                    customer.AppendChild(name);
                    customer.AppendChild(email);
                    customer.AppendChild(msg);
                    xmld.DocumentElement.AppendChild(customer);
                    xmld.Save(Server.MapPath("ContactData.xml"));
                    Response.Write("<script> alert('Message Sent');</script>");
                    Name.Text = "";
                    Email.Text = "";
                    Msg.Text = "";
                }
                else
                {
                    XmlTextWriter xmlTW = new XmlTextWriter(File_name, null);
                    xmlTW.WriteStartDocument();
                    xmlTW.WriteStartElement("Messages");
                    xmlTW.WriteStartElement("Customer");
                    xmlTW.WriteElementString("Name", Name.Text);
                    xmlTW.WriteElementString("Email-Id", Email.Text);
                    xmlTW.WriteElementString("Message", Msg.Text);
                    xmlTW.WriteEndElement();
                    xmlTW.WriteEndElement();
                    xmlTW.Close();
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script> alert(" + ex + ");</script>");
            }
        }

    }
}