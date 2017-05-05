using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
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
