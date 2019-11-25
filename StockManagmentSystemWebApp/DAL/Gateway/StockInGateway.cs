using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.DAL.Gateway
{
    public class StockInGateway : CommonGateway
    {
        public int Save(StockIn stockIn)
        {
            string query = "INSERT INTO StockIn Values ('" + stockIn.ItemId + "','" + stockIn.Quantity + "','" + stockIn.Date + "')";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }


    }
}