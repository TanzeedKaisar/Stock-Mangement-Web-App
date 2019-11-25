using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagmentSystemWebApp.BLL;
using StockManagmentSystemWebApp.DAL.Models;
using StockManagmentSystemWebApp.DAL.Models.ViewModel;

namespace StockManagmentSystemWebApp.UI
{
    public partial class ItemsSummaryUI : System.Web.UI.Page
    {
        public ItemManager ItemManager { get; set; }
        public List<Item> Items { get; set; }
        public List<ItemViewModel> ItemViewModels { get; set; }
        public int CompanyId { get; set; }
        public int CategoryId { get; set; }
        public Company Company { get; set; }
        public Category Category { get; set; }
        
        private bool isCompanySelected;
        private bool isCategorySelected;

        public ItemsSummaryUI()
        {
            ItemManager = new ItemManager();
            ItemViewModels = new List<ItemViewModel>();
            Company = new Company();
            Category = new Category();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                GetCompany();

                GetCategory();
            }
        }

        private void GetCategory()
        {
            CategoryDropDownList.DataSource = ItemManager.GetAllCategories();
            CategoryDropDownList.DataTextField = "Name";
            CategoryDropDownList.DataValueField = "Id";
            CategoryDropDownList.DataBind();
            CategoryDropDownList.Items.Insert(0, new ListItem("Select Category", ""));
        }

        private void GetCompany()
        {
            CompanyDropDownList.DataSource = ItemManager.GetAllCompanies();
            CompanyDropDownList.DataTextField = "Name";
            CompanyDropDownList.DataValueField = "Id";
            CompanyDropDownList.DataBind();
            CompanyDropDownList.Items.Insert(0, new ListItem("Select Company", ""));
        }

        protected void searchButton_OnClick(object sender, EventArgs e)
        {
            

            if (CompanyDropDownList.SelectedValue == "" && CategoryDropDownList.SelectedValue == "")
            {
                outputLabel.Text = "Select at least one option.";
                itemsGridView.DataSource = ItemViewModels;
                itemsGridView.DataBind();
                
            }
            else if (CategoryDropDownList.SelectedValue == "")
            {
                CompanyId = Convert.ToInt32(CompanyDropDownList.SelectedValue);
                
                Items = ItemManager.GetItemsByCompany(CompanyId);
                GetItems();

                GetCategory();
                outputLabel.Text = String.Empty;
            }
            else if (CompanyDropDownList.SelectedValue == "")
            {
                CategoryId = Convert.ToInt32(CategoryDropDownList.SelectedValue);

                Items = ItemManager.GetItemsByCategory(CategoryId);
                GetItems();

                GetCompany();
                outputLabel.Text = String.Empty;
            }
            else
            {
                CompanyId = Convert.ToInt32(CompanyDropDownList.SelectedValue);
                CategoryId = Convert.ToInt32(CategoryDropDownList.SelectedValue);

                Items = ItemManager.GetItemsByCompanyCategory(CompanyId, CategoryId);
                GetItems();

                outputLabel.Text = String.Empty;
            }
            
        }

        private void GetItems()
        {
            foreach (Item item in Items)
            {
                Company = ItemManager.GetCompanyById(item.CompanyId);
                Category = ItemManager.GetCategoryById(item.CategoryId);

                ItemViewModel itemViewModel = new ItemViewModel();
                itemViewModel.Id = ItemViewModels.Count + 1;
                itemViewModel.ItemName = item.Name;
                itemViewModel.CompanyName = Company.Name;
                itemViewModel.CategoryName = Category.Name;
                itemViewModel.Quantity = item.Quantity;
                itemViewModel.ReorderLevel = item.ReorderLevel;

                ItemViewModels.Add(itemViewModel);
            }

            itemsGridView.DataSource = ItemViewModels;
            itemsGridView.DataBind();
        }
    }
}