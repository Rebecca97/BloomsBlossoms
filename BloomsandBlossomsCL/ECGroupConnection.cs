using System;
using System.Collections.Generic;
using System.Text;

namespace BloomsandBlossomsCL
{
    public class ECGroupConnection
    {
        #region Constructor(s)

        public ECGroupConnection()
        {
            DatabaseName = "florist";
        }

        #endregion

        #region Private Variables

        private string _connectionString;
        private string _databaseName;
        
        #endregion

        #region Public Properties

        public string DatabaseName
        {
            get { return _databaseName; }
            set { _databaseName = value; } 
        }

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }
        
        #endregion
    }
}
