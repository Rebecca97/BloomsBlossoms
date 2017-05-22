<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestDemo.aspx.cs" Inherits="BloomsandBlossoms.RequestDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="http://code.jquery.com/jquery-1.11.1.min.js"> </script>
    <script src="https://icp.citruspay.com/js/citrus.js"> </script>
    <script src="https://icp.citruspay.com/js/jquery.payment.js"> </script>
    <script type="text/javascript">
    CitrusPay.Merchant.Config = {
        // Merchant details
        Merchant: {
            accessKey: 'II2JZGSKSL99ZRS397PW', //Replace with your access key
            vanityUrl: '2lp1owe1le'  //Replace with your vanity URL
        }
    };
    
    fetchPaymentOptions();
    
    function handleCitrusPaymentOptions(citrusPaymentOptions) {
        if (citrusPaymentOptions.netBanking != null)
            for (i = 0; i < citrusPaymentOptions.netBanking.length; i++) {
                var obj = document.getElementById("citrusAvailableOptions");
                var option = document.createElement("option");
                option.text = citrusPaymentOptions.netBanking[i].bankName;
                option.value = citrusPaymentOptions.netBanking[i].issuerCode;
                obj.add(option);
            }
    }
    function citrusServerErrorMsg(errorResponse) {
        alert('1');
        console.log(errorResponse);
    }
    function citrusClientErrMsg(errorResponse) {
        alert('2');
        console.log(errorResponse);
    }
  
    //UI validations
    jQuery(document).ready(function () {
        jQuery.support.cors = true;

        // setup card inputs;	 	
        jQuery('#citrusExpiry').payment('formatCardExpiry');
        jQuery('#citrusCvv').payment('formatCardCVC');
        jQuery('#citrusNumber').keyup(function () {
            var cardNum = jQuery('#citrusNumber').val().replace(/\s+/g, '');
            var type = jQuery.payment.cardType(cardNum);
            console.log(type);
            jQuery("#citrusNumber").css("background-image", "url(images/" + type + ".png)");
            if (type != 'amex')
                jQuery("#citrusCvv").attr("maxlength", "3");
            else
                jQuery("#citrusCvv").attr("maxlength", "4");
            jQuery('#citrusNumber').payment('formatCardNumber');
            jQuery("#citrusScheme").val(type);

            document.getElementById("#citrusMerchantTxnId") = "201705190150201234";
        });
    });
    </script>
</head>
<body>
   
 <%  
     //Need to change with your Secret Key
     string secret_key = "87851b4fda1d3aa96edad6a7053f889d867a3c54";

     //Need to change with your Access Key
     string access_key = "II2JZGSKSL99ZRS397PW";

     //Should be unique for every transaction
     string txn_id = citrusMerchantTxnId.Value = "201705190150201234";
         //System.DateTime.Now.ToString("yyyyMMddHHmmssffff");

     //Need to change with your Order Amount
     string amount = citrusAmount.Text = "1.00";

     //Need to change with your Return URL
     string returnURL=citrusReturnUrl.Value = "http://localhost:50544/ResponseDemo.aspx";
     //Need to change with your Notify URL
     string notifyUrl =citrusNotifyUrl.Value= "http://localhost:50544/ResponseDemo.aspx";

     string data = "merchantAccessKey=" +access_key + "&transactionId=" +txn_id + "&amount=" + amount;
     System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
     System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
     string securitySignature = citrusSignature.Value= BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();

     /*Response.Write(securitySignature);*/
     %>
    <form id="frmPayment" runat="server" method="post">
        <input type="hidden" id="citrusFirstName" value="" runat="server" />
        <input type="hidden" id="citrusLastName" value="" runat="server" />
        Email:
        <input type="text" id="citrusEmail" value="" runat="server" />
        <input type="hidden" id="citrusStreet1" value="" runat="server" />
        <input type="hidden" id="citrusStreet2" value="" runat="server"/>
        <input type="hidden" id="citrusCity" value="" runat="server"/>
        <input type="hidden" id="citrusState" value="" runat="server"/>
        <input type="hidden" id="citrusCountry" value="" runat="server"/>
        <input type="hidden" id="citrusZip" value="" runat="server"/><br />
        Phone Number:
        <input type="text" id="citrusMobile" value="" runat="server"/><br />

        <asp:TextBox ID="citrusAmount" runat="server" value='<%=amount %>'></asp:TextBox>

        <%--<input type="text" runat="server"  id="citrusAmount" value="<%=amount %>" />--%>
        <br />
        <input type="text" runat="server"  id="citrusMerchantTxnId" />
        <br />
        <input type="hidden" runat="server" id="citrusSignature" value="<%= securitySignature %>" />
        <input type="hidden" runat="server"  id="citrusReturnUrl" value="<%= returnURL %>" />
        <input type="hidden" runat="server"  id="citrusNotifyUrl" value="<%= notifyUrl %>" />
        Card Type:
         <select id="citrusCardType">
        <option selected="selected" value="credit">Credit</option>
        <option value="debit">Debit</option>
        </select>
        <br />Card Scheme:
        <select id="citrusScheme">
            <option selected="selected" value="visa">VISA</option>
            <option value="mastercard">MASTER</option>
        </select>
        <br />Card Number:
        <input type="text" id="citrusNumber" value=""/>
        <br />Name on Card:
        <input type="text" id="citrusCardHolder" value=""/>
        <br />Expiry Date:
        <input type="text" id="citrusExpiry" value=""/>
        <br />CVV Number:
        <input type="text" id="citrusCvv" value=""/>
        <br />
        <input type="button" value="Pay Now" id="citrusCardPayButton"/>

        <select id="citrusAvailableOptions">
            <option>Axis Bank</option>
             <option>HDFC</option>
             <option>SBI</option>
             <option>SIB</option>
             <option>Federal Bank</option>
             <option>Citi Bank</option>
        </select>
        <input type="button" value="Pay by netbanking" id="citrusNetbankingButton" />
    </form>


     <script type="text/javascript">
        //Net Banking
         $('#citrusNetbankingButton').on("click", function () { makePayment("netbanking") });
        //Card Payment
         $("#citrusCardPayButton").on("click", function () {
             var signt = document.getElementById("citrusSignature").value;
             alert(signt);
             var keys = "&merchantAccessKey=II2JZGSKSL99ZRS397PW&secretKey=87851b4fda1d3aa96edad6a7053f889d867a3c54";
             var req = "https://checkout.citruspay.com/ssl/checkout/2lp1owe1le?";
             var params = "Name=Manjula&Address=Chennai&Email=manjula.thirugnanasambandam@gmail.com&Mobile=9894386345&Payment=1.00&merchantTxnId=201705190150201234&orderAmount=1.00&currency=INR&signature=";
             var allParams = req.concat(params.concat(signt));
             alert(allParams);

             document.getElementById("frmPayment").action = req;
             
             //"https://checkout.citruspay.com/ssl/checkout/2lp1owe1le?Name=Manjula&Address=Chennai&Email=manjula.thirugnanasambandam@gmail.com&Mobile=9894386345&Payment=1.00&merchantTxnId=201705190150201234&orderAmount=1.00&currency=INR&secSignature=" + signt;
             document.getElementById("frmPayment").submit();
         });
    </script>
</body>
</html>
