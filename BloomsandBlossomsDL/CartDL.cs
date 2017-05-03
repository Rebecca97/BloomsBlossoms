using BloomsandBlossomsCL;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;

namespace BloomsandBlossomsDL
{
    public class CartDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();

        #region constructor
        public CartDL()
        {

        }
        #endregion
        public DataSet GetCartDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spCartDetails");
                dbCommand.Parameters.Clear();
                dbCommand.CommandTimeout = 300;
                ds = db.ExecuteDataSet(dbCommand);
            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "CartDL.cs", "GetCartDetails", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
        }
    }
}
