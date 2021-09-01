<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="ShoppingWebsite.addproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--<script src="js/adminform.js"></script>-->


    <title>Add Product</title>

    <!--Custom CSS-->
    <style>
        main {
            font-family: 'Montserrat', sans-serif;
        }

        .bg-img {
            background-image: url('https://www.lsretail.com/hubfs/BLOG_6-technology-trends-reshaping-luxury-fashion-industry.jpg');
            background-position: right;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
            padding: 10px;
        }

        fieldset {
            border: inset;
            margin-bottom: .5em
        }

        /* Add styles to the form container */
        .container-form {
            /* position: absolute; */
            left: 0;
            /*margin: 20px;*/
            /*width: 50%;*/
            padding: 1em;
            /* border: none; */
            color: white;
            background-color: rgba(0,0,0,0.5);
        }


        section {
            background-color: rgba(0,0,0,0);
        }

        input[type=radio], input[type=checkbox] {
            margin: 7px;
        }
        /* .error {border: 1px red solid;} */

        .btn {
            width: 9em;
            font-size: medium;
            text-align: center;
        }

        #ProdSize label {
            /* width: 2em; */
            /*margin-left: -1.5em;*/
        }
        #ProdSize input {
            margin: 1rem;
        }

        .choices {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            align-items: baseline;
        }

        #RadioButtonList1 tr {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            align-items: baseline;
            
        }
        /*legend{
            color:#42A;
        }*/

        @media only screen and (max-width: 770px) {
            .container-form {
                margin: 0rem;
                width: 100%;
                background-color: rgba(100, 100, 100, 0.712);
                color: white;
            }

            h2 {
                color: white;
            }

            .bg-img {
                background-image: url(imgs/shopping-experience1.jpg);
                background-position: center;
            }
        }
    </style>

    <!--Custom Javascript-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
            $("#Categories").change(function () {
                //alert(ContentPlaceHolder1_Categories.value);
                if (Categories.value == "Women") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforWomen").show();
                }
                else if (Categories.value == "Men") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforMen").show();
                }
                else if(Categories.value == "Kids") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforKids").show();
                }
                else if (Categories.value == "Accessories") {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    $("#choicesforAccessories").show();
                }
                else {
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                }

            });

            //$("#dialog").dialog({
            //    autoOpen: false,
            //    modal: true,
            //    height: 600,
            //    width: 600,
            //    title: "Zoomed Image"
            //});
            //$("[id*=gvImages] img").click(function () {
            //    $('#dialog').html('');
            //    $('#dialog').append($(this).clone());
            //    $('#dialog').dialog('open');            //});


            //$("#Button1").click(function () {
            //    if (confirm("Are you sure to want to Reset Data?") == true)
            //        return true;
            //    else
            //        return false;
            //}
            ConfirmReset = function () {

                if (confirm("Are you sure to want to Reset Data?") == true) {
                    $('input:checkbox').attr('checked', false);
                    $("#choicesforWomen,#choicesforMen,#choicesforKids,#choicesforAccessories").hide();
                    return true;
                }
                else
                    return false;
            }
        });

          
    </script>

    <!--Custom C#-->
    <script runat="server">
        int totalstock;

        void Check_Clicked(Object sender, EventArgs e)
        {
            //totalstock= int.Parse(TotalStock.Text);

            // Iterate through the Items collection of the CheckBoxList 
            // control and display the selected items.
            for (int i = 0; i < checkboxlist1.Items.Count; i++)
            {
                if (checkboxlist1.Items[i].Selected)
                {

                }
                if (!checkboxlist1.Items[i].Selected)
                {
                    if (i == 0)
                    {
                        Stocks1.Text = "0";
                    }
                    else if (i == 1)
                    {
                        Stocks2.Text = "0";
                    }
                    else if (i == 2)
                    {
                        Stocks3.Text = "0";
                    }
                    else if (i == 3)
                    {
                        Stocks4.Text = "0";
                    }
                    else if (i == 4)
                    {
                        Stocks5.Text = "0";
                    }
                }

                totalstock = int.Parse(Stocks1.Text) + int.Parse(Stocks2.Text) + int.Parse(Stocks3.Text) + int.Parse(Stocks4.Text) + int.Parse(Stocks5.Text);
                TotalStock.Text = totalstock.ToString();
            }

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bg-img">
        <div class="container-form">
            <div class="container">

                <div class="row">
                    <div class="my-3 d-flex justify-content-between">
                        <h2>Add Product Details</h2>
                        <button id="Button1" type="reset" class="btn-danger align-self-center" onclick="return ConfirmReset();">X</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-sm-12">

                        <!--Product Info-->
                        <section>
                            <fieldset>
                                <legend>Product Info</legend>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="Name" Font-Bold="True" runat="server">Product Name:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs">
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="Name"
                                                placeholder="Eg. Lorem ipsum" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="vName" runat="server"
                                            ControlToValidate="Name" ErrorMessage="*Enter product name" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="Desc" Font-Bold="True" runat="server">Description:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs">
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="Desc" placeholder="Eg. Lorem ipsum, dolor sit amet consectetur adipisicing elit."
                                                runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="vDesc" runat="server"
                                            ControlToValidate="Desc" ErrorMessage="*Write full description" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="brand" Font-Bold="True" runat="server">Brand Name:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs">
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="brand"
                                                placeholder="Eg. Harpa" runat="server"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="vbrand" runat="server"
                                            ControlToValidate="brand" ErrorMessage="*Enter brand name" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </fieldset>
                        </section>
                        <!--/--Product info---->

                        <!--Add Product Image-->
                        <section>
                            <fieldset>
                                <legend>Product Image</legend>
                                <div class="row my-2">
                                    <div class="col-12 inputs">
                                        <div class="form-group">
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                            <asp:RequiredFieldValidator ID="vFileUpload1" runat="server"
                                            ControlToValidate="FileUpload1" ErrorMessage="*Upload one image"
                                            ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>

                                            <%--<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" CssClass="btn btn-outline-info w-100" />--%>
                                            
                                        </div>
                                       <%-- <div class="">
                                            <br />
                                            <asp:GridView ID="gvImages" runat="server" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundField DataField="FileId" HeaderText="Image Id" />
                                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                                    <asp:ImageField DataImageUrlField="Path" HeaderText="Image" ControlStyle-CssClass="w-25" />
                                                </Columns>
                                            </asp:GridView>
                                            <div id="dialog" style="display: none">
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </fieldset>
                        </section>
                        <!--/-Add Product Image-->

                        <!--Category-->
                        <section>
                            <fieldset>
                                <legend>Category</legend>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="category" Font-Bold="True" runat="server">Category: </asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs">
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="Categories" runat="server" ClientIDMode="Static">
                                                <asp:ListItem Text="Select" Value="Select" />
                                                <asp:ListItem Text="Women" Value="Women" />
                                                <asp:ListItem Text="Men" Value="Men" />
                                                <asp:ListItem Text="Kids" Value="Kids" />
                                                <asp:ListItem Text="Accessories" Value="Accessories" />
                                            </asp:DropDownList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="VCategories" runat="server"
                                            ControlToValidate="Categories" ErrorMessage="*Select Category"
                                            InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row my-2">
                                    <div class="col-12">
                                        <div id="choicesAll">
                                            <div class="form-group" id="choicesforWomen">
                                                <asp:Label CssClass="d-block" for="catType1" Font-Bold="True" runat="server">Please select your category type: </asp:Label>
                                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="w-100"
                                                    RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                    <asp:ListItem>Tops</asp:ListItem>
                                                    <asp:ListItem>Kurti</asp:ListItem>
                                                    <asp:ListItem>Dress</asp:ListItem>
                                                    <asp:ListItem>Jeans</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                        ControlToValidate="RadioButtonList1" ErrorMessage="*Select Category"
                                                        InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group" id="choicesforMen">
                                                <asp:Label CssClass="d-block" for="catType1" Font-Bold="True" runat="server">Please select your category type: </asp:Label>
                                                <asp:RadioButtonList ID="RadioButtonList2" runat="server" CssClass="w-100"
                                                    RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                    <asp:ListItem>T-shirt</asp:ListItem>
                                                    <asp:ListItem>Jeans</asp:ListItem>
                                                    <asp:ListItem>Jacket</asp:ListItem>
                                                    <asp:ListItem>Ethic Wear</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                        ControlToValidate="RadioButtonList2" ErrorMessage="*Select Category"
                                                        InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group" id="choicesforKids">
                                                <asp:Label CssClass="d-block" for="catType1" Font-Bold="True" runat="server">Please select your category type: </asp:Label>
                                                <asp:RadioButtonList ID="RadioButtonList3" runat="server" CssClass="w-100"
                                                    RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                    <asp:ListItem>Tops</asp:ListItem>
                                                    <asp:ListItem>Dungree</asp:ListItem>
                                                    <asp:ListItem>Dress</asp:ListItem>
                                                    <asp:ListItem>Jeans</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                        ControlToValidate="RadioButtonList3" ErrorMessage="*Select Category"
                                                        InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group" id="choicesforAccessories">
                                                <asp:Label CssClass="d-block" for="catType1" Font-Bold="True" runat="server">Please select your category type: </asp:Label>
                                                <asp:RadioButtonList ID="RadioButtonList4" runat="server" CssClass="w-100"
                                                    RepeatDirection="Horizontal" ClientIDMode="Static" CellPadding="5" CellSpacing="5">
                                                    <asp:ListItem>Watches</asp:ListItem>
                                                    <asp:ListItem>Hand Bags</asp:ListItem>
                                                    <asp:ListItem>Sunglass</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                        ControlToValidate="RadioButtonList4" ErrorMessage="*Select Category"
                                                        InitialValue="Select" ForeColor="#FFCCCC" Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </fieldset>
                        </section>
                        <!--/Category-->

                        <!--Price-->
                        <section>
                            <fieldset>
                                <legend>Price</legend>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="mrp" Font-Bold="True" runat="server">M.R.P:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs">
                                        <div class=" form-group">
                                            <asp:TextBox CssClass="form-control" ID="mrp" runat="server" placeholder="Eg. $300" TextMode="Number">100</asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                ControlToValidate="mrp" ErrorMessage="*Enter Maximum Retail Price" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <%--<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator"
                                            ControlToValidate="mrp" SetFocusOnError="True" Display="Static" MinimumValue="99"></asp:RangeValidator>--%>
                                        </div>
                                    </div>
                                </div>


                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="productPrice" Font-Bold="True" runat="server">Price:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs form-group">
                                        <asp:TextBox CssClass="form-control" ID="productPrice" runat="server" placeholder="Eg. $250" TextMode="Number">99</asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ControlToValidate="productPrice" ErrorMessage="*Enter selling price" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <%--<asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="RangeValidator"
                                            ControlToValidate="productPrice" SetFocusOnError="True" Display="Static" MinimumValue="99"></asp:RangeValidator>
                                        --%>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Product price should be less than MRP" ForeColor="#FFCCCC"
                                            ControlToValidate="productPrice" ControlToCompare="mrp" EnableClientScript="True" Operator="LessThanEqual" Type="Integer" Display="Dynamic"></asp:CompareValidator>
                                    </div>
                                </div>
                            </fieldset>
                        </section>
                        <!--/Price-->

                    </div>

                    <div class="col-lg-6 col-sm-12">

                        <!--Stock Info-->
                        <section>
                            <fieldset>
                                <legend>Stock Info</legend>

                                <div class="row">
                                    <div class="col-12">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>

                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-4 form-group" id="ProdSize">
                                                        <div class="w-100">
                                                            <asp:Label for="ProdSize" Font-Bold="True" runat="server">Select size: </asp:Label>
                                                        </div>
                                                        <asp:CheckBoxList ID="checkboxlist1"
                                                            CellPadding="5"
                                                            CellSpacing="5"
                                                            RepeatDirection="Vertical"
                                                            RepeatLayout="Flow"
                                                            TextAlign="Right" ClientIDMode="Static"
                                                            OnSelectedIndexChanged="Check_Clicked"
                                                            runat="server" ToolTip="Select sizes of product"
                                                            AutoPostBack="True">

                                                            <asp:ListItem>XS</asp:ListItem>
                                                            <asp:ListItem>S</asp:ListItem>
                                                            <asp:ListItem>M</asp:ListItem>
                                                            <asp:ListItem>L</asp:ListItem>
                                                            <asp:ListItem>XL</asp:ListItem>

                                                        </asp:CheckBoxList>
                                                        <asp:CustomValidator runat="server" ID="vcheckboxlist1" ClientValidationFunction="ValidateModuleList"
                                                            Display="Dynamic" ErrorMessage="*Please select size" ForeColor="#FFCCCC">
                                                        </asp:CustomValidator>
                                                        
                                                    </div>

                                                    <div class="col-8">
                                                        <div class="w-100">
                                                            <asp:Label for="mrp" Font-Bold="True" runat="server">Enter Stock No. for size:</asp:Label>
                                                        </div>

                                                        <div class="form-group">
                                                            <asp:TextBox ID="Stocks1" runat="server" CssClass="form-control my-2" AssociatedControlID="checkboxlist1" 
                                                                TextMode="Number" Visible="True" TabIndex="1" ClientIDMode="Static">0</asp:TextBox>

                                                            <asp:TextBox ID="Stocks2" runat="server" CssClass="form-control my-2" AssociatedControlID="checkboxlist1" 
                                                                TextMode="Number" Visible="True" TabIndex="2" ClientIDMode="Static">0</asp:TextBox>

                                                            <asp:TextBox ID="Stocks3" runat="server" CssClass="form-control my-2" AssociatedControlID="checkboxlist1" 
                                                                TextMode="Number" Visible="True" TabIndex="3" ClientIDMode="Static">0</asp:TextBox>

                                                            <asp:TextBox ID="Stocks4" runat="server" CssClass="form-control my-2" AssociatedControlID="checkboxlist1" 
                                                                TextMode="Number" Visible="True" TabIndex="4" ClientIDMode="Static">0</asp:TextBox>

                                                            <asp:TextBox ID="Stocks5" runat="server" CssClass="form-control my-2" AssociatedControlID="checkboxlist1" 
                                                                TextMode="Number" Visible="True" TabIndex="5" ClientIDMode="Static">0</asp:TextBox>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-12">
                                                        <asp:Label for="mrp" Font-Bold="True" runat="server">Total Stock:</asp:Label>
                                                    </div>

                                                    <div class="col-12 inputs form-group">
                                                        <asp:TextBox CssClass="form-control" ID="TotalStock" runat="server" TextMode="Number" ReadOnly="true" AutoPostBack="True">0</asp:TextBox>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                        <script>
                                            function ValidateModuleList(source, args) {

                                                var chkListModules = document.getElementById('<%= checkboxlist1.ClientID %>');

                                                var chkListinputs = chkListModules.getElementsByTagName("input");

                                                for (var i = 0; i < chkListinputs.length; i++) {

                                                    if (chkListinputs[i].checked) {

                                                        args.IsValid = true;

                                                        return;

                                                    }
                                                }
                                                args.IsValid = false;
                                            }
                                        </script>
                                    </div>

                                    
                                </div>
                            </fieldset>
                        </section>
                        <!--/Stock Info-->

                        <!--Extra Info-->
                        <section>
                            <fieldset>
                                <legend>Extra Info</legend>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="fit_type" Font-Bold="True" runat="server">Fit Type:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs form-group">
                                        <asp:TextBox CssClass="form-control" ID="fit_type" runat="server" placeholder="Regular Fit"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="vfit_type" runat="server"
                                            ControlToValidate="fit_type" ErrorMessage="*Mension fit type" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="color" Font-Bold="True" runat="server">Color:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs form-group">
                                        <asp:TextBox CssClass="form-control" ID="color" runat="server" placeholder="Black" TextMode="SingleLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="vcolor" runat="server"
                                            ControlToValidate="color" ErrorMessage="*Mension colour name" ForeColor="#FFCCCC" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label Font-Bold="True" runat="server">Care Instructions :</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs form-group">
                                        <asp:TextBox CssClass="form-control" ID="care_instr" runat="server" placeholder="Hand Wash Only"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row my-2">
                                    <div class="col-sm-4">
                                        <asp:Label for="more_details" Font-Bold="True" runat="server">More Details:</asp:Label>
                                    </div>
                                    <div class="col-sm-8 inputs form-group">
                                        <asp:TextBox CssClass="form-control" ID="more_details" runat="server" placeholder="100% Polyester,Hand wash" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                    </div>
                                </div>
                            </fieldset>
                        </section>
                        <!--/Extra Info-->

                    </div>
                </div>

                <div class="row">
                    <div class="col-12 my-4">
                        <asp:Button CssClass="btn btn-primary bg-customBlue btn-lg w-100" ID="Submit" runat="server" Text="Add Product" OnClick="Submit_Click" />
                    </div>
                </div>

            </div>

        </div>

    </section>

</asp:Content>
