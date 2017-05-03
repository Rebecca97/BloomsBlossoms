<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CompanyInformation.aspx.cs" Inherits="BloomsandBlossoms.CompanyInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="contact-form">
                                <h2 class="title text-center">Company Contact Information</h2>
                                <div class="status alert alert-success" style="display: none"></div>
                                <asp:HiddenField ID="hfAddressID" runat="server" Value="0" />
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtName" runat="server" class="form-control" required="required" placeholder="Company Name"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" required="required" placeholder="Address"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtState" runat="server" required="required" class="form-control" placeholder="State"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtCountry" runat="server" required="required" class="form-control" placeholder="Country"></asp:TextBox>
                                </div>
                                 <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtPin" runat="server" required="required" class="form-control" placeholder="Pin Code"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtPhone" runat="server" class="form-control" required="required" placeholder="Phone Number"></asp:TextBox>
                                </div>
                                 <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtEmail" runat="server" required="required" class="form-control" placeholder="Email ID"></asp:TextBox>
                                </div>
                             
                                 <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtServiceTax" runat="server" required="required" class="form-control" placeholder="Service Tax Amount"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtTinNo" runat="server" required="required" class="form-control" placeholder="TIN Number"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtWebsite" runat="server" required="required" class="form-control" placeholder="Website"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtLogo" runat="server" required="required" class="form-control" placeholder="Logo"></asp:TextBox>
                                </div>
                                   </div>
                               <!-- <div class="form-group col-md-4">

                                    <asp:Button class="btn btn-primary pull-right" value="Save" Text="Save" runat="server" EnableViewState="true" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                </div> -->                               
                            </div>
                        </div>
                       </div>
                    </div>
        
    
</asp:Content>
