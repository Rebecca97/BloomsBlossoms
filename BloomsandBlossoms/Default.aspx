<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BloomsandBlossoms._Default" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="mainpageholder">
        <div class="col-sm-3">
        <div class="left-sidebar">
            <h2>Category</h2>
            <div class="panel-group category-products" id="accordian">
                <!--category-productsr-->
                <div class="panel panel-default">
                    <div class="panel-heading">

    <asp:DataList ID="dlCategory" runat="server" RepeatColumns= "1" CellSpacing = "3" RepeatLayout="Flow" OnItemDataBound="dlCategory_ItemDataBound">
    <ItemTemplate>

                        <h4 class="panel-title"><a href="../Product.aspx?Category=<%# Eval("CategoryID") %>"><%# Eval("CategoryName") %></a></h4>
                    
            </ItemTemplate>
</asp:DataList>
                        </div>
                </div>
            </div>
    <div class="shipping text-center">
                <!--shipping-->
                <img src="images/home/shipping.jpg" alt="" />
            </div>
            <!--/shipping-->
            </div>
            </div>
</asp:Content>
           

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="features_items">
        <!--features_items-->
        <h2 class="title text-center">Special Items</h2>
        <div class="col-sm-9 padding-right">
         <asp:DataList ID="dlTopProduct" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlTopProduct_ItemDataBound">
    <ItemTemplate>
        
					<div class="features_items"><!--features_items-->
						
        <div class="col-sm-12">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<asp:Image ID="Image1" runat="server" style="height:200px;width:160px;" ImageUrl='<%# Eval("PictureFileName") %>' />
										<h2><%# Eval("ProductPrice")%></h2>
										<p><b><%# Eval("ProductName") %></b></p>
										<a href="../Description.aspx?productid=<%# Eval("ProductID") %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2><%# Eval("ProductPrice")%></h2>
											<p><%# Eval("ProductName") %></p>
                                            <a href="../Description.aspx?productid=<%# Eval("ProductID") %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
											
										</div>
									</div>
								</div>
								
                                </div>
							</div>
						</div>
            
    </ItemTemplate>
</asp:DataList>
   </div>   
    </div>
   

</asp:Content>
