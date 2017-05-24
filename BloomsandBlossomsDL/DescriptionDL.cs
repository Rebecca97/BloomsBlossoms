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
        #region private variables
        int _userID;
        int _productID;
        int _cartID;
        int _quantity;
        private ScreenMode _screenMode;
        private ECGroupConnection _myConnection = new ECGroupConnection();

        #endregion
        #region public variables
        public int UserID
        {
            get
            {
                return _userID;
            }

            set
            {
                _userID = value;
            }
        }

        public int ProductID
        {
            get
            {
                return _productID;
            }

            set
            {
                _productID = value;
            }
        }

        public int CartID
        {
            get
            {
                return _cartID;
            }

            set
            {
                _cartID = value;
            }
        }

        public ScreenMode ScreenMode
        {
            get
            {
                return _screenMode;
            }

            set
            {
                _screenMode = value;
            }
        }


        #endregion
       

        #region constructor
        public DescriptionDL()
        {

        }

        
        public string ProductName { get; set; }
        public decimal ProductPrice { get; set; }
        public string ProductDescription { get; set; }
        public string ProductCategoryID { get; set; }
        public string PictureFileName { get; set; }
        public bool IsEnable { get; private set; }
        public int ProductQuantity { get; set; }

        public int Quantity
        {
            get
            {
                return _quantity;
            }

            set
            {
                _quantity = value;
            }
        }
        #endregion

        public DataSet GetProductWithDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spGetProductInfoByProductID");
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
                    
                    ProductPrice = dataReader.GetDecimal(dataReader.GetOrdinal("ProductPrice"));
                    ProductDescription = dataReader.GetString(dataReader.GetOrdinal("ProductDescription"));
                    ProductCategoryID = dataReader.GetInt32(dataReader.GetOrdinal("ProductCategoryID")).ToString();
                    PictureFileName = dataReader.GetString(dataReader.GetOrdinal("PictureFileName"));
                    //IsEnable = dataReader.GetBoolean(dataReader.GetOrdinal("IsEnable"));
                }
            }
        }
        #region commit
        public TransactionResult Commit()
        {
            TransactionResult result = null;
            Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbTransaction transaction = connection.BeginTransaction();
                try
                {
                    switch (ScreenMode)
                    {
                        case ScreenMode.Add:
                            result = AddIntoCart(db, transaction);
                            if (result.Status == TransactionStatus.Failure)
                            {
                                transaction.Rollback();
                                return result;
                            }
                            break;


                    }
                    transaction.Commit();
                    return result;
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    if (ScreenMode == ScreenMode.Add)
                    {
                        ErrorLog.LogErrorMessageToDB("", "CartDL.cs", "Commit For Add", ex.Message, _myConnection);
                        return new TransactionResult(TransactionStatus.Failure, "Failure Adding into Cart");
                    }

                }
                return result;
            }
        }

        #endregion
        private TransactionResult AddIntoCart(Database db, DbTransaction transaction)
        {
            int returnValue = 0;
            string sqlCommand = "spInsertIntoCartProducts";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            
            db.AddInParameter(dbCommand, "UserID", DbType.Int32, UserID);
            db.AddInParameter(dbCommand, "ProductID", DbType.Int32, ProductID);
            db.AddInParameter(dbCommand, "ProductPrice", DbType.Decimal, ProductPrice);
            db.AddInParameter(dbCommand, "ProductQuantity", DbType.Int32, ProductQuantity);
            db.AddParameter(dbCommand, "Return Value", DbType.Int32, ParameterDirection.ReturnValue, "Return Value",
                            DataRowVersion.Default, returnValue);

            db.ExecuteNonQuery(dbCommand, transaction);
            returnValue = (Int32)db.GetParameterValue(dbCommand, "Return Value");

            //CartID = returnValue;

            if (returnValue == -1)
            {
                return new TransactionResult(TransactionStatus.Failure, "Failure Adding");
            }
            else
            {
                return new TransactionResult(TransactionStatus.Success, "Successfully Added");
            }
        }

    }
}
