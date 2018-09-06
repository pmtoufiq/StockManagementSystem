using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class ItemUI : System.Web.UI.Page
    {
        CategoryManager categoryManager = new CategoryManager();
        CompanyManager companyManager = new CompanyManager();
        ItemManager itemManager = new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDropDownList();
                
                itemGridView.DataSource = itemManager.GetAllItem();
                itemGridView.DataBind();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Item item = new Item();
            item.ItemName = itemNameTextBox.Text;
            item.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
            item.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);

            if (categoryDropDownList.SelectedItem.Text=="--Select Category--")
            {
                companyMessageLabel.Text = String.Empty;
                categoryMessageLabel.Text = "Please select a category";
               
                
            }
            else if (companyDropDownList.SelectedItem.Text == "--Select Company--")
            {
                categoryMessageLabel.Text = String.Empty;
                companyMessageLabel.Text="Please select a company.";
              
            }
            else
            {
                companyMessageLabel.Text = String.Empty;
                string saveItem = itemManager.Save(item);
                Clear();
                messageLabel.Text = saveItem;

                itemGridView.DataSource = itemManager.GetAllItem();
                itemGridView.DataBind();
            }

            if (reorderLavelTextBox.Text == "")
            {
                reorderLavelTextBox.Text = "0";
            }
            else
            {
                item.ReorderLevel = Convert.ToInt32(reorderLavelTextBox.Text);
            }

        }

        public void ShowDropDownList()
        {
            List<Category> categoryList = categoryManager.GetCategories();
            categoryDropDownList.DataSource = categoryList;
            categoryDropDownList.DataTextField = "categoryName";
            categoryDropDownList.DataValueField = "categoryId";
            categoryDropDownList.DataBind();

            List<Company> companyList = companyManager.GetCompanies();
            companyDropDownList.DataSource = companyList;
            companyDropDownList.DataTextField = "companyName";
            companyDropDownList.DataValueField = "companyId";
            companyDropDownList.DataBind();
        }

        public void Clear()
        {
            itemNameTextBox.Text=String.Empty;
            reorderLavelTextBox.Text=String.Empty;
        }

        protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}