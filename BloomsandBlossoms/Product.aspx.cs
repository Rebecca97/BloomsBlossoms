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
                dlProduct.DataSource = objDL.GetProductWithDetails();
                dlProduct.DataBind();
            }
        }

        protected void dlProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
    }
}