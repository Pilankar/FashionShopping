<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="productView.aspx.cs" Inherits="ShoppingWebsite.productView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="shopping.css">

    <title>productView</title>

    <style>
        main {
            /*padding: 2rem;*/
            background-color: rgb(234, 240, 253);
        }


        aside {
            width:auto;
            height: 50%;
            float: left;
        }

        /* .content-info {
            margin-left: auto;
        } */

        .prod-img {
            /* padding: 20px; */
            display: block;
            margin: auto;
            width: 100%; /*28em*/
            /*width: 40rem;*/
            border: 1px solid black;
            /*position: -webkit-sticky;
            position: sticky;*/
            top: 0;
        }

        .productCost {
            font-weight: bold;
            font-size: large;
            color: rgb(180, 13, 13);
        }

        #star_rating {
            color: rgb(255, 208, 0);
            font-size: 1.5em;
        }

        .content-info button {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        main label {
            font-weight:500;
        }

        @media only screen and (max-width: 770px) {
            .prod-img {
                width: 98%;
            }
        }

        /* #item {
            float: right;
        } */
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bg-white">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE (([category_type] = @category_type) AND ([Id] = @Id))">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="Women" Name="category_type" QueryStringField="category_type" Type="String" />
                <asp:QueryStringParameter DefaultValue="10003" Name="Id" QueryStringField="Id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataSourceID="SqlDataSource1" EnableTheming="False" BorderStyle="None" CommandRowStyle-BorderStyle="None">
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div class="row my-4">
                            <div class="col-sm-5">
                                <aside>
                                    <a href="<%# Eval("img_path") %>" target="_blank">
                                        <img class="img-fluid prod-img" src="<%# Eval("img_path") %>" alt="<%# Eval("img_name") %>">
                                    </a>
                                </aside>
                            </div>

                            <div class="col-sm-7">
                                <section id="item">
                                    <div class="row">
                                        <p>
                                            <small><label for="brand">Brand:</label>
                                            <span id="brand" runat="server"><%# Eval("brand") %></span>
                                            </small>
                                        </p>
                                    </div>
                                    <div class="row">
                                        <h3 id="name" runat="server"><%# Eval("name") %></h3>
                                    </div>
                                    <div class="row">
                                        <asp:Label id="star_rating" runat="server" ClientIDMode="Static" Text=<%# Eval("rating") %>></asp:Label>
                                        <%--0   &#9734;&#9734;&#9734;&#9734;&#9734;
                                        1   &#9733;&#9734;&#9734;&#9734;&#9734;
                                        2   &#9733;&#9733;&#9734;&#9734;&#9734;
                                        3   &#9733;&#9733;&#9733;&#9734;&#9734;
                                        4   &#9733;&#9733;&#9733;&#9733;&#9734;
                                        5   &#9733;&#9733;&#9733;&#9733;&#9733;--%>

                                        <script type="text/javascript">
                                            $(document).ready(function () {
                                                let length = 5;
                                                let str = "";
                                                let n = $("#star_rating").text();
                                                for (let i = 0; i < length; i++) { //0 1 2 3 4 5
                                                    //0 - 00000, 1-10000, 2-11000
                                                    if (n > i) { //
                                                        str = str + "★"; //1
                                                    }
                                                    else {
                                                        str = str + "☆"; //0
                                                    }

                                                }
                                                $("#star_rating").text(str);
                                                
                                            });
                                        </script>

                                        <hr>
                                    </div>
                                     
                                    <div class="row">
                                        <p id="description" runat="server">
                                            <%# Eval("desc") %>
                                        </p>
                                    </div>
                                    <div class="row">
                                        <small> 
                                            <label for="mrp_price">M.R.P: </label>&ensp;
                                            <strike><var id="mrp_price" runat="server">Rs. <%# Eval("mrp") %>.00</var></strike>
                                        </small>
                                        <br />
                                        <p>
                                            <label for="cost_price">Price: </label>&ensp;
                                            <var class="productCost" id="cost_price" runat="server">Rs. <%# Eval("price") %>.00</var>
                                        </p>
                                    </div>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        SelectCommand="SELECT * FROM [dbo].[StockDetails] INNER JOIN [dbo].[MappingTable] ON [dbo].[StockDetails].[Id] = [dbo].[MappingTable].[stock_id] WHERE ([product_id] = @product_id)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="Women" Name="category_type" QueryStringField="category_type" Type="String" />
                                            <asp:QueryStringParameter DefaultValue="10003" Name="product_id" QueryStringField="Id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="row">
                                        <div class="col-md-6 inputs form-group">
                                            <label for="size">Size: </label>
                                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server"
                                                AppendDataBoundItems="True" DataTextField="size" DataValueField="Id" DataSourceID="SqlDataSource2">
                                                <asp:ListItem Text="--Select--" Value="Select" />
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="vsize" ForeColor="Red"
                                                runat="server" ControlToValidate="DropDownList1"
                                                ErrorMessage="*Select your size to continue"
                                                InitialValue="Select" Display="Dynamic" SetFocusOnError="True" Font-Italic="True">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                        <div class="col-md-6 inputs form-group">
                                            <label for="qty">Qty:</label>
                                            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                                <asp:ListItem Text="1" Value="1" Selected="True" />
                                                <asp:ListItem Text="2" Value="2" />
                                                <asp:ListItem Text="3" Value="3" />
                                                <asp:ListItem Text="4" Value="4" />
                                                <asp:ListItem Text="5 (Max)" Value="5" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row p-4">
                                        <ul>
                                            <li>
                                                <asp:Label runat="server" Font-Bold="true">Care Instructions:</asp:Label>
                                                <asp:Label ID="care_instruction" runat="server"><%# Eval("care_instr") %></asp:Label>
                                            </li>
                                            <li>
                                                <asp:Label runat="server" Font-Bold="true">Fit Type:</asp:Label>
                                                <asp:Label ID="fit_type" runat="server"><%# Eval("fit_type") %></asp:Label>
                                            </li>
                                            <li>
                                                <asp:Label runat="server" Font-Bold="true">Color Name:</asp:Label>
                                                <asp:Label ID="Label1" runat="server"> <%# Eval("color") %> </asp:Label>
                                            </li>
                                        </ul>
                                        <ul id="more_details" runat="server">
                                            <li><%# Eval("more_details") %></li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <asp:Button runat="server" ID="AddToCart" CssClass="btn btn-primary bg-customBlue w-100 my-2" Text="Add To Cart"></asp:Button>
                                        </div>
                                        <div class="col-sm-6">
                                            <asp:Button runat="server" ID="Buy" CssClass="btn btn-danger w-100 my-2" Text="Buy Now"></asp:Button>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>


        <!--Comments-->
        <div class="row">
            <div class="col-sm-12">
                <div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-width="" data-numposts="5"></div>
            </div>
        </div>
        <!--/ Comments-->

    </div>
    <div class="container">
        <div class="d-flex justify-content-between">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#"><< Previous Product</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#">Next Product >></asp:HyperLink>
        </div>
    </div>
        

</asp:Content>
