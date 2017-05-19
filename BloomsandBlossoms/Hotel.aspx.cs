using BloomsandBlossomsDL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloomsandBlossoms
{
    public partial class Hotel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HotelDL objDL = new HotelDL();

                dlHotelLobby.DataSource = objDL.GetHotelArrangements("Hotel Arrangements", "Lobby Flower");
                dlHotelLobby.DataBind();


                dlHotelBanquet.DataSource = objDL.GetHotelArrangements("Hotel Arrangements", "Banquent Flower");
                dlHotelBanquet.DataBind();


                dlHotelConference.DataSource = objDL.GetHotelArrangements("Hotel Arrangements", "Conference Hall Flower");
                dlHotelConference.DataBind();


                dlHotelStand.DataSource = objDL.GetHotelArrangements("Hotel Arrangements", "Stand Flower");
                dlHotelStand.DataBind();


                dlHotelDriftwood.DataSource = objDL.GetHotelArrangements("Hotel Arrangements", "DriftwoodFlower");
                dlHotelDriftwood.DataBind();
            }
        }
        protected void dlHotelLobby_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlHotelBanquent_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlHotelConference_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlHotelStand_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
        protected void dlHotelDriftwood_ItemDataBound(object sender, DataListItemEventArgs e)
        {

        }
    }
}