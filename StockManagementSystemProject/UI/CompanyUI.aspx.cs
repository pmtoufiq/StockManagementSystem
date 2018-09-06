using System;
using System.Collections.Generic;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class CompanyUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            companyGridView.DataSource = GetCompanies();
            companyGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Company aCompany = new Company();
            aCompany.CompanyName = nameTextBox.Text;

            messageLabel.Text = companyManager.Save(aCompany);
            nameTextBox.Text = "";

            companyGridView.DataSource = GetCompanies();
            companyGridView.DataBind();
        }

        public List<Company> GetCompanies()
        {
            List<Company> companyList= companyManager.GetCompanies();
            companyList.RemoveAt(0);
            return companyList;
        }
    }
}