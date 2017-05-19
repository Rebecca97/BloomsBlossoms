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
    public partial class Description : System.Web.UI.Page
    {
        DescriptionDL objDes = new DescriptionDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["UserIDValue"] == null)
                {
                    Response.Redirect("~/Signin.aspx");
                }                    

                string queryStringValue = Request.QueryString["productid"];

                
                objDes.GetProductDescriptionByProductID(Convert.ToInt32(queryStringValue));
                productname.Text = objDes.ProductName;
                productid.Text = objDes.ProductID.ToString();
                productdescription.Text = objDes.ProductDescription;
                productprice.Text =objDes.ProductPrice.ToString();
                productavailibility.Text = objDes.IsEnable.ToString();
                imgproductpicture.ImageUrl = objDes.PictureFileName;
            }
              
        }
       
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            List<DescriptionDL> cartDetails;
            DescriptionDL addItem = new DescriptionDL();
            if (Session["CartDetails"]==null)
            {
                cartDetails = new List<DescriptionDL>();
                
            }
            else
            {
                cartDetails = (List<DescriptionDL>)Session["CartDetails"];
                //bool alreadyexists = cartDetails.Contains();

                //if (alreadyexists)
                //{
                //    int newQuantity = Convert.ToInt32(txtQuantity.Text);
                //    newQuantity = newQuantity + 1;

                //    addItem.ProductID = Convert.ToInt32(productid.Text);
                //    addItem.ProductPrice = Convert.ToDecimal(productprice.Text);
                //    addItem.ProductQuantity = newQuantity;
                //    cartDetails.Add(addItem);
                //    Session["CartDetails"] = cartDetails;

                //}
                //cartDetails.Remove(addItem.ProductID = );
            }

            addItem.ProductID = Convert.ToInt32(productid.Text);
            addItem.ProductPrice = Convert.ToDecimal(productprice.Text);
            addItem.ProductQuantity = Convert.ToInt32(txtQuantity.Text);
            cartDetails.Add(addItem);
            Session["CartDetails"] = cartDetails;
            //if (hfCartID.Value == "0")
            //{
            //    objDes.CartID = 0;

            //}
            //else
            //{
            //    objDes.CartID = Convert.ToInt32(hfCartID.Value);

            //}

            //objDes.UserID = Convert.ToInt32(Session["UserIDValue"]);
            //objDes.CartID = Convert.ToInt32(Session["CartDetails"]);
            //objDes.ProductID = Convert.ToInt32(Session["CartDetails"]);
            //objDes.ProductPrice = Convert.ToDecimal(Session["CartDetails"]);
            //objDes.Quantity = Convert.ToInt32(Session["CartDetails"]);

            //TransactionResult result;
            //objDes.ScreenMode = ScreenMode.Add;
            //result = objDes.Commit();
            //hfCartID.Value = objDes.CartID.ToString();



            //Response.Redirect("~/Default.aspx");
        }
    }
}