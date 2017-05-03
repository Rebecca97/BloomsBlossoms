<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Description.aspx.cs" Inherits="BloomsandBlossoms.Description" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="images/product-details/1.jpg" alt="" />
								<asp:Image ID="imgproductpicture" runat="server" />

							</div>
                            <div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival" alt="" />
								<h2><asp:Label ID="productname" runat="server" Text="0"></asp:Label></h2>
								<p><asp:Label ID="productid" runat="server" Text="0"></asp:Label></p>
                                <p><asp:Label ID="productdescription" runat="server" Text="0"></asp:Label></p>
								<img src="images/product-details/rating.png" alt="" />
								<span>
									<span><asp:Label ID="productprice" runat="server" Text="0"></asp:Label></span>
									<label>Quantity:</label>
									<input type="text" value="3" />
									<button type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Add to cart
									</button>
								</span>
								<p><b>Availability:</b><asp:Label ID="productavailibility" runat="server" Text="0"></asp:Label></p>
								<a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
                            </div>
                        </div>
</asp:Content>
