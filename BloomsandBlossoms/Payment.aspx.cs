using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if(radioOtherPayment.Checked)
            {
                MultiView1.ActiveViewIndex = 1;
            }
            else if(radioCOD.Checked)
            {
                Response.Redirect("~/Address.aspx");
            }
        }

        protected void btnMakePayment_Click(object sender, EventArgs e)
        {
            // PaymentDL paymentObj = new PaymentDL();
            // paymentObj.CardNo = txtCardNo.Text;
            // paymentObj.CVVNo = txtCVVNo.Text;

            Response.Redirect("PaymentRequest.aspx");


        }
    }
}