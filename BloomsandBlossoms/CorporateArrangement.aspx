<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CorporateArrangement.aspx.cs" Inherits="BloomsandBlossoms.CorporateArrangement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
        <h2 class="title text-center">Regular Arrangement</h2>
    <asp:DataList ID="dlCorporate" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlCorporate_ItemDataBound">
    <ItemTemplate>
        <div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						
        <div class="col-sm-12">
							<div class="product-image-wrapper" style="width:270px; min-width:200px;">
								<div class="single-products">
									<div class="productinfo text-center">
										<asp:Image ID="Image1" runat="server" style="height:200px;width:160px;" ImageUrl='<%# Eval("ArrangementPictureFileLocation") %>' />
									
									</div>
									
								</div>
								
                                </div>
							</div>
						</div>
    </ItemTemplate>
</asp:DataList>
</asp:Content>

