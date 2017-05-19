using BloomsandBlossomsCL;
using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Cart : System.Web.UI.Page
    {
       
        double calculateProductPrice = 0;
        double calculateServiceTax = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserIDValue"] == null)
                {
                    Response.Redirect("~/Signin.aspx");
                }                
            }

            CartNewDL cartobj = new CartNewDL();
            if(Session["CartDetails"]!=null)
            {
                dlCart.DataSource = (List<DescriptionDL>)Session["CartDetails"];
                dlCart.DataBind();
                lblCalculateTotalPrice.Text = calculateProductPrice.ToString("F2");
                calculateServiceTax = calculateProductPrice * 0.15;
                lblCalculateServiceTaxAmt.Text = calculateServiceTax.ToString("F2");
                lblNetTotalPrice.Text = (calculateProductPrice + calculateServiceTax).ToString("F2");
            }
        }

        protected bool StoreProductsIntoDB()
        {
            DescriptionDL desObj = new DescriptionDL();
            List<DescriptionDL> cartDetails= (List<DescriptionDL>)Session["CartDetails"];
            foreach (DescriptionDL anItem in cartDetails)
            {

            }
            return true;
        }
        protected void dlCart_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblProductId = e.Item.FindControl("productid") as Label;
                if (lblProductId != null)
                {
                    ProductDL currentProd = new ProductDL();
                    currentProd.GetSingleProductWithDetails(Convert.ToInt32(lblProductId.Text));
                    Label lblProductName = e.Item.FindControl("lblProductName") as Label;
                    lblProductName.Text=currentProd.ProductName;
                    Image imgRow = e.Item.FindControl("Image1") as Image;
                    imgRow.ImageUrl = currentProd.PictureFileName;
                }

                Double price = 0.0;
                int quantity = 0;
                Label lblProductPrice = e.Item.FindControl("lblProductPrice") as Label;
                if (lblProductPrice != null)
                {
                    price = Convert.ToDouble(lblProductPrice.Text);
                }
                Label lblQuantity = e.Item.FindControl("lblQuantity") as Label;
                if (lblQuantity != null)
                {
                    quantity = Convert.ToInt32(lblQuantity.Text);
                }

                Label lblTotalProductPrice = (Label)e.Item.FindControl("lblTotalProductPrice");
                if (lblTotalProductPrice != null)
                {
                    lblTotalProductPrice.Text = (price * quantity).ToString("F2");
                }

                calculateProductPrice += Convert.ToDouble(lblTotalProductPrice.Text);

                // Retrieve the text of the CurrencyColumn from the DataListItem
                // and convert the value to a Double.
                //Double Price = Convert.ToDouble(
                //    ((DataRowView)e.Item.DataItem).Row.ItemArray[3].ToString());
                //calculateProductPrice = calculateProductPrice + Price;
                //calculateServiceTax = calculateProductPrice * 0.15;
                //calculateServiceTaxAmt.Text = calculateServiceTax.ToString();
                // Format the value as currency and redisplay it in the DataList.
                //PriceLabel.Text = Price.ToString("c");
                //calculateTotalPrice.Text = calculateProductPrice.ToString();
                //calculateNetTotalPrice.Text = (calculateServiceTax + calculateProductPrice).ToString();

                // Retrieve the Label control in the current DataListItem.
                //Label lblTotalProduct = (Label)e.Item.FindControl("lblTotalProductPrice");

                //int quantity = Convert.ToInt32(((DataRowView)e.Item.DataItem).Row.ItemArray[1].ToString());
                //lblTotalProduct.Text = Convert.ToInt32( quantity * Price).ToString();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            //CartDL cartobj1 = new CartDL();
            //cartobj1.UserID = Convert.ToInt32(Session["UserIDValue"]);
            //Button btn = sender as Button;
            //DataListItem dli = btn.NamingContainer as DataListItem;
            //Label lbl = dli.FindControl("productid") as Label;
            //cartobj1.ProductID = 0;
            //if (lbl != null)
            //{
            //    cartobj1.ProductID = Convert.ToInt32(lbl.Text);
            //}

            //TransactionResult result;
            //cartobj1.ScreenMode = ScreenMode.Delete;
            //result = cartobj1.Commit();
           



           
        }

        protected void dlCart_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            //if (Session["CartDetails"] != null)
            //{

            //    StoreProductsIntoDB();
            //}
            Response.Redirect("Payment.aspx");
        }
    }
}