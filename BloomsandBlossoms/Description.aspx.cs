using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Description : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string queryStringValue = Request.QueryString["productid"];

                DescriptionDL objDes = new DescriptionDL();
                objDes.GetProductDescriptionByProductID(Convert.ToInt32(queryStringValue));
                productname.Text = objDes.ProductName;
                productid.Text = objDes.ProductPrice.ToString();
                productdescription.Text = objDes.ProductDescription;
                productprice.Text = objDes.ProductCategory;
                productavailibility.Text = objDes.IsEnable.ToString();
                imgproductpicture.ImageUrl = objDes.PictureFileName;
            }
              
        }
    }
}