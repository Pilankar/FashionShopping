<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="ShoppingWebsite.LoginPages.LoginUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .form-floating:focus-within {
            z-index: 2;
        }
        
        .footer {
            display: none;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card mx-auto" style="width: 28rem">
            <div class="card-body">
                <h3 class="text-center">User Login</h3>
                <div class="row">
                    <div class="col-12 text-center mb-3">
                        <img width="150" src="../imgs/guy.gif" />
                    </div>
                    <div class="col">

                        <div class="form-floating mb-3">
                            <asp:TextBox CssClass="form-control" ID="username" runat="server" placeholder="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vusername" runat="server" ForeColor="Red" Display="Dynamic"
                                ControlToValidate="username" ErrorMessage="Enter your name" SetFocusOnError="True">
                            </asp:RequiredFieldValidator>
                            <label for="floatingInput">Username</label>
                        </div>

                        <div class="form-floating mb-3">
                            <asp:TextBox CssClass="form-control" ID="password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vpassword" runat="server" ForeColor="Red" Display="Dynamic"
                                ErrorMessage="Password required" ControlToValidate="password" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <label for="floatingInput">Password</label>
                        </div>

                        <div class="mb-3">
                            <asp:Button CssClass="btn btn-success btn-lg w-100" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                        </div>

                        <div class="mb-3">
                            <a href="signup.aspx">
                                <input class="btn btn-primary btn-lg w-100" id="Button2" type="button" value="Sign Up" /></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
