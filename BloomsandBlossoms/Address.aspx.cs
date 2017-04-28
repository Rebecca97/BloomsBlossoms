using BloomsandBlossomsCL;
using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Address : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddressDL addressObj = new AddressDL();
            if (hfAddressID.Value == "0")
            {
                addressObj.AddressID = 0;
                addressObj.AddEditOption = 0;
            }
            else
            {
                addressObj.AddressID = Convert.ToInt32(hfAddressID.Value);
                addressObj.AddEditOption = 1;
            }
            addressObj.UserID = 2;
            addressObj.ContactName = txtName.Text;
            addressObj.Address1 = txtAddress1.Text;
            addressObj.Address2 = txtAddress2.Text;
            addressObj.City = txtCity.Text;
            addressObj.State = txtState.Text;
            addressObj.Country = txtCountry.Text;
            addressObj.Pincode = txtPin.Text;
            addressObj.Note = txtNote.Text;

            // Add / Edit the City
            TransactionResult result;
            addressObj.ScreenMode = ScreenMode.Add;
            result = addressObj.Commit();
            hfAddressID.Value = addressObj.AddressID.ToString();
            //// Display the Status - Whether successfully saved or not
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append("<script>alert('" + "confirmation mail sent to your emailid" + ".');");
            //sb.Append("</script>");

            // If successful
            if (result.Status == TransactionStatus.Success)
            {
                //MultiView1.ActiveViewIndex = 1;
            }
        }
    }
}