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
                                    <asp:RadioButton ID="radioCOD" runat="server" class="form-control" GroupName="paymentmode" Text="Cash on Delivery(COD)"></asp:RadioButton>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:RadioButton ID="radioCreditDebit" runat="server" class="form-control" GroupName="paymentmode" Text="Credit or Debit Card"></asp:RadioButton>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:RadioButton ID="radioNetBank" runat="server" class="form-control" GroupName="paymentmode" Text="NetBanking"></asp:RadioButton>
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
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtCardNo" runat="server" class="form-control" placeholder="Credit/Debit Card Number" Text="4111111111111111"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">
                                    <asp:TextBox ID="txtCVVNo" runat="server" class="form-control" placeholder="CVV Number" Width="120px"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-2">
                                    Valid Through
                                    <asp:TextBox ID="txtMonth" runat="server" class="form-control" placeholder="MM" Width="80px" Text="07"></asp:TextBox>
                                </div>

                                <div class="form-group col-md-2">
                                    /
                                    <asp:TextBox ID="txtYear" runat="server" class="form-control" placeholder="YYYY" Width="80px" Text="2017"></asp:TextBox>
                                </div>
                                <div class="form-group col-md-12">

                                    <asp:Button class="btn btn-primary pull-right" value="Pay" Text="Make Payment" runat="server" EnableViewState="true" ID="buttonMakePayment"
                                         OnClick="btnMakePayment_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>


</asp:Content>
