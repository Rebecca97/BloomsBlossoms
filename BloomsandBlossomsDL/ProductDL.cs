using BloomsandBlossomsCL;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace BloomsandBlossomsDL
{
    public class ProductDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();

        public int ProductID
        {
            get; set;
        }
        public string ProductName
        {
            get; set;
        }
        public decimal ProductPrice
        {
            get;set;
        }
        public string ProductDescription
        {
            get;set;
        }
        public int ProductCategoryID
        {
            get;set;
        }
        public string PictureFileName
        {
            get; set;
        }
        public bool IsEnable
        {
            get;set;
        }
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
                ErrorLog.LogErrorMessageToDB("", "ProductDL.cs", "GetProductWithDetails", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
        }
        public void GetSingleProductWithDetails(int productID)

        {
            
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spGetProductInfoByProductID");
                dbCommand.Parameters.Clear();
                db.AddInParameter(dbCommand, "ProductID", DbType.Int32, productID);
                using (SqlDataReader dataReader = (SqlDataReader)db.ExecuteReader(dbCommand))
                {
                    while (dataReader.Read())
                    {
                        
                        ProductID = dataReader.GetInt32(dataReader.GetOrdinal("ProductID"));
                        ProductName = dataReader.GetString(dataReader.GetOrdinal("ProductName"));
                        ProductDescription = dataReader.GetString(dataReader.GetOrdinal("ProductDescription"));
                        ProductPrice = dataReader.GetDecimal(dataReader.GetOrdinal("ProductPrice"));
                        ProductCategoryID = dataReader.GetInt32(dataReader.GetOrdinal("ProductCategoryID"));
                        PictureFileName = dataReader.GetString(dataReader.GetOrdinal("PictureFileName"));
                        IsEnable = dataReader.GetBoolean(dataReader.GetOrdinal("IsEnable"));

                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "ProductDL.cs", "GetSingleProductWithDetails", ex.Message.ToString(), _myConnection);
                throw;
            }
            
        }
    }
}
