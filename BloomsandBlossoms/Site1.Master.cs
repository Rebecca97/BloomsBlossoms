using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserIDValue"] == null || Session["UserIDValue"] == "")
            {
                lblUsername.Text = "Login";
                lblLogout.Visible = false;
                lblCartQuantity.Text = "";
            }
            else
            {
                lblUsername.Text = Session["UserNameValue"].ToString();
                lblLogout.Visible = true;
                if (Session["CartQuantity"] != null)
                    lblCartQuantity.Text = "[" + Session["CartQuantity"].ToString() + "]";
            }
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            Session["UserNameValue"] = "";
            Session["CartQuantity"] = "";
            Session["UserIDValue"] = "" ;
            lblLogout.Visible = false;
            lblUsername.Text = "Login";
            Response.Redirect("~/Default.aspx");
        }
    }
}