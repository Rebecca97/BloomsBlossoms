<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="BloomsandBlossoms.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div id="contact-page" class="container">
     <div class="bg">
        		<div class="row">  	
	    		<div class="col-sm-8">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Contact Us</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<asp:HiddenField ID="hfContactUsID" runat="server" Value="0" />
				            <div class="form-group col-md-12">
				                <asp:TextBox ID="txtContactName" runat="server" class="form-control" required="required" placeholder="Name"></asp:TextBox>
				            </div>
				            <div class="form-group col-md-6">
				                <asp:TextBox ID="txtContactEmail" runat="server" class="form-control" required="required" placeholder="Email ID"></asp:TextBox>
				            </div>
                        <div class="form-group col-md-6">
				               <asp:TextBox ID="txtContactPhone" runat="server" class="form-control" required="required" placeholder="Phone Number"></asp:TextBox>
				            </div>
				            <div class="form-group col-md-12">
				                <asp:TextBox ID="txtContactSubject" runat="server" class="form-control" required="required" placeholder="Subject"></asp:TextBox>
				            </div>
				            <div class="form-group col-md-12">
				                <asp:TextBox ID="txtContactMessage" runat="server" class="form-control" required="required" placeholder="Message/Comments" TextMode="MultiLine"></asp:TextBox>
				            </div>                        
				            <div class="form-group col-md-12">
				                <asp:Button class="btn btn-primary pull-right" value="Save" Text="Submit" runat="server" EnableViewState="true" ID="btnContactUs" OnClick="btnSubmitContactUs_Click" />
				            </div>
				       
	    			</div>
	    		</div>
                    </div>
         </div>
        </div>
    </asp:Content>
