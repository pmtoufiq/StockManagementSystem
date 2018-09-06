using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class SearchAndViewItemSummaryUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        CategoryManager categoryManager = new CategoryManager();
        ItemManager itemManager = new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Company> companyList = companyManager.GetCompanies();
                companyDropDownList.DataSource = companyList;
                companyDropDownList.DataTextField = "companyName";
                companyDropDownList.DataValueField = "companyId";
                companyDropDownList.DataBind();

                List<Category> categoryList = categoryManager.GetCategories();
                categoryDropDownList.DataSource = categoryList;
                categoryDropDownList.DataTextField = "categoryName";
                categoryDropDownList.DataValueField = "categoryId";
                categoryDropDownList.DataBind();
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(companyDropDownList.SelectedItem.Value);
            string companyName = (companyDropDownList.SelectedItem.Text);
            int categoryId = Convert.ToInt32(categoryDropDownList.SelectedItem.Value);
            string categoryName = categoryDropDownList.SelectedItem.Text;

           

            if (categoryName == "--Select Category--") 
            {
                List<Item> itemListByCompany = itemManager.SearchItemByCompany(Convert.ToInt32(companyId));
                showGridView.DataSource = itemListByCompany;
                showGridView.DataBind();
 
            }

           

            else if (companyName == "--Select Company--") 
            {
                List<Item> itemListByCategory = itemManager.SearchItemByCategory(Convert.ToInt32(categoryId));
                showGridView.DataSource = itemListByCategory;
                showGridView.DataBind();

            }

          

            else
            {
                List<Item> itemListByCompanyAndCategory = itemManager.SearchItemByCompanyAndCategory(Convert.ToInt32(companyId), Convert.ToInt32(categoryId));
                showGridView.DataSource = itemListByCompanyAndCategory;
                showGridView.DataBind();

            }
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void companyDropDownList_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}