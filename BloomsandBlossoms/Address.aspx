<%@ Page Title="Address" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="BloomsandBlossoms.Address" %>
<%@ Register src="UserControl/footer.ascx" tagname="footer" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 100%;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="contact-form">
                                <h2 class="title text-center">Fill out your address details</h2>
                                <div class="status alert alert-success" style="display: none"></div>
                                <asp:HiddenField ID="hfAddressID" runat="server" Value="0" />
                                <div class="form-group col-md-12">
                                    <h4>Contact Name:</h4>
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" required="required" placeholder="Contact Person Name"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                <h4>Address Line 1:</h4>
                                    <asp:TextBox ID="txtAddress1" runat="server" class="form-control" required="required" placeholder="Address Line 1"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <h4>Address Line 2:</h4>
                                    <asp:TextBox ID="txtAddress2" runat="server" class="form-control" required="required" placeholder="Address Line 2"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <h4>City:</h4>
                                    <asp:TextBox ID="txtCity" runat="server" class="form-control" required="required" placeholder="City"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <h4>State:</h4>
                                    <asp:TextBox ID="txtState" runat="server" required="required" class="form-control" placeholder="State"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <h4>Country:</h4>
                                    <asp:TextBox ID="txtCountry" runat="server" required="required" class="form-control" placeholder="Country"></asp:TextBox>
                                </div>
                                 <div class="form-group col-md-12">
                                     <h4>Pin Code:</h4>
                                    <asp:TextBox ID="txtPin" runat="server" required="required" class="form-control" placeholder="Pin Code"></asp:TextBox>
                                </div>
                                 <div class="form-group col-md-12">
                                     <h4>Note:</h4>
                                    <asp:TextBox ID="txtNote" runat="server" required="required" class="form-control" placeholder="Note"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4">

                                    <asp:Button class="btn btn-primary pull-right" value="Save" Text="Save" runat="server" EnableViewState="true" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                </div>                                
                            </div>
                        </div>

                    </div>
        </div>
    </div>

    </asp:Content>

