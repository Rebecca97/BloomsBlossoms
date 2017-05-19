using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BloomsandBlossomsCL;
using BloomsandBlossomsDL;

namespace BloomsandBlossoms
{
    public partial class PaymentRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int pos = Request.Url.AbsoluteUri.LastIndexOf('/');
                string strURL = Request.Url.AbsoluteUri.Substring(0, pos + 1) + "PaymentResponse.aspx";

                AddressDL objAddress = new AddressDL();
                UserDL currentUser = new UserDL();
                objAddress.GetAddressDetailsByUserID(Convert.ToInt32(Session["UserIDValue"]));
                currentUser.GetUserByUserID(Convert.ToInt32(Session["UserIDValue"]));
                if (!IsPostBack)
                {   
                    FName.Text = objAddress.ContactName;
                    Address.Text = objAddress.Address1.Trim() + " " + objAddress.Address2.Trim();
                    Email.Text = currentUser.EmailID;
                    City.Text = objAddress.City;
                    State.Text = objAddress.State;
                    AddressZip.Text = objAddress.Pincode;
                    Mobile.Text = currentUser.Phonenumber;
                }

                merchantTxnId.Text = "1";
                orderAmount.Text = "2.00";
                hdnFname.Value = objAddress.ContactName;
                //hdnLname.Value = "S";
                hdnEmail.Value = objAddress.Address2;
                hdnAddress.Value = objAddress.Address1.Trim() + " " +  objAddress.Address2.Trim();
                hdnCity.Value = objAddress.City;
                hdnZip.Value = objAddress.Pincode;
                hdnState.Value = objAddress.State;
                hdnMobile.Value = currentUser.Phonenumber;
                hdnReturnUrl.Value = strURL; // RESPONSE URL

                ////Payment URL
                //hdnPaymentURL.Value = "https://sandbox.citruspay.com/2lp1owe1le";
                hdnPaymentURL.Value = "https://checkout.citruspay.com/ssl/checkout/2lp1owe1le";

            }
            catch (Exception ex)
            {
                // LOG THE ERROR    
            }
        }
    }
}