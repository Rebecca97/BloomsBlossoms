<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="BloomsandBlossoms.Hotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
     <h2 class="title text-center">Lobby Arrangement</h2>
    <asp:DataList ID="dlHotelLobby" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlHotelLobby_ItemDataBound">
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
     <h2 class="title text-center">Banquet Hall Arrangement</h2>
    <asp:DataList ID="dlHotelBanquet" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlHotelBanquent_ItemDataBound">
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
     <h2 class="title text-center">Conference Hall Arrangement</h2>
    <asp:DataList ID="dlHotelConference" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlHotelConference_ItemDataBound">
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
     <h2 class="title text-center">Stand Arrangement</h2>
    <asp:DataList ID="dlHotelStand" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlHotelStand_ItemDataBound">
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
     <h2 class="title text-center">Driftwood Arrangement</h2>
    <asp:DataList ID="dlHotelDriftwood" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlHotelDriftwood_ItemDataBound">
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

