using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagmentSystemWebApp.DAL.Gateway;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.BLL
{
    public class CategoryManager
    {
        private CategoryGateway CategoryGateway { get; set; }

        public CategoryManager()
        {
            CategoryGateway = new CategoryGateway();
        }

        public string Save(Category category)
        {
            if (CategoryGateway.IsCategoryExist(category.Name))
            {
                return "Category Is Already Exists.";
            }

            else
            {
                int rowAffect = CategoryGateway.Save(category);

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

        public string Update(Category category)
        {
            if (CategoryGateway.IsCategoryExist(category.Name))
            {
                return "Category Is Already Exists.";
            }

            else
            {
                int rowAffect = CategoryGateway.Update(category);

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

        public List<Category> GetAllCategories()
        {
            return CategoryGateway.GetAllCategories();
        }

        public Category GetCategoryById(int id)
        {
            return CategoryGateway.GetCategoryById(id);
        }
    }
}