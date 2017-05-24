<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testpayment.aspx.cs" Inherits="BloomsandBlossoms.testpayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <script src="https://checkout-static.citruspay.com/lib/js/jquery.min.js"></script>


</head>
<body>
     <form align="center" method="post" action="<%=formPostUrl%>">
       <input type="hidden" id="merchantTxnId" name="merchantTxnId" value="<%=merchantTxnId%>" />
       <input type="hidden" id="orderAmount" name="orderAmount" value="<%=orderAmount%>" />
       <input type="hidden" id="currency" name="currency" value="<%=currency%>" />
       <input type="text" id="email" name="email" value="someone@validemail.com" />
       <input type="text" id="phoneNumber" name="phoneNumber" value="9812309816" />        
       <input type="hidden" name="returnUrl" value="http://www.abc.com/return-url" />
       <input type="hidden" id="notifyUrl" name="notifyUrl" value="https://www.abc.com/notify-me" />
       <input type="hidden" id="secSignature" name="secSignature" value="<%=securitySignature%>" />
       <input type="Submit" value="Pay Now"/>
     </form> 
</body>
</html>
