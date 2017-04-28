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
    public class PaymentDL
    {
        #region Private Variables
        private ECGroupConnection _myConnection = new ECGroupConnection();
        private ScreenMode _screenMode;
        private int _paymentID;
        private int _userID;
        private int _orderID;
        private  double _cardNo;
        private int _CVVNo;
        private int _amount;
        private int _serviceTaxAmt;
        private int _totalPayAmt;
        private int _couponCode;
        private bool _paymentStatus;
        private string _paymentMethod;

        #endregion

        #region Public Variables
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

        public int PaymentID
        {
            get
            {
                return _paymentID;
            }

            set
            {
                _paymentID = value;
            }
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

        public int OrderID
        {
            get
            {
                return _orderID;
            }

            set
            {
                _orderID = value;
            }
        }

        public double CardNo
        {
            get
            {
                return _cardNo;
            }

            set
            {
                _cardNo = value;
            }
        }

        public int CVVNo
        {
            get
            {
                return _CVVNo;
            }

            set
            {
                _CVVNo = value;
            }
        }

        public int Amount
        {
            get
            {
                return _amount;
            }

            set
            {
                _amount = value;
            }
        }

        public int ServiceTaxAmt
        {
            get
            {
                return _serviceTaxAmt;
            }

            set
            {
                _serviceTaxAmt = value;
            }
        }

        public int TotalPayAmt
        {
            get
            {
                return _totalPayAmt;
            }

            set
            {
                _totalPayAmt = value;
            }
        }

        public int CouponCode
        {
            get
            {
                return _couponCode;
            }

            set
            {
                _couponCode = value;
            }
        }

        public bool PaymentStatus
        {
            get
            {
                return _paymentStatus;
            }

            set
            {
                _paymentStatus = value;
            }
        }

        public string PaymentMethod
        {
            get
            {
                return _paymentMethod;
            }

            set
            {
                _paymentMethod = value;
            }
        }
        #endregion

        
        #region Constructor(s)

        public PaymentDL() { }

        #endregion
        #region Commit Add
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
                            result = AddPaymentDetail(db, transaction);
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
                        ErrorLog.LogErrorMessageToDB("", "PaymentDL.cs", "Commit For Add", ex.Message, _myConnection);
                        return new TransactionResult(TransactionStatus.Failure, "Failure Adding Payment Description");
                    }

                }
                return result;
            }
        }

        #endregion

        private TransactionResult AddPaymentDetail(Database db, DbTransaction transaction)
        {
            int returnValue = 0;
            string sqlCommand = "spPaymentDetails";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            db.AddInParameter(dbCommand, "PaymentID", DbType.Int32, PaymentID);
            db.AddInParameter(dbCommand, "UserID", DbType.Int32, UserID);
            db.AddInParameter(dbCommand, "OrderID", DbType.Int32, OrderID);
            db.AddInParameter(dbCommand, "CardNo", DbType.Double, CardNo);
            db.AddInParameter(dbCommand, "CVVNo", DbType.Int32, CVVNo);
            db.AddInParameter(dbCommand, "Amount", DbType.Int32, Amount);
            db.AddInParameter(dbCommand, "ServiceTaxAmt", DbType.String, ServiceTaxAmt);
            db.AddInParameter(dbCommand, "TotalPayAmt", DbType.Int32, TotalPayAmt);
            db.AddInParameter(dbCommand, "CouponCode", DbType.String, CouponCode);
            db.AddInParameter(dbCommand, "PaymentStatus", DbType.Boolean, PaymentStatus);
            db.AddInParameter(dbCommand, "PaymentMethod", DbType.String, PaymentMethod);

            db.AddParameter(dbCommand, "Return Value", DbType.Int32, ParameterDirection.ReturnValue, "Return Value",
                            DataRowVersion.Default, returnValue);


            db.ExecuteNonQuery(dbCommand, transaction);
            returnValue = (Int32)db.GetParameterValue(dbCommand, "Return Value");

            PaymentID = returnValue;

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
