using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ProductDL objDL = new ProductDL();
                string strvalue = Request.QueryString["Category"];
                if (!string.IsNullOrEmpty(strvalue))
                {
                    
                    dlProduct.DataSource = objDL.GetProductWithDetails(Convert.ToInt32(strvalue));
                    dlProduct.DataBind();
                }
                else
                {
                    dlProduct.DataSource = objDL.GetProductWithDetails(Convert.ToInt32(0));
                    dlProduct.DataBind();
                }
            }
        }

        protected void dlProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
    }
}