using BloomsandBlossomsCL;
using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Signin : System.Web.UI.Page
    {

		MailMessage msg = new MailMessage();

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
            userObj.Password = Utilities.EncryptText(txtGetPassword.Text);
            if(userObj.IsUserExists())
            {
	            Session["UserIDValue"] = userObj.UserID;
	            Session["UserNameValue"] = userObj.Username;
               Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblErrorMsg.Text = "Not a Valid username and password";
            }

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {            
            string strpass = Utilities.EncryptText(txtPassword.Text);
            UserDL userObj = new UserDL();
            userObj.Username = txtUserName.Text;
            userObj.Password = strpass;
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
				SendEmailConfirmation();
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


	    private void SendEmailConfirmation()
	    {
		    StringBuilder str = new StringBuilder();
			
			str.Append("Dear " + txtUserName.Text + ", " + Environment.NewLine + Environment.NewLine); 

			str.Append("We are happy to welcome you to the Bloom & Blossoms Online Selling and are delighted to give you a login to our website." + Environment.NewLine + Environment.NewLine);
			
			str.Append("Kindly login with your Username and make sure that you change your password for information security reasons if applicable." + Environment.NewLine + Environment.NewLine);

			str.Append("Please get back to us with your suggestions, comments and feedback (info@floristinchennai.com)." + Environment.NewLine + Environment.NewLine);

			str.Append("VERIFY YOUR EMAILID - Click Below link : " + Environment.NewLine);

			str.Append("http://www.floristinchennai.com?" + "Activatelogin=" + txtUserName.Text + Environment.NewLine + Environment.NewLine);
			
			str.Append("Your login information is given below to access the website," + Environment.NewLine);

			str.Append("http://www.floristinchennai.com" + Environment.NewLine + Environment.NewLine);

			str.Append("User ID  : " + Convert.ToString(txtUserName.Text.ToString()) + Environment.NewLine);

			str.Append("Password : " + txtConfirmPassword.Text.ToString() + Environment.NewLine + Environment.NewLine + Environment.NewLine);
			
			str.Append("Thank you," + Environment.NewLine + Environment.NewLine);

			str.Append("FlouristinChennai.com" + Environment.NewLine + Environment.NewLine);

		    gmail_send(str);
	    }

		public string gmail_send(StringBuilder str)
		{
			using (MailMessage mailMessage =
			new MailMessage(new MailAddress("info@floristinchennai.com"), new MailAddress(txtEmailID.Text)))
			{
				mailMessage.Body = str.ToString();
				mailMessage.Subject = "Welcome to Bloom & Blossoms";
				try
				{
					SmtpClient SmtpServer = new SmtpClient();
					SmtpServer.Credentials =
						new System.Net.NetworkCredential("sam147doss@gmail.com", "Samdo5%147");
					SmtpServer.Port = 587;
					SmtpServer.Host = "smtp.gmail.com";
					SmtpServer.EnableSsl = true;
					MailMessage mail = new MailMessage();
					String[] addr = txtEmailID.Text.Split(','); // toemail is a string which contains many email address separated by comma
					mail.From = new MailAddress("info@floristinchennai.com");
					Byte i;
					for (i = 0; i < addr.Length; i++)
						mail.To.Add(addr[i]);
					mail.Subject = "Welcome to Bloom & Blossoms";
					mail.Body = str.ToString();
					mail.IsBodyHtml = false;
					mail.DeliveryNotificationOptions =
						DeliveryNotificationOptions.OnFailure;
					//   mail.ReplyTo = new MailAddress(toemail);
					mail.ReplyToList.Add(txtEmailID.Text);
					SmtpServer.Send(mail);
					return "Mail Sent";
				}
				catch (Exception ex)
				{
					string exp = ex.ToString();
					return "Mail Not Sent ... and ther error is " + exp;
				}
			}
		}
    }
}