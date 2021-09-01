<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="ShoppingWebsite.SignUps.user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/signups.css" rel="stylesheet" />

    <style>
        .footer {
            display: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-img bg-light">
        <div class="container container-form">

            <h2 class="mb-5 text-center">User Registration</h2>

            <asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
                <asp:View ID="View1" runat="server">
                    <div class="col-md-7 mx-auto">
                        <div class="row g-3">
                            <div class="col-12 mb-3">
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <label for="username" class="form-label">Username <span id="unsucc" runat="server" visible="false"> <i id="check" runat="server"></i></span></label>
                                        <div class="input-group">
                                            <span class="input-group-text">@</span>
                                            <asp:TextBox class="form-control" ID="username" runat="server" OnTextChanged="CheckUserNameAvailability"
                                                placeholder="" ToolTip="Enter user name for login purpose" AutoPostBack="True"></asp:TextBox>
                                        </div>
                                        <div id="checkun" runat="server" visible="false">
                                            <i id="checkicon" runat="server"></i>
                                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                        </div>
                                        <asp:RequiredFieldValidator ID="vusername" runat="server" Display="Dynamic" ForeColor="Red"
                                            ControlToValidate="username" ErrorMessage="*Enter your name">
                                        </asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="col-md-12 mb-3">
                                <label for="password">New Password:</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="password"
                                        runat="server" placeholder="" TextMode="Password"></asp:TextBox>
                                    <asp:Label runat="server" ToolTip="Minimum 8 characters" CssClass="input-group-text">
                                        <i class="fa fa-info-circle"></i>
                                    </asp:Label>
                                </div>
                                <asp:RequiredFieldValidator ID="vpasswordconfirm" runat="server" Display="Dynamic" ForeColor="Red"
                                    ErrorMessage="*password required" ControlToValidate="password"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-12 mb-3">
                                <label for="password">Confirm Password:</label>
                                <div class="input-group">
                                    <asp:TextBox class="form-control" ID="passwordconfirm"
                                        runat="server" placeholder="" TextMode="Password"></asp:TextBox>

                                    <asp:Label runat="server" ToolTip="Minimum 8 characters" CssClass="input-group-text">
                                        <i class="fa fa-info-circle"></i>
                                    </asp:Label>
                                </div>
                                
                                <asp:RequiredFieldValidator ID="vpassword" runat="server" Display="Dynamic" ForeColor="Red"
                                    ErrorMessage="*password required" ControlToValidate="passwordconfirm"></asp:RequiredFieldValidator>

                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doesn't match" SetFocusOnError="True" ForeColor="Red"
                                    ControlToCompare="passwordconfirm" ControlToValidate="password"></asp:CompareValidator>
                            </div>

                            <div class="col-12">
                                <input type="checkbox" class="form-check-input" id="terms" required>
                                <label class="form-check-label" for="terms">I Agree to <span class="text-danger" style="cursor: pointer;">Terms and Conditions</span></label>
                            </div>

                            <div class="col-12 mt-4">
                                <asp:Button runat="server" CommandName="NextView" ID="btnnext1" 
                                    CssClass="btn btn-primary bg-customBlue btn-lg w-100" Text="Proceed" />
                            </div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="View2" runat="server">
                    <div class="col-md-9 mx-auto">
                        <div class="row g-3">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">First name</label>
                                <asp:TextBox CssClass="form-control" ID="firstName" runat="server" placeholder="John"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vfirstname" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="firstName" ErrorMessage="*Enter your name">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="lastName" class="form-label">Last name</label>
                                <asp:TextBox CssClass="form-control" ID="lastName" runat="server" placeholder="Doe"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vlastname" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="lastName" ErrorMessage="*Enter your name">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-12 mb-3">
                                <label for="phone" class="form-label">Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="contact" runat="server" placeholder="9876543210"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vcontact1" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="contact" ErrorMessage="*Enter Phone Number">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="vcontact2" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="contact" ErrorMessage="Enter Valid Number"
                                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </div>

                            <div class="col-12 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="doe@123.com" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vemail" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="email" ErrorMessage="*Enter email ID">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="vemail1" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="email" ErrorMessage="Enter your email"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                            </div>

                            <div class="col-12 mb-3">
                                <label for="address" class="form-label">Address</label>
                                <asp:TextBox CssClass="form-control" ID="address" runat="server" placeholder="1234 Main St" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vaddress" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="address" ErrorMessage="*Enter address">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-5 mb-3">
                                <label for="city" class="form-label">City</label>
                                <asp:TextBox CssClass="form-control" ID="city" runat="server" placeholder=""></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vcity" Display="Dynamic" ForeColor="Red"
                                    runat="server" ControlToValidate="city"
                                    ErrorMessage="*Enter city">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="state" class="form-label">State</label>
                                <asp:DropDownList class="form-control" ID="state" runat="server">
                                    <asp:ListItem Text="Select" Value="select" />
                                    <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                    <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                    <asp:ListItem Text="Assam" Value="Assam" />
                                    <asp:ListItem Text="Bihar" Value="Bihar" />
                                    <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                    <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                    <asp:ListItem Text="Goa" Value="Goa" />
                                    <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                    <asp:ListItem Text="Haryana" Value="Haryana" />
                                    <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                    <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                    <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                    <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                    <asp:ListItem Text="Kerala" Value="Kerala" />
                                    <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                    <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                    <asp:ListItem Text="Manipur" Value="Manipur" />
                                    <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                    <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                    <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                    <asp:ListItem Text="Odisha" Value="Odisha" />
                                    <asp:ListItem Text="Punjab" Value="Punjab" />
                                    <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                    <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                    <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                    <asp:ListItem Text="Telangana" Value="Telangana" />
                                    <asp:ListItem Text="Tripura" Value="Tripura" />
                                    <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                    <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                    <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="vstate" Display="Dynamic"
                                    runat="server" ControlToValidate="state"  ForeColor="Red"
                                    ErrorMessage="Select your state"
                                    InitialValue="select">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-3 mb-3">
                                <label for="pincode" class="form-label">Pincode</label>
                                <asp:TextBox CssClass="form-control" ID="pincode" runat="server" placeholder=""></asp:TextBox>
                                <asp:RequiredFieldValidator ID="vpincode" runat="server" Display="Dynamic" ForeColor="Red"
                                    ControlToValidate="pincode" ErrorMessage="*Enter pincode">
                                </asp:RequiredFieldValidator>
                            </div>

                            <asp:Button CommandArgument="0" CommandName="NextView" ID="btnnext2" runat="server"
                                CssClass="btn btn-primary bg-customBlue btn-lg w-100" Text="Create Account" OnClick="btnnext2_Click1" />

                        </div>
                    </div>
                    
                </asp:View>

            </asp:MultiView>


        </div>
    </div>

</asp:Content>
