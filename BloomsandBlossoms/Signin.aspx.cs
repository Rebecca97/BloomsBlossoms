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
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UserDL userObj = new UserDL();
            userObj.Username = txtGetUserName.Text;
            userObj.Password = txtGetPassword.Text;
            if(userObj.IsUserExists())
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblErrorMsg.Text = "Not a Valid username and password";
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UserDL userObj = new UserDL();
            userObj.Username = txtUserName.Text;
            userObj.Password = txtPassword.Text;
            userObj.EmailID = txtEmailID.Text;
            userObj.Phonenumber = txtPhoneNumber.Text;

            // Add / Edit the City
            TransactionResult result;
            userObj.ScreenMode = ScreenMode.Add;
            result = userObj.Commit();

            //// Display the Status - Whether successfully saved or not
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append("<script>alert('" + "confirmation mail sent to your emailid" + ".');");
            //sb.Append("</script>");

            // If successful
            if (result.Status == TransactionStatus.Success)
            {
                MultiView1.ActiveViewIndex = 1;

                txtUserName.Text = string.Empty;
                txtPassword.Text = string.Empty;
                txtConfirmPassword.Text = string.Empty;
                txtPhoneNumber.Text = string.Empty;
                txtEmailID.Text = string.Empty;

            }
            //ScriptManager.RegisterStartupScript(this.Page, typeof(string), "MyScript", sb.ToString(), false);

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtConfirmPassword.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtEmailID.Text = string.Empty;
        }
    }
}