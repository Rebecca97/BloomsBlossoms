using BloomsandBlossomsCL;
using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
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
            
                dlCart.DataSource = cartobj.GetCartDetailsWithUserID(Convert.ToInt32(Session["UserIDValue"]));
                dlCart.DataBind();
                lblCalculateTotalPrice.Text = calculateProductPrice.ToString("F2");
                calculateServiceTax = calculateProductPrice * 0.15;
                lblCalculateServiceTaxAmt.Text = calculateServiceTax.ToString("F2");
                lblNetTotalPrice.Text = (calculateProductPrice + calculateServiceTax).ToString("F2");
            
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
            
        }

        protected void dlCart_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            CartDL cartobj1 = new CartDL();
            cartobj1.UserID = Convert.ToInt32(Session["UserIDValue"]);            
            cartobj1.ProductID = (int)dlCart.DataKeys[(int)e.Item.ItemIndex];
            
            TransactionResult result;
            cartobj1.ScreenMode = ScreenMode.Delete;
            result = cartobj1.Commit();
            dlCart.EditItemIndex = -1;


            dlCart.DataSource = cartobj1.GetCartDetailsWithUserID(Convert.ToInt32(Session["UserIDValue"]));
            dlCart.DataBind();
            lblCalculateTotalPrice.Text = calculateProductPrice.ToString("F2");
            calculateServiceTax = calculateProductPrice * 0.15;
            lblCalculateServiceTaxAmt.Text = calculateServiceTax.ToString("F2");
            lblNetTotalPrice.Text = (calculateProductPrice + calculateServiceTax).ToString("F2");
        }

        protected void dlCart_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            ////if (Session["CartDetails"] != null)
            ////{

            ////    StoreProductsIntoDB();
            ////}
            ////Response.Redirect("Payment.aspx");

            ////Need to replace the last part of URL("your-vanityUrlPart") with your Testing/Live URL
            ////string formPostUrl = "https://checkout.citruspay.com/ssl/checkout/2lp1owe1le";               
            ////Need to change with your Secret Key
            //string secret_key = "87851b4fda1d3aa96edad6a7053f889d867a3c54";
            ////Need to change with your Vanity URL Key from the citrus panel
            //string vanityUrl = "2lp1owe1le";
            ////Should be unique for every transaction
            //string merchantTxnId = "BAB"+ System.DateTime.Now.ToString("yyyyMMddHHmmssffff");
            ////Need to change with your Order Amount
            //string orderAmount = "5.00";
            //string currency = "INR";
            //string data = vanityUrl + orderAmount + merchantTxnId + currency;
            //string returnUrl = "http://localhost:50544/ResponseDemo.aspx";
            //string notifyUrl = "";
            //System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(secret_key));
            //System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));
            //string securitySignature = BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower();

            //Response.Redirect(formPostUrl);
            Response.Redirect("~/Address.aspx");

        }
    }
}