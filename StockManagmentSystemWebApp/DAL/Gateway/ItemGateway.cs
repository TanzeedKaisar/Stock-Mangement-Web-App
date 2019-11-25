using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.DAL.Gateway
{
    public class ItemGateway : CommonGateway
    {
        public int Save(Item item)
        {
            string query = "INSERT INTO Item Values ('" + item.CategoryId + "','" + item.CompanyId + "','" + item.Name + "','" + item.Quantity + "','" + item.ReorderLevel + "')";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool IsItemExist(string name, int companyId, int categoryId)
        {
            string query = "SELECT * FROM Item WHERE Name = '" + name + "' AND CompanyId = '" + companyId +
                           "' AND CategoryId = '" + categoryId + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public List<Item> GetItemsByCompany(int companyId)
        {
            string query = "SELECT * FROM Item WHERE CompanyId = " + companyId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> items = new List<Item>();
            while (Reader.Read())
            {
                Item item = new Item();
                item.Id = Convert.ToInt32(Reader["Id"]);
                item.Name = Reader["Name"].ToString();
                item.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                item.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                item.Quantity = Convert.ToInt32(Reader["Quantity"]);
                item.ReorderLevel = Convert.ToInt32(Reader["Reorderlevel"]);
                items.Add(item);
            }
            Connection.Close();

            return items;
        }

        public List<Item> GetItemsByCategory(int categoryId)
        {
            string query = "SELECT * FROM Item WHERE CategoryId = " + categoryId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> items = new List<Item>();
            while (Reader.Read())
            {
                Item item = new Item();
                item.Id = Convert.ToInt32(Reader["Id"]);
                item.Name = Reader["Name"].ToString();
                item.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                item.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                item.Quantity = Convert.ToInt32(Reader["Quantity"]);
                item.ReorderLevel = Convert.ToInt32(Reader["Reorderlevel"]);
                items.Add(item);
            }
            Connection.Close();

            return items;
        }

        public List<Item> GetItemsByCompanyCategory(int companyId, int categoryId)
        {
            string query = "SELECT * FROM Item WHERE CompanyId = '" + companyId + "' AND CategoryId = " + categoryId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Item> items = new List<Item>();
            while (Reader.Read())
            {
                Item item = new Item();
                item.Id = Convert.ToInt32(Reader["Id"]);
                item.Name = Reader["Name"].ToString();
                item.CompanyId = Convert.ToInt32(Reader["CompanyId"]);
                item.CategoryId = Convert.ToInt32(Reader["CategoryId"]);
                item.Quantity = Convert.ToInt32(Reader["Quantity"]);
                item.ReorderLevel = Convert.ToInt32(Reader["Reorderlevel"]);
                items.Add(item);
            }
            Connection.Close();

            return items;
        }

        public Item GetItemById(int id)
        {
            string query = "SELECT * FROM Item WHERE Id = " + id;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Item item = new Item();
            if (Reader.HasRows)
            {
                item.Id = Convert.ToInt32(Reader["Id"]);
                item.ReorderLevel = Convert.ToInt32(Reader["ReorderLevel"]);
                item.Quantity = Convert.ToInt32(Reader["Quantity"]);
                
            }
            Connection.Close();

            return item;
        }

        public int Update(int itemId, int quantity)
        {
            string query = "UPDATE Item SET Quantity='" + quantity + "' WHERE Id=" + itemId;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }
    }
}