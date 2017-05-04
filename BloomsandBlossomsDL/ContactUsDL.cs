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
    public class ContactUsDL
    {
        #region private variables
        private ECGroupConnection _myConnection = new ECGroupConnection();
        private ScreenMode _screenMode;

        int _contactUsID;
        string _contactName;
        string _contactSubject;
        string _contactMessage;
        int _contactPhoneNo;
        string _contactEmail;
        #endregion

        #region public variables
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

        public string ContactSubject
        {
            get
            {
                return _contactSubject;
            }

            set
            {
                _contactSubject = value;
            }
        }

        public string ContactMessage
        {
            get
            {
                return _contactMessage;
            }

            set
            {
                _contactMessage = value;
            }
        }

        public int ContactPhoneNo
        {
            get
            {
                return _contactPhoneNo;
            }

            set
            {
                _contactPhoneNo = value;
            }
        }

        public string ContactEmail
        {
            get
            {
                return _contactEmail;
            }

            set
            {
                _contactEmail = value;
            }
        }

        public int ContactUsID
        {
            get
            {
                return _contactUsID;
            }

            set
            {
                _contactUsID = value;
            }
        }
        #endregion

        #region constructor
        public ContactUsDL()
        {

        }

       
        
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
                            result = AddContactUsInfo(db, transaction);
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
                        ErrorLog.LogErrorMessageToDB("", "ContactUsDL.cs", "Commit For Add", ex.Message, _myConnection);
                        return new TransactionResult(TransactionStatus.Failure, "Failure Contact Us Information");
                    }

                }
                return result;
            }
        }

        #endregion

        private TransactionResult AddContactUsInfo(Database db, DbTransaction transaction)
        {
            int returnValue = 0;
            string sqlCommand = "spSaveContactedInfoOfUser";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);


            db.AddInParameter(dbCommand, "ContactName", DbType.String, _contactName);
            db.AddInParameter(dbCommand, "ContactSubject", DbType.String, _contactSubject);
            db.AddInParameter(dbCommand, "ContactMessage", DbType.String, _contactMessage);
            db.AddInParameter(dbCommand, "ContactPhoneNo", DbType.Int32, _contactPhoneNo);
            db.AddInParameter(dbCommand, "ContactEmail", DbType.String, _contactEmail);

            db.AddParameter(dbCommand, "Return Value", DbType.Int32, ParameterDirection.ReturnValue, "Return Value",
                            DataRowVersion.Default, returnValue);

            db.ExecuteNonQuery(dbCommand, transaction);
            returnValue = (Int32)db.GetParameterValue(dbCommand, "Return Value");

            ContactUsID = returnValue;

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
