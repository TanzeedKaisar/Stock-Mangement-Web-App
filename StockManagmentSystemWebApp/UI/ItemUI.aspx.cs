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
    public partial class ItemUI : System.Web.UI.Page
    {
        public ItemManager ItemManager { get; set; }

        public ItemUI()
        {
            ItemManager = new ItemManager();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                companyDropDownList.DataSource = ItemManager.GetAllCompanies();
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("Select Company", ""));
                
                categoryDropDownList.DataSource = ItemManager.GetAllCategories();
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataBind();
                categoryDropDownList.Items.Insert(0, new ListItem("Select Category", ""));

                reorderLevelTextBox.Text = "0";

            }
        }

        protected void saveButton_OnClick(object sender, EventArgs e)
        {
            Item item = new Item();
            item.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
            item.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            item.Name = itemNameTextBox.Text;
            item.ReorderLevel = Convert.ToInt32(reorderLevelTextBox.Text);
            item.Quantity = 0;

            outputLabel.Text = ItemManager.Save(item);
        }
    }
}