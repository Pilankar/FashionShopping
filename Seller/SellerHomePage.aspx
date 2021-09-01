<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellerHomePage.aspx.cs" Inherits="ShoppingWebsite.Seller.SellerHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        main .nav-item .fas,.fab,.far,.bi {
            margin: 0.5em;
        }

        main{
            padding: 0px;
        }
        main .navbar .btn {
            text-align: left;
        }

        main .navbar .nav-item:hover {
            background-color: var(--bs-danger);
        }
        .nav-main .nav-item:hover a{
            color:white;
        }
        .nav-main {
            min-height: 30rem;
        }
        .nav-main .btn {
            font-size: 0.875em;
        }
        .nav-main a {
            text-decoration: none;
            color: var(--bs-dark);
            font-family: sans-serif;
        }
        .nav-main .active a{
            color: var(--bs-primary);
        }
        
        @media only screen and (max-width: 770px) {
            .nav-main {
                min-height: auto;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="">
        <div class="row m-0">

            <div class="nav-main col-md-2 bg-gradient" style="background-color:lightgray">
                <nav class="navbar">
                    <ul class="navbar-nav w-100">
                        <li class="nav-item btn active">
                            <a class="" id="" href="#">
                                <i class="bi bi-house-door"></i>Sales Dashboard
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" id="orders" href="#">
                                <i class="bi bi-cash-stack"></i>Orders
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" id="" href="#">
                                <i class="bi bi-cart3"></i>View Products
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" id="" href="#">
                                <i class="bi bi-cart3"></i>Edit Products
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" id="" href="#">
                                <i class="bi bi-cart3"></i>Launch New Product
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" id="" href="#">
                                <i class="bi bi-cart3"></i>Add Stock
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="text-decoration-none" href="#">
                                <i class="bi bi-graph-up"></i>Reports
                            </a>
                        </li>
                        <%--<li class="nav-item btn">
                            <a class="" href="#">
                                <i class="fab fa-shopify"></i>Integrations
                            </a>
                        </li>--%>
                    </ul>

                    <h6 class="w-100 d-flex justify-content-between px-3 mt-4 mb-2 text-muted">
                        <span class="text-dark" >Saved reports</span>
                        <a class="link-secondary" href="#" aria-label="Add a new report">
                            <i class="fas fa-plus-circle"></i>
                        </a>
                    </h6>

                    <ul class="navbar-nav w-100">
                        <li class="nav-item btn">
                            <a class="" href="#">
                                <i class="far fa-file-alt"></i>
                                Current month
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" href="#">
                                <i class="far fa-file-alt"></i>
                                Last quarter
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="" href="#">
                                <i class="far fa-file-alt"></i>
                                Social engagement
                            </a>
                        </li>
                        <li class="nav-item btn">
                            <a class="t" href="#">
                                <i class="far fa-file-alt"></i>
                                Year-end sale
                            </a>
                        </li>
                    </ul>
                </nav>

            </div>


            <div class="col-md-10">
            </div>

        </div>
    </div>
</asp:Content>
