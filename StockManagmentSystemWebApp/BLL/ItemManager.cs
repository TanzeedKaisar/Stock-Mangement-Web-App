using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Gateway;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.BLL
{
    public class ItemManager
    {
        public ItemGateway ItemGateway { get; set; }
        public CompanyManager CompanyManager { get; set; }
        public CategoryManager CategoryManager { get; set; }

        public ItemManager()
        {
            ItemGateway = new ItemGateway();
            CompanyManager = new CompanyManager();
            CategoryManager = new CategoryManager();
        }

        public string Save(Item item)
        {
            if (ItemGateway.IsItemExist(item.Name, item.CompanyId, item.CategoryId))
            {
                return "Item Is Already Exists.";
            }

            else
            {
                int rowAffect = ItemGateway.Save(item);

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

        public List<Item> GetItemsByCategory(int categoryId)
        {
            return ItemGateway.GetItemsByCategory(categoryId);
        }

        public List<Item> GetItemsByCompany(int companyId)
        {
            return ItemGateway.GetItemsByCompany(companyId);
        }

        public List<Item> GetItemsByCompanyCategory(int companyId, int categoryId)
        {
            return ItemGateway.GetItemsByCompanyCategory(companyId, categoryId);
        }

        public Item GetItemById(int id)
        {
            return ItemGateway.GetItemById(id);
        }

        public string Update(int itemId, int quantity)
        {
            int rowAffect = ItemGateway.Update(itemId, quantity);

            if (rowAffect > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Save Failed";
            }
            
        }

        public List<Company> GetAllCompanies()
        {
            return CompanyManager.GetAllCompanies();
        }

        public List<Category> GetAllCategories()
        {
            return CategoryManager.GetAllCategories();
        }

        public Company GetCompanyById(int id)
        {
            return CompanyManager.GetCompanyById(id);
        }

        public Category GetCategoryById(int id)
        {
            return CategoryManager.GetCategoryById(id);
        }
    }
}