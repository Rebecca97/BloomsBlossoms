<%@ Page Title="Product Description Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Description.aspx.cs" Inherits="BloomsandBlossoms.Description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">

    
        <div class="product-details">
            <!--product-details-->
            
                <div class="view-product" style="float:left;margin-left:200px;">

                    <asp:Image ID="imgproductpicture" runat="server" />

                </div>
                <div class="col-sm-5" style="float:left;margin-left:200px;">
                    <div class="product-information">
                        <!--/product-information-->
                        <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                        <asp:HiddenField ID="hfCartID" runat="server" Value="0" />
                        <h2>
                            <asp:Label ID="productname" runat="server" Text="0"></asp:Label></h2>
                        <p>
                            <asp:Label ID="productid" runat="server" Text="0"></asp:Label></p>
                        <p>
                            <asp:Label ID="productdescription" runat="server" Text="0"></asp:Label></p>
                        <img src="images/product-details/rating.png" alt="" />
                        <span>
                            <span>
                                <asp:Label ID="productprice" runat="server" Text="0"></asp:Label></span>
                            <label>Quantity:</label>
                            <asp:TextBox ID="txtQuantity" runat="server" Text="1" MaxLength="1"></asp:TextBox>                           
                            <asp:LinkButton ID="lbtnaddcard" runat="server"  ValidationGroup="CartGroup" OnClick="btnsubmit_Click" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</asp:LinkButton>
                        </span>
                        <p><b>Availability:</b><asp:Label ID="productavailibility" runat="server" Text=""></asp:Label></p>
                        <a href="#">
                            <img src="images/product-details/share.png" class="share img-responsive" alt="" /></a>
                    </div>
                    <!--/product-information-->
                </div>

        </div>

</asp:Content>
