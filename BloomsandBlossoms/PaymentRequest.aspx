<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentRequest.aspx.cs" Inherits="BloomsandBlossoms.PaymentRequest" validateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            
            $('#FName').val($('#hdnFname').val());
            $('#LName').val($('#hdnLname').val());
            $('#Email').val($('#hdnEmail').val());
            $('#Address').val($('#hdnAddress').val());
            $('#City').val($('#hdnCity').val());
            $('#AddressZip').val($('#hdnZip').val());
            $('#State').val($('#hdnState').val());
            $('#Mobile').val($('#hdnMobile').val());
            $('#returnUrl').val($('#hdnReturnUrl').val());

            merchantURLPart = $('#hdnPaymentURL').val();
            
        });

        var merchantURLPart = "https://sandbox.citruspay.com/2lp1owe1le"; 

        var vanityURLPart = "";
        var reqObj = null;
        function generateHMAC() {
            
            if (window.XMLHttpRequest) {
                reqObj = new XMLHttpRequest();
            } else {
                reqObj = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (merchantURLPart.lastIndexOf("/") != -1) {
                vanityURLPart = merchantURLPart.substring(merchantURLPart.lastIndexOf("/") + 1)
            }
            var orderAmount = document.getElementById("orderAmount").value;
            var merchantTxnId = document.getElementById("merchantTxnId").value;
            var currency = document.getElementById("currency").value;
            var param = "merchantId=" + vanityURLPart + "&orderAmount=" + orderAmount
               + "&merchantTxnId=" + merchantTxnId + "&currency=" + currency;
            reqObj.onreadystatechange = process;
            reqObj.open("POST", "hmac_signature.ashx?" + param, false);
            reqObj.send(null);
        }
        function process() {
            if (reqObj.readyState == 4) {
                
                document.getElementById("secSignature").value = reqObj.responseText;
                submitForm();

            }
        }

        function submitForm() {
            alert(merchantURLPart);
            document.paymentForm.action = merchantURLPart;
            document.paymentForm.method = 'POST';
            document.paymentForm.submit();
        }

    </script>
</head>
<body>
    <form name="paymentForm" id="paymentForm" runat="server">
        <div style="text-align: center;">
            <br />
            <b style="align-content: center">Please wait... Redirecting...</b>
        </div>
        <div>
            <ul style="display: none;">
                <li class="clearfix">
                    <asp:Label ID="lbltransactionNo" runat="server" Width="125px" Text="Transaction Number:"></asp:Label>
                    <asp:TextBox ID="merchantTxnId" runat="server" name="merchantTxnId" value=""></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblOrderAmt" runat="server" Width="125px" Text="Order Amount:"></asp:Label>
                    <asp:TextBox ID="orderAmount" runat="server" name="orderAmount" value=""></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblCurrency" runat="server" Width="125px" Text="Currency:"></asp:Label>
                    <asp:TextBox ID="currency" runat="server" name="currency" value="INR"></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblFirstName" runat="server" Width="125px" Text="First Name:"></asp:Label>
                    <asp:TextBox ID="FName" runat="server" name="firstName" value=""></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblLastName" runat="server" Width="125px" Text="Last Name:"></asp:Label>
                    <asp:TextBox ID="LName" runat="server" name="lastName" value=""></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblEmail" runat="server" Width="125px" Text="Email:"></asp:Label>
                    <asp:TextBox ID="Email" runat="server" name="email" value=""></asp:TextBox>
                </li>

                <li>
                    <asp:Label runat="server" ID="lblAddressDetails"></asp:Label>
                </li>

                <li>Address Details</li>
                <li class="clearfix">
                    <asp:Label ID="lblAddress" runat="server" Width="125px" Text="Address:"></asp:Label>
                    <asp:TextBox ID="Address" runat="server" name="addressStreet1" value=""></asp:TextBox>
                </li>
                <li class="clearfix">
                    <asp:Label ID="lblCity" runat="server" Width="125px" Text="City:"></asp:Label>
                    <asp:TextBox ID="City" runat="server" name="addressCity" value=""></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblZipCode" runat="server" Width="125px" Text="Zip Code:"></asp:Label>
                    <asp:TextBox ID="AddressZip" runat="server" name="addressZip" value=""></asp:TextBox>
                </li>

                <li class="clearfix">
                    <asp:Label ID="lblState" runat="server" Width="125px" Text=" State:"></asp:Label>
                    <asp:TextBox ID="State" runat="server" name="addressState" value=""></asp:TextBox>
                </li>

                <!-- <input type="hidden" class="text" name="addressCountry" value="INDIA" /> -->

                <li class="clearfix">
                    <asp:Label ID="lblMobileNo" runat="server" Width="125px" Text="Mobile No:"></asp:Label>
                    <asp:TextBox ID="Mobile" runat="server" name="phoneNumber" value=""></asp:TextBox>
                </li>
            </ul>

            <asp:HiddenField ID="paymentMode" runat="server" Value="NET_BANKING" />
            <asp:HiddenField ID="issuerCode" runat="server" Value="ISS008" />

            <asp:TextBox ID="returnUrl" runat="server" name="returnUrl" value="" Width="500px"></asp:TextBox>

            <asp:HiddenField ID="secSignature" runat="server" Value="" />
            
            <asp:Button class="btn btn-primary pull-right" value="Make Payment" Text="Make Payment" runat="server" EnableViewState="true" ID="btnSubmit" OnClientClick="generateHMAC();" />

            <asp:HiddenField ID="hdnFname" runat="server" />
            <asp:HiddenField ID="hdnLname" runat="server" />
            <asp:HiddenField ID="hdnEmail" runat="server" />
            <asp:HiddenField ID="hdnAddress" runat="server" />
            <asp:HiddenField ID="hdnCity" runat="server" />
            <asp:HiddenField ID="hdnZip" runat="server" />
            <asp:HiddenField ID="hdnState" runat="server" />
            <asp:HiddenField ID="hdnMobile" runat="server" />
            <asp:HiddenField ID="hdnReturnUrl" runat="server" />
            <asp:HiddenField ID="hdnPaymentURL" runat="server" />

        </div>
    </form>
</body>
</html>
