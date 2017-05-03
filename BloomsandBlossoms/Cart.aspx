<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BloomsandBlossoms.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">


    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                    
                        <asp:DataList ID="dlCart" runat="server" CssClass="table table-condensed" RepeatColumns="1" CellSpacing="3" RepeatLayout="Table" OnItemDataBound="dlCart_ItemDataBound">
                            <ItemTemplate>

                                <tbody>
                                    <tr>
                                        <td class="cart_product">
                                            <a href="../Description.aspx?productid=<%# Eval("ProductID")%>">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PictureFileName") %>' /></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><a href=""><%# Eval("ProductName") %></a></h4>
                                            <p><%# Eval("ProductID")%></p>
                                        </td>
                                        <td class="cart_price">
                                            <p><%# Eval("ProductPrice")%></p>
                                        </td>
                                        <td class="cart_quantity">
                                            <div class="cart_quantity_button">
                                                <a class="cart_quantity_up" href="">+ </a>
                                                <input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
                                                <a class="cart_quantity_down" href="">- </a>
                                            </div>
                                        </td>
                                        <td class="cart_total">
                                            <p class="cart_total_price"><%# Eval("ProductPrice")%></p>
                                        </td>
                                        <td class="cart_delete">
                                            <a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <HeaderTemplate>
                                <thead>
                                    <tr class="cart_menu">
                                        <td class="image">Item</td>
                                        <td class="description"></td>
                                        <td class="price">Price</td>
                                        <td class="quantity">Quantity</td>
                                        <td class="total">Total</td>
                                        <td></td>
                                    </tr>
                                </thead>
                            </HeaderTemplate>
                        </asp:DataList>
                   
                </div>
            
        </div>
    </section>
    <!--/#cart_items-->

    <section id="do_action">
        <div class="container" >
            <div class="heading" style="display:none;">
                <h3>What would you like to do next?</h3>
                <p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
            </div>
            <div class="row" >
                <div class="col-sm-6" >
                    <div class="chose_area" style="display:none;">
                        <ul class="user_option">
                            <li>
                                <input type="checkbox">
                                <label>Use Coupon Code</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Use Gift Voucher</label>
                            </li>
                            <li>
                                <input type="checkbox">
                                <label>Estimate Shipping & Taxes</label>
                            </li>
                        </ul>

                        <a class="btn btn-default check_out" href="">Continue</a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="total_area">
                        <ul>
                            <li>Cart Sub Total <span><asp:Label ID="calculateTotalPrice" runat="server" Text="0"></asp:Label></span></li>
                            <li>Service Tax <span><asp:Label ID="calculateServiceTaxAmt" runat="server" Text="0"></asp:Label></span></li>
                            <!--<li>Shipping Cost <span>Free</span></li>-->
                            <li>Total <span><asp:Label ID="calculateNetTotalPrice" runat="server" Text="0"></asp:Label></span></li>
                        </ul>
                        <a class="btn btn-default update" href="">Update</a>
                        <a class="btn btn-default check_out" href="">Check Out</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#do_action-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>


</asp:Content>
