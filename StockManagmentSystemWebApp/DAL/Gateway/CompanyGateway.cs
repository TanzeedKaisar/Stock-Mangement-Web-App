using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.DAL.Gateway
{
    public class CompanyGateway : CommonGateway
    {
        
        public int Save(Company company)
        {
            string query = "INSERT INTO Company Values ('" + company.Name + "')";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public bool IsCompanyExist(string name)
        {
            string query = "SELECT * FROM Company WHERE Name = '" + name + "'";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public int Update(Company company)
        {
            string query = "UPDATE Company SET Name='" + company.Name + "' WHERE Id = " + company.Id;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }

        public List<Company> GetAllCompanies()
        {
            string query = "SELECT * FROM Company";
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Company> companies = new List<Company>();
            while (Reader.Read())
            {
                Company company = new Company();
                company.Id = Convert.ToInt32(Reader["Id"]);
                company.SL = companies.Count + 1;
                company.Name = Reader["Name"].ToString();
                
                companies.Add(company);
            }
            Connection.Close();

            return companies; 
        }

        public Company GetCompanyById(int id)
        {
            string query = "SELECT * FROM Company WHERE Id=" + id;
            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            Company company = new Company();

            if (Reader.HasRows)
            {
                company.Id = Convert.ToInt32(Reader["Id"]);
                company.Name = Reader["Name"].ToString();
            }
            Connection.Close();
            return company;
        }

    }
}