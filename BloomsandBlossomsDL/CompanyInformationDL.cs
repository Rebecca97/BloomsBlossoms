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
    public class CompanyInformationDL
    {
        private ECGroupConnection _myConnection = new ECGroupConnection();

        #region constructor
        public CompanyInformationDL()
        {

        }

        //public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyState { get; set; }
        public string CompanyCountry { get; set; }
        public string CompanyEmail { get; set; }
        public int CompanyPhone { get; private set; }
        public string CompanyPincode { get; private set; }
        public string CompanyServiceTax { get; private set; }
        public string CompanyTinNo { get; private set; }
        public string CompanyWebsite { get; private set; }
        public string CompanyLogo { get; private set; }
        #endregion

        public DataSet GetCompanyDetails()
        {
            DataSet ds = new DataSet();
            try
            {
                Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
                DbCommand dbCommand = db.GetStoredProcCommand("spGetCompanyInfo");
                dbCommand.Parameters.Clear();
                dbCommand.CommandTimeout = 300;
                ds = db.ExecuteDataSet(dbCommand);

                foreach (var item in ds.Tables[0].DefaultView)
                {


                }



            }
            catch (Exception ex)
            {
                ErrorLog.LogErrorMessageToDB("", "CompanyInformationDL.cs", "GetCompanyDetails", ex.Message.ToString(), _myConnection);
                throw;
            }
            return ds;
        }


        public void GetCompanyInformation()
        {
            Database db = DatabaseFactory.CreateDatabase(_myConnection.DatabaseName);
            string sqlCommand = "spGetCompanyInfo";
            DbCommand dbCommand = db.GetStoredProcCommand(sqlCommand);           

            using (SqlDataReader dataReader = (SqlDataReader)db.ExecuteReader(dbCommand))
            {
                while (dataReader.Read())
                {
                    CompanyName = dataReader.GetString(dataReader.GetOrdinal("CompanyName"));
                    CompanyAddress = dataReader.GetString(dataReader.GetOrdinal("CompanyAddress"));
                    CompanyState = dataReader.GetString(dataReader.GetOrdinal("CompanyState"));
                    CompanyCountry = dataReader.GetString(dataReader.GetOrdinal("CompanyCountry"));
                    CompanyPincode = dataReader.GetString(dataReader.GetOrdinal("CompanyPincode"));
                    CompanyPhone = dataReader.GetInt32(dataReader.GetOrdinal("CompanyPhoneNo"));
                    CompanyEmail = dataReader.GetString(dataReader.GetOrdinal("CompanyEmailID"));
                    CompanyServiceTax = dataReader.GetString(dataReader.GetOrdinal("CompanyServiceTax"));
                    CompanyTinNo = dataReader.GetString(dataReader.GetOrdinal("CompanyTinNo"));
                    CompanyWebsite = dataReader.GetString(dataReader.GetOrdinal("CompanyWebsite"));
                    CompanyLogo = dataReader.GetString(dataReader.GetOrdinal("CompanyLogo"));
                    
                }
            }
        }
    }
}
