using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Wedding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                WeddingDL objDl = new WeddingDL();

                dlWeddingStage.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "Stage");
                dlWeddingStage.DataBind();

                dlWeddingBackDrop.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "Back Drop");
                dlWeddingBackDrop.DataBind();

                dlWeddingCar.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "Car Decoration");
                dlWeddingCar.DataBind();

                dlWeddingAlter.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "Alter");
                dlWeddingAlter.DataBind();

                dlWeddingFirstNight.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "First Night");
                dlWeddingFirstNight.DataBind();

                dlWeddingBridalBouquets.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "Bridal Bouquets");
                dlWeddingBridalBouquets.DataBind();

                dlWeddingGarlands.DataSource = objDl.GetWeddingArrangements("Wedding Hall", "Garlands and Chendu");
                dlWeddingGarlands.DataBind();
            }
        }
        protected void dlWeddingStage_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlWeddingBackDrop_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlWeddingCar_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlWeddingAlter_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlWeddingFirstNight_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlWeddingBridalBouquets_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlWeddingGarlands_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
    }
}