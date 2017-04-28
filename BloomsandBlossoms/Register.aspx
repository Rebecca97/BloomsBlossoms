<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BloomsandBlossoms.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 80px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server" ViewStateMode="Enabled">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2 class="title text-center">Registration Form </h2>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="contact-form">
                                <h2 class="title text-center">Fill</h2>
                                
                                <div class="status alert alert-success" style="display: none"></div>

                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control" required="required" placeholder="Username"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" required="required" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-6">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" required="required" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtEmailID" runat="server" class="form-control" required="required" placeholder="Email ID"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" required="required" class="form-control" placeholder="Phone Number"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-4">

                                    <asp:Button class="btn btn-primary pull-right" value="Submit" Text="Submit" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                </div>
                                <div class="form-group col-md-2">
                                    <asp:Button class="btn btn-primary pull-right" value="reset" Text="Reset" runat="server" ID="btnReset" OnClick="btnReset_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="row">
                        <div class="col-sm-12">
                            <h2 class="title text-center">Registration Completed - Please verify your emailid </h2>

                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>

</asp:Content>

