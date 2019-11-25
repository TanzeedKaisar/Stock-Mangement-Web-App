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
    public partial class CategoryUpdateUI : System.Web.UI.Page
    {
        public Category Category { get; set; }
        public CategoryManager CategoryManager { get; set; }

        public CategoryUpdateUI()
        {
            CategoryManager = new CategoryManager();
            Category = new Category();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["Id"]);
                Category = CategoryManager.GetCategoryById(id);
                idHiddenField.Value = Category.Id.ToString();
                categoryNameTextBox.Text = Category.Name;
            }
            
        }

        protected void categoryUpdateButton_OnClick(object sender, EventArgs e)
        {

            Category.Id = Convert.ToInt32(idHiddenField.Value);
            Category.Name = categoryNameTextBox.Text;
            Category.Date = DateTime.Today;
            
            if (CategoryManager.Update(Category) == "Category Is Already Exists.")
            {
                categoryOutputLabel.Text = "Category Is Already Exists.";
            }
            else
            {
                Response.Redirect("CategoryUI.aspx");
            }
            
        }
    }
}