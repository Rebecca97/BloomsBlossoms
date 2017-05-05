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
    public class ProductDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();

        #region constructor
        public ProductDL()
        {

        }
        #endregion
        public DataSet GetProductWithDetails(int categoryID)
        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spGetProductInfo");
                dbCommand.Parameters.Clear();
                db.AddInParameter(dbCommand, "ProductCategoryID", DbType.Int32, categoryID);
                dbCommand.CommandTimeout = 300;
                ds = db.ExecuteDataSet(dbCommand);
            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "ProducDL.cs", "GetProductWithDetails", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
        }
    }
}
