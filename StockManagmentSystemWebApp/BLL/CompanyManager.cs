using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Gateway;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.BLL
{
    public class CompanyManager
    {
        private CompanyGateway CompanyGateway { get; set; }

        public CompanyManager()
        {
            CompanyGateway = new CompanyGateway();
        }

        public string Save(Company company)
        {
            if (CompanyGateway.IsCompanyExist(company.Name))
            {
                return "Company Is Already Exists.";
            }

            else
            {
                int rowAffect = CompanyGateway.Save(company);

                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Save Failed";
                }
            }
        }

        public string Update(Company company)
        {
            if (CompanyGateway.IsCompanyExist(company.Name))
            {
                return "Company Is Already Exists.";
            }

            else
            {
                int rowAffect = CompanyGateway.Update(company);

                if (rowAffect > 0)
                {
                    return "Update Successful";
                }
                else
                {
                    return "Update Failed";
                }
            }
        }

        public List<Company> GetAllCompanies()
        {
            return CompanyGateway.GetAllCompanies();
        }

        public Company GetCompanyById(int id)
        {
            return CompanyGateway.GetCompanyById(id);
        }
    }
}