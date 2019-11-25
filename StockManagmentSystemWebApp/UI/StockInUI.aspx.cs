using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagmentSystemWebApp.BLL;
using StockManagmentSystemWebApp.DAL.Models;

namespace StockManagmentSystemWebApp.UI
{
    public partial class StockInUI : System.Web.UI.Page
    {
        public StockInManager StockInManager { get; set; }

        public StockInUI()
        {
            StockInManager = new StockInManager();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                GetCompany();
            }
        }

        private void GetCompany()
        {
            companyDropDownList.DataSource = StockInManager.GetAllCompanies();
            companyDropDownList.DataTextField = "Name";
            companyDropDownList.DataValueField = "Id";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("Select Company", ""));
        }

        protected void saveButton_OnClick(object sender, EventArgs e)
        {
            Item item = new Item();
            item.Id = Convert.ToInt32(itemDropDownList.SelectedValue);
            item.Quantity = Convert.ToInt32(stockInQuantityTextBox.Text);

            if (item.Quantity > 0)
            {
                outputLabel.Text = StockInManager.Update(item.Id, item.Quantity);
                GetCompany();

                itemDropDownList.Items.Clear();
                reorderLevelTextBox.Text = String.Empty;
                availableQuantityTextBox.Text = String.Empty;
                stockInQuantityTextBox.Text = String.Empty;
            }
            else
            {
                outputLabel.Text = "Stock in quantity can not be zero.";
            }
            
        }

        protected void companyDropDownList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            companyDropDownList.Items.Remove(companyDropDownList.Items.FindByText("Select Company"));
            itemDropDownList.DataSource =
                StockInManager.GetItemsByCompany(Convert.ToInt32(companyDropDownList.SelectedValue));
            itemDropDownList.DataTextField = "Name";
            itemDropDownList.DataValueField = "Id";
            itemDropDownList.DataBind();
            itemDropDownList.Items.Insert(0, new ListItem("Select Item", ""));
            reorderLevelTextBox.Text = String.Empty;
            availableQuantityTextBox.Text = String.Empty;
        }

        protected void itemDropDownList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            itemDropDownList.Items.Remove(itemDropDownList.Items.FindByText("Select Item"));
            Item item = StockInManager.GetItemById(Convert.ToInt32(itemDropDownList.SelectedValue));
            reorderLevelTextBox.Text = item.ReorderLevel.ToString();
            availableQuantityTextBox.Text = item.Quantity.ToString();
        }
    }
}