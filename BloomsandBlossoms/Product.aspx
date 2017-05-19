<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="BloomsandBlossoms.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <h2 class="title text-center">Our Products</h2>
    <asp:DataList ID="dlProduct" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlProduct_ItemDataBound">
    <ItemTemplate>
        <div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						
        <div class="col-sm-12">
							<div class="product-image-wrapper" style="width:270px; min-width:200px;">
								<div class="single-products">
									<div class="productinfo text-center">
										<asp:Image ID="Image1" runat="server" style="height:200px;width:160px;" ImageUrl='<%# Eval("PictureFileName") %>' />
										<h2><%# Eval("ProductPrice")%></h2>
										<p><b><%# Eval("ProductName") %></b></p>
										<a href="../Description.aspx?productid=<%# Eval("ProductID") %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay" >
										<div class="overlay-content" style="text-align:center;width:200px;">
											<h2><%# Eval("ProductPrice")%></h2>
											<p><%# Eval("ProductName") %></p>
											<a href="../Description.aspx?productid=<%# Eval("ProductID") %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
								<div class="choose">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</div>
                                </div>
							</div>
						</div>
    </ItemTemplate>
</asp:DataList>
</asp:Content>
