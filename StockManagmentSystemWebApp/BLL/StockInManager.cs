using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Gateway;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.BLL
{
    public class StockInManager
    {
        public ItemManager ItemManager { get; set; }

        public StockInManager()
        {
            ItemManager = new ItemManager();
        }

        public List<Company> GetAllCompanies()
        {
            return ItemManager.GetAllCompanies();
        }

        public List<Item> GetItemsByCompany(int companyId)
        {
            return ItemManager.GetItemsByCompany(companyId);
        }

        public string Update(int itemId, int quantity)
        {
            int oldQuantity = GetItemById(itemId).Quantity;
            int updatedQuantity = oldQuantity + quantity;

            return ItemManager.Update(itemId, updatedQuantity);
        }

        public Item GetItemById(int id)
        {
            return ItemManager.GetItemById(id);
        }
    }
}