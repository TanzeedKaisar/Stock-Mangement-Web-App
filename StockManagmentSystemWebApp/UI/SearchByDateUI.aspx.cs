using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagmentSystemWebApp.BLL;
using StockManagmentSystemWebApp.DAL.Models.ViewModel;

namespace StockManagmentSystemWebApp.UI
{
    public partial class SearchByDateUI : System.Web.UI.Page
    {
        public StockOutManager StockOutManager { get; set; }
        public List<ItemViewModel> ItemViewModels { get; set; }

        public SearchByDateUI()
        {
            StockOutManager = new StockOutManager();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_OnClick(object sender, EventArgs e)
        {
            DateTime fromDate = Convert.ToDateTime(fromDateTextBox.Text);
            DateTime toDate = Convert.ToDateTime(toDateTextBox.Text);

            if (fromDate <= toDate)
            {
                ItemViewModels = StockOutManager.GetItemByDate(fromDate, toDate);

                itemsGridView.DataSource = ItemViewModels;
                itemsGridView.DataBind();
            }
            else
            {
                outputLabel.Text = "From date can not be greter than To date.";
            }
        }
    }
}