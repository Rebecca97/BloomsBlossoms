<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="BloomsandBlossoms.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <h2 class="title text-center">Our Products</h2>
    <asp:DataList ID="dlProduct" runat="server" RepeatColumns= "6" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlProduct_ItemDataBound">
    <ItemTemplate>
        <div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						
        <div class="col-sm-12">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PictureFileName") %>' />
										<h2><%# Eval("ProductPrice")%></h2>
										<p><b><%# Eval("ProductName") %></b></p>
										<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2><%# Eval("ProductPrice")%></h2>
											<p><%# Eval("ProductName") %></p>
											<a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
                                </div>
							</div>
						</div>
    </ItemTemplate>
</asp:DataList>
</asp:Content>
