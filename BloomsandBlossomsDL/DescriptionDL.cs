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
    public class DescriptionDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();

        #region constructor
        public DescriptionDL()
        {

        }

        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string ProductPrice { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCategory { get; set; }
        public string PictureFileName { get; set; }
        public bool IsEnable { get; private set; }
        #endregion

        public DataSet GetProductWithDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spProductInfo");
                dbCommand.Parameters.Clear();
                dbCommand.CommandTimeout = 300;
                ds = db.ExecuteDataSet(dbCommand);

                foreach (var item in ds.Tables[0].DefaultView)
                {
                    

                }
                


            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "DescriptionDL.cs", "GetProductWithDetails", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
        }


        public void GetProductDescriptionByProductID(int productID)
        {
            Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
            string sqlCommand = "spGetProductInfoByProductID";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
            db.AddInParameter(dbCommand, "ProductID", DbType.Int32, productID);

            using (SqlDataReader dataReader = (SqlDataReader)db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    
                    ProductID = dataReader.GetInt32(dataReader.GetOrdinal("ProductID"));                  

                    ProductName= dataReader.GetString(dataReader.GetOrdinal("ProductName"));
                    ProductPrice = dataReader.GetString(dataReader.GetOrdinal("ProductPrice"));
                    ProductDescription = dataReader.GetString(dataReader.GetOrdinal("ProductDescription"));
                    ProductCategory = dataReader.GetString(dataReader.GetOrdinal("ProductCategory"));
                    PictureFileName = dataReader.GetString(dataReader.GetOrdinal("PictureFileName"));
                    //IsEnable = dataReader.GetBoolean(dataReader.GetOrdinal("IsEnable"));
                }
            }
        }
    }
}
