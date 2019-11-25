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
    public partial class StockOutUI : System.Web.UI.Page
    {
        public StockOutManager StockOutManager { get; set; }
        public ItemViewModel ItemViewModel { get; set; }
        public List<ItemViewModel> ItemViewModels { get; set; }
        public Item Item { get; set; }

        public StockOutUI()
        {
            StockOutManager = new StockOutManager();
            ItemViewModels = new List<ItemViewModel>();
            ItemViewModel = new ItemViewModel();
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
            companyDropDownList.DataSource = StockOutManager.GetAllCompanies();
            companyDropDownList.DataTextField = "Name";
            companyDropDownList.DataValueField = "Id";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("Select Company", ""));

            itemDropDownList.Items.Clear();
            reorderLevelTextBox.Text = String.Empty;
            availableQuantityTextBox.Text = String.Empty;
            stockOutQuantityTextBox.Text = String.Empty;
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            int quantity = Convert.ToInt32(stockOutQuantityTextBox.Text);
            int availableQuantity = Convert.ToInt32(availableQuantityTextBox.Text);

            if (availableQuantity < quantity || quantity < 1)
            {
                outputLabel.Text = "Invalid Stock out quantity.";
            }

            else
            {
                AddItem(quantity);
            }

            //GetCompany();
        }

        private void AddItem(int quantity)
        {
            bool isItemSame = false;

            ItemViewModel itemViewModel = new ItemViewModel();
            itemViewModel.Id = 1;
            itemViewModel.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            itemViewModel.CompanyName = companyDropDownList.SelectedItem.ToString();
            itemViewModel.ItemId = Convert.ToInt32(itemDropDownList.SelectedValue);
            itemViewModel.ItemName = itemDropDownList.SelectedItem.ToString();
            itemViewModel.Quantity = quantity;

            if (ViewState["itemVS"] == null)
            {
                ItemViewModels.Add(itemViewModel);
                ViewState["itemVS"] = ItemViewModels;

                stockOutGridView.DataSource = ItemViewModels;
                stockOutGridView.DataBind();
                outputLabel.Text = "Item Added";
            }
            else
            {
                ItemViewModels = (List<ItemViewModel>) ViewState["itemVS"];
                foreach (ItemViewModel itemView in ItemViewModels)
                {
                    if (itemView.CompanyId == itemViewModel.CompanyId && itemView.ItemId == itemViewModel.ItemId)
                    {
                        isItemSame = true;
                        break;
                    }
                    
                }

                if (isItemSame)
                {
                    outputLabel.Text = "Item can not be same";
                }
                else
                {
                    itemViewModel.Id += ItemViewModels.Count;
                    ItemViewModels.Add(itemViewModel);
                    ViewState["itemVS"] = ItemViewModels;

                    stockOutGridView.DataSource = ItemViewModels;
                    stockOutGridView.DataBind();
                    outputLabel.Text = "Item Added";
                }
            }
        }

        protected void companyDropDownList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            companyDropDownList.Items.Remove(companyDropDownList.Items.FindByText("Select Company"));
            ItemViewModel.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            itemDropDownList.DataSource = StockOutManager.GetItemsByCompany(ItemViewModel.CompanyId);
            itemDropDownList.DataTextField = "Name";
            itemDropDownList.DataValueField = "Id";
            itemDropDownList.DataBind();
            itemDropDownList.Items.Insert(0, new ListItem("Select Item", ""));

            reorderLevelTextBox.Text = String.Empty;
            availableQuantityTextBox.Text = String.Empty;
            stockOutQuantityTextBox.Text = String.Empty;
        }

        protected void itemDropDownList_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            itemDropDownList.Items.Remove(itemDropDownList.Items.FindByText("Select Item"));
            Item = StockOutManager.GetItemById(Convert.ToInt32(itemDropDownList.SelectedValue));
            reorderLevelTextBox.Text = Item.ReorderLevel.ToString();
            availableQuantityTextBox.Text = Item.Quantity.ToString();

            stockOutQuantityTextBox.Text = String.Empty;
        }

        protected void sellButton_OnClick(object sender, EventArgs e)
        {
            outputLabel.Text = SaveByMethod("SELL");
            GridView();
        }

        protected void damageButton_OnClick(object sender, EventArgs e)
        {
            outputLabel.Text = SaveByMethod("DAMAGE");
            GridView();
        }

        protected void lostButton_OnClick(object sender, EventArgs e)
        {
            outputLabel.Text = SaveByMethod("LOST");
            GridView();
        }

        private void GridView()
        {
            ItemViewModels = (List<ItemViewModel>) ViewState["itemVS"];
            stockOutGridView.DataSource = ItemViewModels;
            stockOutGridView.DataBind();
        }

        private string SaveByMethod(string method)
        {
            if (ViewState["itemVS"] == null)
            {
                GetCompany();
                
                return "Please add some item.";
            }
            else
            {
                ItemViewModels = (List<ItemViewModel>) ViewState["itemVS"];

                foreach (ItemViewModel itemView in ItemViewModels)
                {
                    StockOut stockOut = new StockOut();
                    stockOut.ItemId = itemView.ItemId;
                    stockOut.Quantity = itemView.Quantity;
                    stockOut.Method = method;
                    stockOut.Date = DateTime.Today;

                    StockOutManager.Save(stockOut);
                    StockOutManager.Update(stockOut.ItemId, stockOut.Quantity);
                }

                ViewState.Clear();

                GetCompany();
                
                return "Saved Into " + method;
            }
        }
    }
}