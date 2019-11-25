using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.DAL.Gateway
{
    public class CategoryGateway : CommonGateway
    {
        public int Save(Category category)
        {
            string query = "INSERT INTO Category Values ('" + category.Name + "')";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool IsCategoryExist(string name)
        {
            string query = "SELECT * FROM Category WHERE Name = '" + name + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public int Update(Category category)
        {
            string query = "UPDATE Category SET Name='" + category.Name + "' WHERE Id=" + category.Id;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public List<Category> GetAllCategories()
        {
            string query = "SELECT * FROM Category";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Category> categories = new List<Category>();
            while (Reader.Read())
            {
                Category category = new Category();
                category.Id = Convert.ToInt32(Reader["Id"]);
                category.SL = categories.Count + 1;
                category.Name = Reader["Name"].ToString();

                categories.Add(category);
            }
            Connection.Close();

            return categories;
        }

        public Category GetCategoryById(int id)
        {
            string query = "SELECT * FROM Category WHERE Id=" + id;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Category category = new Category();

            if (Reader.HasRows)
            {
                category.Id = Convert.ToInt32(Reader["Id"]);
                category.Name = Reader["Name"].ToString();
            }
            Connection.Close();
            return category;
        }
    }
}