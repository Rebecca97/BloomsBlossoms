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
	public partial class _Default : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                DefaultDL defaultobj = new DefaultDL();
                dlCategory.DataSource = defaultobj.GetCategoryDetails();
                dlCategory.DataBind();
                dlTopProduct.DataSource = defaultobj.GetTop5Products();
                dlTopProduct.DataBind();

                if (Session["UserIDValue"] != "")
                {
                    CartNewDL cartobj = new CartNewDL();

                    DataSet dsObj = new DataSet();
                    dsObj = cartobj.GetCartDetailsWithUserID(Convert.ToInt32(Session["UserIDValue"]));
                    Session["CartQuantity"] = dsObj.Tables[0].Rows.Count;
                }
            }
        }

        protected void dlCategory_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlTopProduct_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }

    }
	}
