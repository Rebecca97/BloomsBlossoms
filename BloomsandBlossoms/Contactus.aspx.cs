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
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void btnSubmitContactUs_Click(object sender, EventArgs e)
        {
            ContactUsDL contactObj = new ContactUsDL();

            contactObj.ContactUsID = 0;



            contactObj.ContactName = txtContactName.Text;
            contactObj.ContactSubject = txtContactSubject.Text;
            contactObj.ContactPhoneNo = Convert.ToInt32(txtContactPhone.Text);
            contactObj.ContactEmail = txtContactEmail.Text;
            contactObj.ContactMessage = txtContactMessage.Text;
           

            // Add Contact us information
            TransactionResult result;
            contactObj.ScreenMode = ScreenMode.Add;
            result = contactObj.Commit();
            hfContactUsID.Value = contactObj.ContactUsID.ToString();

            txtContactName.Text = "";
            txtContactSubject.Text = "";
            txtContactPhone.Text = "";
            txtContactEmail.Text = "";
            txtContactMessage.Text = "";
        }
    }
    }
