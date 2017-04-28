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
    public class AddressDL
    {
        #region Private Variables

        private ECGroupConnection _myConnection = new ECGroupConnection();
        private ScreenMode _screenMode;
        int _addressID;
        int _userID;
        string _contactName;
        string _address1;
        string _address2;
        string _city;
        string _state;
        string _country;
        string _pincode;
        string _note;
        int _addEditOption = 0;

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

        public string ContactName
        {
            get
            {
                return _contactName;
            }

            set
            {
                _contactName = value;
            }
        }

        public string Address1
        {
            get
            {
                return _address1;
            }

            set
            {
                _address1 = value;
            }
        }

        public string Address2
        {
            get
            {
                return _address2;
            }

            set
            {
                _address2 = value;
            }
        }

        public string City
        {
            get
            {
                return _city;
            }

            set
            {
                _city = value;
            }
        }

        public string State
        {
            get
            {
                return _state;
            }

            set
            {
                _state = value;
            }
        }

        public string Country
        {
            get
            {
                return _country;
            }

            set
            {
                _country = value;
            }
        }

        public string Pincode
        {
            get
            {
                return _pincode;
            }

            set
            {
                _pincode = value;
            }
        }

        public string Note
        {
            get
            {
                return _note;
            }

            set
            {
                _note = value;
            }
        }

        public int AddressID
        {
            get
            {
                return _addressID;
            }

            set
            {
                _addressID = value;
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

        public int AddEditOption
        {
            get
            {
                return _addEditOption;
            }

            set
            {
                _addEditOption = value;
            }
        }


        #endregion

        #region Constructor(s)

        public AddressDL() { }

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
                    switch (_screenMode)
                    {
                        case ScreenMode.Add:
                            result = AddEditAddress(db, transaction);
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
                    if (_screenMode == ScreenMode.Add)
                    {
                        ErrorLog.LogErrorMessageToDB("", "AddressDL.cs", "Commit For Add", ex.Message, _myConnection);
                        return new TransactionResult(TransactionStatus.Failure, "Failure Adding Address Description");
                    }
                    
                }
                return result;
            }
        }

        #endregion

        private TransactionResult AddEditAddress(Database db, DbTransaction transaction)
        {
            int returnValue = 0;
            string sqlCommand = "spAddEditAddress";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);

            db.AddInParameter(dbCommand, "AddressID", DbType.Int32, _addressID);
            db.AddInParameter(dbCommand, "UserID", DbType.Int32, _userID);
            db.AddInParameter(dbCommand, "ContactName", DbType.String, _contactName);
            db.AddInParameter(dbCommand, "@AddressLine1", DbType.String, _address1);
            db.AddInParameter(dbCommand, "@AddressLine2", DbType.String, _address2);
            db.AddInParameter(dbCommand, "City", DbType.String, _city);
            db.AddInParameter(dbCommand, "State", DbType.String, _state);
            db.AddInParameter(dbCommand, "Country", DbType.String, _country);
            db.AddInParameter(dbCommand, "Pincode", DbType.String, _pincode);
            db.AddInParameter(dbCommand, "Note", DbType.String, _note);
            db.AddInParameter(dbCommand, "AddEditOption", DbType.Int16, _addEditOption);
            db.AddParameter(dbCommand, "Return Value", DbType.Int32, ParameterDirection.ReturnValue, "Return Value",
                            DataRowVersion.Default, returnValue);

            db.ExecuteNonQuery(dbCommand, transaction);
            returnValue = (Int32)db.GetParameterValue(dbCommand, "Return Value");

            AddressID = returnValue;

            if (returnValue == -1)
            {
                if (AddEditOption == 1)
                    return new TransactionResult(TransactionStatus.Failure, "Failure Updating");
                else
                    return new TransactionResult(TransactionStatus.Failure, "Failure Adding");
            }
            else
            {
                if (AddEditOption == 1)
                    return new TransactionResult(TransactionStatus.Success, "Successfully Updated");
                else
                    return new TransactionResult(TransactionStatus.Success, "Successfully Added");
            }
        }

    }
}
