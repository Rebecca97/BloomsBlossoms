using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class CompanyInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CompanyInformationDL objCompany = new CompanyInformationDL();
                objCompany.GetCompanyInformation();
                txtName.Text = objCompany.CompanyName;
                txtAddress.Text = objCompany.CompanyAddress;
                txtState.Text = objCompany.CompanyState;
                txtCountry.Text = objCompany.CompanyCountry;
                txtEmail.Text = objCompany.CompanyEmail;
                txtPhone.Text = objCompany.CompanyPhone.ToString();
                txtPin.Text = objCompany.CompanyPincode;
                txtServiceTax.Text = objCompany.CompanyServiceTax;
                txtTinNo.Text = objCompany.CompanyTinNo;
                txtWebsite.Text = objCompany.CompanyWebsite;
                txtLogo.Text = objCompany.CompanyLogo;
            }

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {



        }
    }
}