using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Gateway;
using StockManagmentSystemWebApp.DAL.Models;
using StockManagmentSystemWebApp.DAL.Models.ViewModel;

namespace StockManagmentSystemWebApp.BLL
{
    public class StockOutManager
    {
        public CompanyManager CompanyManager { get; set; }
        public ItemManager ItemManager { get; set; }
        public StockOutGateway StockOutGateway { get; set; }
        
        public StockOutManager()
        {
            CompanyManager = new CompanyManager();
            ItemManager = new ItemManager();
            StockOutGateway = new StockOutGateway();
        }

        public string Save(StockOut stockOut)
        {
            int rowAffect = StockOutGateway.Save(stockOut);

            if (rowAffect > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Save Failed";
            }
        }

        public string Update(int itemId, int quantity)
        {
            int oldQuantity = GetItemById(itemId).Quantity;
            int updatedQuantity = oldQuantity - quantity;

            return ItemManager.Update(itemId, updatedQuantity);
        }

        public List<Company> GetAllCompanies()
        {
            return CompanyManager.GetAllCompanies();
        }

        public List<Item> GetItemsByCompany(int companyId)
        {
            return ItemManager.GetItemsByCompany(companyId);
        }

        public Item GetItemById(int id)
        {
            return ItemManager.GetItemById(id);
        }

        public List<ItemViewModel> GetItemByDate(DateTime fromDate, DateTime toDate)
        {
            return StockOutGateway.GetItemByDate(fromDate, toDate);
        }
    }
}