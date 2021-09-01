<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ShoppingWebsite.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        main .container {
            max-width: 960px;
        }


        main {
            background-color: #EEEEEE66;
            /*background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://www.lsretail.com/hubfs/BLOG_6-technology-trends-reshaping-luxury-fashion-industry.jpg');
            background-position: right;
            background-repeat: no-repeat;
            background-size: cover;*/
            position: relative;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        main .row {
                margin-top: calc(var(--bs-gutter-y) * -1);
                margin-right: calc(var(--bs-gutter-x) * -.5);
                margin-left: calc(var(--bs-gutter-x) * -.5);
        }
        
        main .row>*{
            margin-top: var(--bs-gutter-y);
        }


        
    </style>

    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">

    <script type="text/javascript">
import { forEach } from "./fontawesome/js/v4-shims";

        $(document).ready(function () {
            //$("#Checkout").click(function () {
            //    let array = $(".needs-validation input").val();
            //    //if ($(".needs-validation input").val() == "") {
            //    //    //alert(" hi");
            //    //    $(".needs-validation input").css("border", "2px solid red");
            //    //}

            //    array.forEach(myFunction);
            //    jQuery.each(array, function (i, val) {
            //        alert("hi");
            //    });
            //});
            //let myFunction = function(item) {
            //    alert("hi");
            //}
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="py-4 text-center">
            <h2>Checkout form</h2>
        </div>
        <div class="row py-5 g-5">
            <!-- Cart Start-->
            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">Your cart</span>
                    <span class="badge bg-primary rounded-pill">3</span>
                </h4>
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Product name</h6>
                            <small class="text-muted">Brief description</small>
                        </div>
                        <span class="text-muted">$12</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Second product</h6>
                            <small class="text-muted">Brief description</small>
                        </div>
                        <span class="text-muted">$8</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between lh-sm">
                        <div>
                            <h6 class="my-0">Third item</h6>
                            <small class="text-muted">Brief description</small>
                        </div>
                        <span class="text-muted">$5</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between bg-light">
                        <div class="text-success">
                            <h6 class="my-0">Promo code</h6>
                            <small>EXAMPLECODE</small>
                        </div>
                        <span class="text-success">−$5</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (USD)</span>
                        <strong>$20</strong>
                    </li>
                </ul>
                <div class="card p-2">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Promo code">
                        <button type="submit" class="btn btn-secondary">Redeem</button>
                    </div>
                </div>
            </div>
            <!-- Cart Done -->

            <!-- Checkout Start-->
            <div class="col-md-7 col-lg-8">
                <h4 class="mb-3">Billing address</h4>
                <div class="needs-validation">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="firstName" class="form-label">First name</label>
                            <asp:TextBox CssClass="form-control" ID="firstName" placeholder="" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vFName" runat="server" ControlToValidate="firstName" 
                                ErrorMessage="Valid first name is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-sm-6">
                            <label for="lastName" class="form-label">Last name</label>
                            <asp:TextBox CssClass="form-control" ID="lastName" placeholder="" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vLName" runat="server" ControlToValidate="lastName" 
                                ErrorMessage="Valid last name is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="col-12">
                            <label for="username" class="form-label">Username</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text">@</span>
                                <asp:TextBox CssClass="form-control" ID="username" placeholder="Username" runat="server"></asp:TextBox>
                                
                            </div>
                            <asp:RequiredFieldValidator ID="vusername" runat="server" ControlToValidate="username" 
                                    ErrorMessage="Your username is required." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                
                        </div>

                        <div class="col-12">
                            <label for="contact" class="form-label">Contact</label>
                            <asp:TextBox CssClass="form-control" ID="contact" runat="server" placeholder="" TextMode="Phone"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="vcontact1" runat="server" ForeColor="Red"
                                ControlToValidate="contact" ErrorMessage="Please enter a valid Phone Number for shipping updates." Display="Dynamic">
                            </asp:RequiredFieldValidator>
                                
                        </div>
                        
                        <div class="col-12">
                            <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
                            <asp:TextBox CssClass="form-control" ID="email" placeholder="you@example.com" runat="server" TextMode="Email"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="vemail" runat="server" ControlToValidate="email" 
                                    ErrorMessage="Please enter a valid email address for shipping updates." Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                
                        </div>

                        <div class="col-12">
                            <label for="address" class="form-label">Address</label>
                            <asp:TextBox CssClass="form-control" ID="address" placeholder="1234 Main St" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Vaddr" runat="server" ControlToValidate="address" 
                                    ErrorMessage="Please enter your shipping address." Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                               
                        </div>

                        <div class="col-12">
                            <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
                            <asp:Textbox CssClass="form-control" ID="address2" placeholder="Apartment or suite" runat="server"></asp:Textbox>
                        </div>

                        <div class="col-md-5">
                            <label for="country" class="form-label">Country</label>
                            <select class="form-select" id="country" required>
                                <option value="">Choose...</option>
                                <option>United States</option>
                            </select>
                            <div class="invalid-feedback">
                                Please select a valid country.
                                 
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label for="state" class="form-label">State</label>
                            <select class="form-select" id="state" required>
                                <option value="">Choose...</option>
                                <option>California</option>
                            </select>
                            <div class="invalid-feedback">
                                Please provide a valid state.
                                 
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="zip" class="form-label">Zip</label>
                            <input type="text" class="form-control" id="zip" placeholder="" required>
                            <div class="invalid-feedback">
                                Zip code required.
                                 
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="same-address">
                        <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
                    </div>

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="save-info">
                        <label class="form-check-label" for="save-info">Save this information for next time</label>
                    </div>

                    <hr class="my-4">

                    <h4 class="mb-3">Payment</h4>

                    <div class="my-3">
                        <div class="form-check">
                            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                            <label class="form-check-label" for="credit">Credit card</label>
                        </div>
                        <div class="form-check">
                            <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
                            <label class="form-check-label" for="debit">Debit card</label>
                        </div>
                        <div class="form-check">
                            <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
                            <label class="form-check-label" for="paypal">PayPal</label>
                        </div>
                    </div>

                    <div class="row gy-3">
                        <div class="col-md-6">
                            <label for="cc-name" class="form-label">Name on card</label>
                            <input type="text" class="form-control" id="cc-name" placeholder="" required>
                            <small class="text-muted">Full name as displayed on card</small>
                            <div class="invalid-feedback">
                                Name on card is required
                                 
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="cc-number" class="form-label">Credit card number</label>
                            <input type="text" class="form-control" id="cc-number" placeholder="" required>
                            <div class="invalid-feedback">
                                Credit card number is required
                                 
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cc-expiration" class="form-label">Expiration</label>
                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                            <div class="invalid-feedback">
                                Expiration date required
                                 
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cc-cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Security code required
                                 
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">
                    <asp:Button ID="Pay" CssClass="w-100 btn btn-primary btn-lg" runat="server" Text="Continue to checkout" ClientIDMode="Static" />
                </div>
            </div>
            <!-- Checkout Done-->

        </div>
    </div>
</asp:Content>
