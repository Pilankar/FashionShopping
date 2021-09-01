<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ShoppingWebsite.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        figure img {
            width: 200px;
            margin: 0.5em;
        }

        figcaption {
            text-align: center;
            font-size:large;
            margin-top: 1em;
        }

        main {
            padding: 0em;
        }

        main h2,h4{
            font-family: 'Times New Roman';
            text-transform: uppercase;
        }

        
        #section3 .card{
            width: 18rem;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- carousel section -->
    <section id=section1 class="text-light">
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="Categories.aspx" target="_blank">
                        <img src="ShoppingWebsiteHomepage/Title Page2.png" class="d-block w-100 img-fluid" alt="...">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="Categories.aspx" target="_blank">
                        <img src="ShoppingWebsiteHomepage/Title Page.png" class="d-block w-100 img-fluid" alt="...">
                    </a>
                </div>
                <div class="carousel-item">
                    <a href="Categories.aspx" target="_blank">
                        <img src="ShoppingWebsiteHomepage/Title Page3.png" class="d-block w-100 img-fluid" alt="...">
                    </a>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
    <!-- / carousel  section -->

    <!-- categories section -->
    <section id="section2" class="d-flex align-items-center justify-content-center flex-column" style="min-height:40rem;">
        <h2 class="text-center mb-5">Categories</h2>
        <div class="d-flex justify-content-evenly flex-wrap">
            <figure>
                <a href="Categories.aspx#WomenCategory" target="_blank">
                    <img class="rounded-circle blog-image" src="imgs/Women.jpg" />
                </a>
                <figcaption>Women</figcaption>
            </figure>
            <figure>
                <a href="Categories.aspx#MenCategory" target="_blank">
                    <img class="rounded-circle blog-image" src="imgs/Men.jpg"/>
                </a>
                <figcaption>Men</figcaption>
            </figure>
            <figure>
                <a href="Categories.aspx#KidsCategory" target="_blank">
                    <img class="rounded-circle blog-image" src="imgs/Kids.jpg" />
                </a>
                <figcaption>Kids</figcaption>
            </figure>
            <figure>
                <a href="Categories.aspx#AccessoryCategory" target="_blank">
                    <img class="rounded-circle blog-image" src="imgs\handbags._SY530_QL85_.jpg" />
                </a>
                <figcaption>Accesories</figcaption>
            </figure>
        </div>
    </section>
    <!-- / categories section -->

    <!-- products section -->
    <section id="section3" class="bg-dark d-flex align-items-center justify-content-around flex-wrap" style="min-height: 40rem; --bs-bg-opacity: 0.10;">
        <span class="btn align-self-center"><i class="fas fa-2x fa-arrow-alt-circle-left"></i></span>
        
        <div class="card" tabindex="1">
            <img class="card-img-top" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
        </div>
        <div class="card" tabindex="2" style="width: 20rem;">
            <img class="card-img-top" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
        </div>
        <div class="card" tabindex="3">
            <img class="card-img-top" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
        </div>

        <span class="btn align-self-center"><i class="fas fa-2x fa-arrow-alt-circle-right"></i></span>
    </section>

    <%--    <section class="section2 p-5">
        <div class="d-flex flex-wrap">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [name], [brand], [mrp], [price], [category_type], [category_subtype], [img_name], [img_path] FROM [Product] WHERE ([category_type] = @category_type)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Women" Name="category_type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <div class="card" style="width: 18rem; margin: 1.5em;">
                                <a href="productView.aspx?category_type=<%# Eval("category_type") %>&subcat=<%# Eval("category_subtype") %>&id=<%# Eval("Id") %>" target="_blank">
                                    <img class="card-img-top prod-img" src="<%# Eval("img_path") %>" alt="<%# Eval("img_name") %>">
                                    <div class="card-body">
                                        <asp:Label ID="brand" runat="server" CssClass="card-text d-block" Font-Bold="true" Font-Size="Larger" ForeColor="#222288"><%# Eval("brand") %></asp:Label>
                                        <asp:Label ID="name" runat="server" CssClass="d-block card-text"><%# Eval("name") %></asp:Label>

                                        <p>
                                            <label class="productCost" id="cost_price" runat="server">Rs. <%# Eval("price") %>.00</label>
                                            &ensp;
                                                <small>
                                                    <strike><var id="Var1" runat="server">Rs. <%# Eval("mrp") %>.00</var></strike>
                                                </small>
                                        </p>
                                    </div>
                                </a>
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
        </div>

    </section>--%>
    <!-- / products section -->

    <!-- carousel section -->
    <%--<section class="" style="min-height:35rem;">
        <div id="productscarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100 img-fluid" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
                    <img class="w-100 img-fluid" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
                    <img class="w-100 img-fluid" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
                </div>
                <div class="carousel-item">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" height="160" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
                    </div>
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" height="160" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
                    </div>
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" height="160" src="imgs/white-girls-t-shirts-500x500.jpg" alt="">
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#productscarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"><i class="fas fa-2x fa-arrow-alt-circle-left"></i></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#productscarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <i class="fas fa-2x fa-arrow-alt-circle-left"></i>
    </section>--%>
    <!-- / carousel  section -->


    <!-- About Us  section -->
    <section id="section4" class="d-flex align-items-center justify-content-center" style="min-height:35rem;">
        <div class="row w-75">
                    <div class="col-lg-4 col-md-6">
                        <img class="img-fluid m-auto" src="imgs/guy.gif" alt="">
                    </div>
                    <div class="col-lg-8 col-md-6">
                        <h4 class="text-uppercase mb-4">About Us</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. </p>

                        <p>Curabitur tortor. <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit</i>. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>

                    </div>
                

        </div>


    </section>
    <!-- / About Us  section -->


    <!-- Contact Us  section -->
    <section id="section5" style="background-image: linear-gradient(to bottom right,var(--bs-primary), var(--bs-info));">
        <div class=" d-flex align-items-center justify-content-center flex-column flex-wrap" style="min-height:25rem;">
            <div class="form-group w-25 p-4 bg-light">
                <h3 class="text-center text-capitalize mb-3">Contact Us</h3>
                <asp:TextBox CssClass="form-control mb-2" ID="Name" TextMode="SingleLine"
                    placeholder="Name" runat="server"></asp:TextBox>

                <asp:TextBox CssClass="form-control mb-2" ID="Email" TextMode="Email"
                    placeholder="Email" runat="server"></asp:TextBox>

                <asp:TextBox CssClass="form-control mb-4" ID="Msg" TextMode="MultiLine"
                    placeholder="Message" runat="server"></asp:TextBox>

                <asp:Button CssClass="btn text-white btn-lg w-100 border-0" style="border-radius: 60px; background-image: linear-gradient(to bottom right,var(--bs-primary), var(--bs-info));"
                    ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click"/>

            </div>
        </div>
    </section>
    <!-- / Contact Us  section -->

</asp:Content>
