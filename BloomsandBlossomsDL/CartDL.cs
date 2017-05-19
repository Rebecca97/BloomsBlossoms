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
    public class CartDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();
        private ScreenMode _screenMode;
        int _userID;
        int _productID;
        #region constructor
        public CartDL()
        {

        }

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
        #endregion


        public DataSet GetCartDetailsWithUserID(int userID)
        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spGetCartDetails");
                dbCommand.Parameters.Clear();
                db.AddInParameter(dbCommand, "UserID", DbType.Int32, userID);
                dbCommand.CommandTimeout = 300;
                ds = db.ExecuteDataSet(dbCommand);
            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "CartDL.cs", "GetCartDetailsWithUserID", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
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
                        case ScreenMode.Delete:
                            result = DeleteFromCart(db, transaction);
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
                        return new TransactionResult(TransactionStatus.Failure, "Failure Deleting from Cart");
                    }

                }
                return result;
            }
        }

        #endregion
        private TransactionResult DeleteFromCart(Database db, DbTransaction transaction)
        {
            int returnValue = 0;
            string sqlCommand = "spDeleteFromCart";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);
            
            db.AddInParameter(dbCommand, "UserID", DbType.Int32, UserID);
            db.AddInParameter(dbCommand, "ProductID", DbType.String, _productID);
           
            db.AddParameter(dbCommand, "Return Value", DbType.Int32, ParameterDirection.ReturnValue, "Return Value",
                            DataRowVersion.Default, returnValue);

            db.ExecuteNonQuery(dbCommand, transaction);
            returnValue = (Int32)db.GetParameterValue(dbCommand, "Return Value");

           

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
