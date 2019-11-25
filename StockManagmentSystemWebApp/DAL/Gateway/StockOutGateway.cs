using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Models;
using StockManagmentSystemWebApp.DAL.Models.ViewModel;

namespace StockManagmentSystemWebApp.DAL.Gateway
{
    public class StockOutGateway : CommonGateway
    {
        public int Save(StockOut stockOut)
        {
            string query = "INSERT INTO StockOut Values ('" + stockOut.ItemId + "','" + stockOut.Quantity + "','" +
                           stockOut.Method + "','" + stockOut.Date + "')";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public List<ItemViewModel> GetItemByDate(DateTime fromDate, DateTime toDate)
        {
            string query = "SELECT * FROM SellsItem WHERE SellDate BETWEEN '" + fromDate + "' AND '" + toDate + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<ItemViewModel> sellItems = new List<ItemViewModel>();

            while (Reader.Read())
            {
                ItemViewModel itemViewModel = new ItemViewModel();
                itemViewModel.Id = sellItems.Count + 1;
                itemViewModel.ItemName = Reader["ItemName"].ToString();
                itemViewModel.CompanyName = Reader["CompanyName"].ToString();
                itemViewModel.Quantity = Convert.ToInt32(Reader["SellQuantity"]);

                sellItems.Add(itemViewModel);
            }
            Connection.Close();

            return sellItems;
        }
    }
}