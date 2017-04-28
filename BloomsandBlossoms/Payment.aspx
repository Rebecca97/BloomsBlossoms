<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="BloomsandBlossoms.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainpageholder" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server" ViewStateMode="Enabled">
                    
	                    <div class="row">
                        <div class="col-sm-8">
                            <div class="contact-form">
                                <h2 class="title text-center">Choose Payment method</h2>
                                <div class="status alert alert-success" style="display: none"></div>
                                <asp:HiddenField ID="hfAddressID" runat="server" Value="0" />
                                <div class="form-group col-md-12">
                                    <asp:RadioButton ID="radioCOD" runat="server" class="form-control" GroupName="paymentmode" text="Cash on Delivery(COD)"></asp:RadioButton>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:RadioButton ID="radioCreditDebit" runat="server" class="form-control" GroupName="paymentmode" text="Credit or Debit Card" ></asp:RadioButton>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:RadioButton ID="radioNetBank" runat="server" class="form-control" GroupName="paymentmode" text="NetBanking" ></asp:RadioButton>
                                </div>
                                <div class="form-group col-md-4">

                                    <asp:Button class="btn btn-primary pull-right" value="Proceed" Text="Proceed" runat="server" EnableViewState="true" ID="buttonProceed" OnClick="btnProceed_Click" />
                                </div>                              
                            </div>
                        </div>

                    </div>
		</asp:View>
                <asp:View ID="View2" runat="server">
			<div class="row">
				<div class="col-sm-8">
					 <div class="contact-form">
						<h2>Login to your account</h2>
						
							 <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtCardNo" runat="server" class="form-control" placeholder="Credit/Debit Card Number"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtCVVNo" runat="server" class="form-control" placeholder="CVV Number" width="120px"></asp:TextBox>
                                </div>
                                
						        <div class="form-group col-md-2">
                                    Valid Through
                                    <asp:TextBox ID="txtMonth" runat="server" class="form-control" placeholder="MM" width="80px"></asp:TextBox>
                                </div>
                         
                                    <div class="form-group col-md-2">
                                        /
                                    <asp:TextBox ID="txtYear" runat="server" class="form-control" placeholder="YYYY" width="80px"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">

                                    <asp:Button class="btn btn-primary pull-right" value="Pay" Text="Make Payment" runat="server" EnableViewState="true" ID="buttonMakePayment"  />
                                </div>   
					</div>
				</div>
			</div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
	
	
</asp:Content>
