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
        AddressDL addressObj = new AddressDL();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserIDValue"] == null)
                {
                    Response.Redirect("~/Signin.aspx");
                }


                string sessionUserIDValue = Session["UserIDValue"].ToString();

                addressObj.GetAddressDetailsByUserID(Convert.ToInt32(sessionUserIDValue));
                hfAddressID.Value=addressObj.AddressID.ToString();
                txtName.Text = addressObj.ContactName;
                txtAddress1.Text = addressObj.Address1;
                txtAddress2.Text = addressObj.Address2;
                txtCity.Text = addressObj.City;
                txtState.Text = addressObj.State;
                txtCountry.Text = addressObj.Country;
                txtPin.Text = addressObj.Pincode;
                txtNote.Text= addressObj.Note;

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
         
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
            string sessionUserIDValue = Session["UserIDValue"].ToString();
            addressObj.UserID = Convert.ToInt32(sessionUserIDValue);
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

            


            // If successful
            if (result.Status == TransactionStatus.Success)
            {
                //MultiView1.ActiveViewIndex = 1;
               
            }
            Response.Redirect("~/Payment.aspx");

        }
    }
}