<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Cart.aspx.cs" Inherits="BloomsandBlossoms.Cart" %>

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
                    
                        <asp:DataList ID="dlCart" runat="server" DataKeyField="ProductID" OnDeleteCommand="dlCart_DeleteCommand" CssClass="table table-condensed" RepeatColumns="1" CellSpacing="3" RepeatLayout="Table" OnItemDataBound="dlCart_ItemDataBound" OnSelectedIndexChanged="dlCart_SelectedIndexChanged">
                            <ItemTemplate>

                                <tbody>
                                    <tr>
                                        <td class="cart_product">
                                            <asp:HiddenField ID="hfCartID" runat="server" Value="0" />
                                            <a href="../Description.aspx?productid=<%# Eval("ProductID")%>">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="#" /></a>
                                        </td>
                                        <td class="cart_description">
                                            <h4><asp:Label ID="lblProductName" runat="server" CssClass="cart_quantity_input" Text=""></asp:Label></h4><br />
                                            <p><asp:Label ID="productid" runat="server" Text=<%# Eval("ProductID")%>></asp:Label></p>
                                        </td>
                                        <td class="cart_price">
                                            <p><asp:Label ID="lblProductPrice" runat="server" CssClass="cart_quantity_input" Text='<%# Eval("ProductPrice")%>' /></p>
                                        </td>
                                        <td class="cart_quantity">
                                            <div class="cart_quantity_button">
                                            
                                                <asp:Label ID="lblQuantity" runat="server" CssClass="cart_quantity_input" Text=<%# Eval("ProductQuantity")%>></asp:Label>
                                                
                                                
                                            </div>
                                        </td>
                                        <td class="cart_total">                                            
                                            <asp:Label ID="lblTotalProductPrice" runat="server" CssClass="cart_total_price" Text=""></asp:Label>
                                        </td>
                                        <td class="cart_delete">
                                             <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="delete" class="cart_quantity_delete"><i class="fa fa-times"></i></asp:LinkButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <HeaderTemplate>
                                <thead>
                                    <tr class="cart_menu">
                                        <td class="image">Item</td>
                                        <td class="description"></td>
                                        <td class="price">Price (Rs.)</td>
                                        <td class="quantity">Quantity</td>
                                        <td class="total">Total (Rs.)</td>
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
                            <li>Cart Sub Total (Rs.) <span><asp:Label ID="lblCalculateTotalPrice" runat="server" Text="0"></asp:Label></span></li>
                            <li>Service Tax (Rs.) <span><asp:Label ID="lblCalculateServiceTaxAmt" runat="server" Text="0"></asp:Label></span></li>
                            <!--<li>Shipping Cost <span>Free</span></li>-->
                            <li>Total (Rs.) <span><asp:Label ID="lblNetTotalPrice" runat="server" Text="0"></asp:Label></span></li>
                        </ul>
                       <asp:Button class="btn btn-default check_out" value="Checkout" Text="Continue to checkout" runat="server" EnableViewState="true" ID="buttonCheckout" OnClick="btnCheckout_Click" />
                        
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
     <%--<form align="center" method="post" action="<%=formPostUrl%>">
       <input type="hidden" id="merchantTxnId" name="merchantTxnId" value="<%=merchantTxnId%>" />
       <input type="hidden" id="orderAmount" name="orderAmount" value="<%=orderAmount%>" />
       <input type="hidden" id="currency" name="currency" value="<%=currency%>" />
       <input type="text" id="email" name="email" value="someone@validemail.com" />
       <input type="text" id="phoneNumber" name="phoneNumber" value="9812309816" />        
       <input type="hidden" name="returnUrl" value="http://www.abc.com/return-url" />
       <input type="hidden" id="notifyUrl" name="notifyUrl" value="https://www.abc.com/notify-me" />
       <input type="hidden" id="secSignature" name="secSignature" value="<%=securitySignature%>" />
       <input type="Submit" value="Pay Now"/>
     </form> --%>

</asp:Content>
