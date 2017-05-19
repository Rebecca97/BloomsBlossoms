﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="BloomsandBlossoms.Signin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server" ViewStateMode="Enabled">
                    
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Login to your account</h2>
						
							 <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtGetUserName" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fill in your Username" ForeColor="Red" ControlToValidate="txtGetUserName"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtGetPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fill in your Password" ForeColor="Red" ControlToValidate="txtGetPassword"></asp:RequiredFieldValidator>
                                </div>
						        <div class="form-group col-md-4">
                                    <asp:Button class="btn btn-primary pull-right" Text="Login" runat="server" ID="btnLogin" CausesValidation="false" ValidationGroup="red" OnClick="btnLogin_Click" />
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:Label ID="lblErrorMsg" runat="server" class="status alert alert-success" Text=""></asp:Label>
                                </div>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<div class="status alert alert-success" style="display: none"></div>

                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Username Required" ForeColor="Red" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Passowrd Required" ForeColor="Red" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm Password Required" ForeColor="Red" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtGetPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Doesn't match Passowrd entered" ForeColor="Red"></asp:CompareValidator>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtEmailID" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email ID Required" ForeColor="Red" ControlToValidate="txtEmailID"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID" ErrorMessage="Enter Valid Email ID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phone Number Required" ForeColor="Red" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group col-md-4">
                                    <asp:Button class="btn btn-primary pull-right" value="Submit" Text="REGISTER" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                </div>
                                <div class="form-group col-md-3">
                                    <asp:Button class="btn btn-primary pull-right" value="reset" Text="RESET" runat="server" ID="btnReset" OnClick="btnReset_Click" />
                                </div>
                               
					</div><!--/sign up form-->
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
