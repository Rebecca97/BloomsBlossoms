<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wedding.aspx.cs" Inherits="BloomsandBlossoms.Wedding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <h2 class="title text-center">Stage Arrangement</h2>
    <asp:DataList ID="dlWeddingStage" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingStage_ItemDataBound">
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
     <h2 class="title text-center">Back Drop Arrangement</h2>
    <asp:DataList ID="dlWeddingBackDrop" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingBackDrop_ItemDataBound">
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
     <h2 class="title text-center">Car Decoration</h2>
    <asp:DataList ID="dlWeddingCar" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingCar_ItemDataBound">
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
     <h2 class="title text-center">Alter Arrangement</h2>
    <asp:DataList ID="dlWeddingAlter" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingAlter_ItemDataBound">
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
     <h2 class="title text-center">First Night</h2>
    <asp:DataList ID="dlWeddingFirstNight" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingFirstNight_ItemDataBound">
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
    <h2 class="title text-center">Bridal Bouquets</h2>
    <asp:DataList ID="dlWeddingBridalBouquets" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingBridalBouquets_ItemDataBound">
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
    <h2 class="title text-center">Garlands and Chendu</h2>
    <asp:DataList ID="dlWeddingGarlands" runat="server" RepeatColumns= "5" CellSpacing = "3" RepeatLayout = "Table" OnItemDataBound="dlWeddingGarlands_ItemDataBound">
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
