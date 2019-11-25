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
    public partial class CategoryUI : System.Web.UI.Page
    {
        public CategoryManager CategoryManager { get; set; }
        public Category Category { get; set; }
        private bool isItUpdate;

        public CategoryUI()
        {
            CategoryManager = new CategoryManager();
            Category = new Category();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
                {
                    categoryNameGridView.DataSource = CategoryManager.GetAllCategories();
                    categoryNameGridView.DataBind();
                }
            }

        protected void categorySaveButton_OnClick(object sender, EventArgs e)
        {
            Category.Name = categoryNameTextBox.Text;
            categoryOutputLabel.Text = CategoryManager.Save(Category);
           
            categoryNameGridView.DataSource = CategoryManager.GetAllCategories();
            categoryNameGridView.DataBind();
        }


        protected void OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            DataControlFieldCell dataControlFieldCell = (DataControlFieldCell)linkButton.Parent;
            GridViewRow gridViewRow = (GridViewRow)dataControlFieldCell.Parent;
            HiddenField categoryIdHiddenField = (HiddenField)gridViewRow.FindControl("categoryIdHiddenField");
            int id = Convert.ToInt32(categoryIdHiddenField.Value);
            
            Response.Redirect("CategoryUpdateUI.aspx?Id=" + id);
            
        }
    }
}