using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class CorporateArrangement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CorporateDL objDL = new CorporateDL();

                dlCorporate.DataSource = objDL.GetCorporateArrangements("Corporate Office", "Regular Arrangements");
                dlCorporate.DataBind();
            }
                
       }
        protected void dlCorporate_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
    }
}
