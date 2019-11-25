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
    public partial class CompanyUI : System.Web.UI.Page
    {
        public CompanyManager CompanyManager { get; set; }

        public CompanyUI()
        {
            CompanyManager = new CompanyManager();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                companyNameGridView.DataSource = CompanyManager.GetAllCompanies();
                companyNameGridView.DataBind();
            }
        }

        protected void companySaveButton_OnClick(object sender, EventArgs e)
        {
            Company company = new Company();
            company.Name = companyNameTextBox.Text;

            companyOutputLabel.Text = CompanyManager.Save(company);

            companyNameGridView.DataSource = CompanyManager.GetAllCompanies();
            companyNameGridView.DataBind();
        }
    }
}