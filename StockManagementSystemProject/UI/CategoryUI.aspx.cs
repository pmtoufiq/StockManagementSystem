using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class CategoryUI : System.Web.UI.Page
    {
        public string connectionString =
           WebConfigurationManager.ConnectionStrings["StockManagementSystemConnectionString"].ConnectionString;
        //List<Category> categoryList = 
        protected void Page_Load(object sender, EventArgs e)
        {
            saveButton.Enabled = true;
            updateButton.Enabled = false;

            categoryGridView.DataSource = GetCategories();
            categoryGridView.DataBind();
        }

        CategoryManager aCategoryManager=new CategoryManager();
        protected void saveButton_Click(object sender, EventArgs e)
        {
            Category category = new Category();
            category.CategoryName = categoryNameTextBox.Text;

            string result = aCategoryManager.Save(category);
            messageLabel.Text = result;

            categoryNameTextBox.Text = "";

            categoryGridView.DataSource = GetCategories();
            categoryGridView.DataBind();
        }

        public List<Category> GetCategories()
        {
           List<Category> categoryList=aCategoryManager.GetCategories();
            categoryList.RemoveAt(0);
            return categoryList;
        }

        protected void categoryGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = categoryGridView.SelectedRow;
            categoryNameTextBox.Text = ((Label) row.FindControl("categoryNameLevel")).Text;
            categoryIdHiddenField.Value = ((Label)row.FindControl("categoryIdLevel")).Text;
            saveButton.Enabled = false;
            updateButton.Enabled = true;
        }


        protected void updateButton_Click(object sender, EventArgs e)
        {
            Category category = new Category();
            category.CategoryId = Convert.ToInt32(categoryIdHiddenField.Value);
            category.CategoryName = categoryNameTextBox.Text;

            string message = aCategoryManager.UpdateCategory(category);
            messageLabel.Text = message;
            categoryNameTextBox.Text = "";
            saveButton.Enabled = true;

            GetCategories();

            categoryGridView.DataSource = GetCategories();
            categoryGridView.DataBind();
        } 
    }
}