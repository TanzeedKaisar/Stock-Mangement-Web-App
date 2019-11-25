using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace StockManagmentSystemWebApp.DAL.Gateway
{
    public class CommonGateway
    {
        private string ConnectionString { get; set; }
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }

        public CommonGateway()
        {
            ConnectionString = WebConfigurationManager.ConnectionStrings["StockManagmentSystemDBConString"].ConnectionString;
            Connection = new SqlConnection(ConnectionString);
        }
    }
}