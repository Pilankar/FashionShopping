<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ShoppingWebsite.LoginPages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl)
        })
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div>
            <h2>MultiView and View Controls</h2>
            
            
            <asp:MultiView ID="MultiView1" ActiveViewIndex=0 runat="server">
               <asp:View ID="View1" runat="server">
                  <h3>This is view 1</h3>
                  <br />
                  <asp:Button CommandName="NextView" ID="btnnext1" runat="server" Text = "Go To Next" />
                  <asp:Button CommandArgument="View3" CommandName="SwitchViewByID" ID="btnlast" runat="server" Text  ="Go To Last" />
               </asp:View> 
					
               <asp:View ID="View2" runat="server">
                  <h3>This is view 2</h3>
                  <asp:Button CommandName="NextView" ID="btnnext2" runat="server" Text = "Go To Next" />
                  <asp:Button CommandName="PrevView" ID="btnprevious2" runat="server" Text = "Go To Previous View" />
               </asp:View> 

               <asp:View ID="View3" runat="server">
                  <h3> This is view 3</h3>
                  <br />
                  <asp:Calendar ID="Calender1" runat="server"></asp:Calendar>
                  <br />
                  <asp:Button  CommandArgument="0" CommandName="SwitchViewByIndex" ID="btnfirst"   runat="server" Text = "Go To Next" />
                  <asp:Button CommandName="PrevView" ID="btnprevious" runat="server" Text = "Go To Previous View" />
               </asp:View> 
               
            </asp:MultiView>

        <button type="button" class="btn btn-secondary" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="right" data-bs-content="Right popover">
            Popover on right
        </button>
         </div>
</asp:Content>
