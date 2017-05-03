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
                CartDL cartobj = new CartDL();
                dlCart.DataSource = cartobj.GetCartDetails();
                dlCart.DataBind();

            }
        }

        protected void dlCart_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
           e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // Retrieve the Label control in the current DataListItem.
                //Label PriceLabel = (Label)e.Item.FindControl("PriceLabel");

                // Retrieve the text of the CurrencyColumn from the DataListItem
                // and convert the value to a Double.
                Double Price = Convert.ToDouble(
                    ((DataRowView)e.Item.DataItem).Row.ItemArray[2].ToString());
                calculateProductPrice = calculateProductPrice + Price;
                calculateServiceTax= calculateProductPrice * 0.15;
                calculateServiceTaxAmt.Text = calculateServiceTax.ToString();
                // Format the value as currency and redisplay it in the DataList.
                //PriceLabel.Text = Price.ToString("c");
                calculateTotalPrice.Text = calculateProductPrice.ToString();
                calculateNetTotalPrice.Text = (calculateServiceTax + calculateProductPrice).ToString();
            }
        }
    }
}