using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemProject.DataAccessLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.BusinessLogicLayer
{
    public class CategoryManager
    {
        CategoryGateway aCategoryGateway = new CategoryGateway();

        public bool IsExist(string categoryName)
        {
            return aCategoryGateway.IsExist(categoryName);
        }
        public string Save(Category category)
        {
            if (aCategoryGateway.IsExist(category.CategoryName))
            {
                return "This Category Name already exist.";
            }
            if (aCategoryGateway.Save(category)>0)
            {
                return "Category Saved Successfully";
            }
            else
            {
                return "Category Not Saved";
            }
        }

        public List<Category> GetCategories()
        {
            return aCategoryGateway.GetCategories();
        }

        public string UpdateCategory(Category category)
        {
            if (IsExist(category.CategoryName))
            {
                return "This category already exist.";
            }
            int rowCount = aCategoryGateway.UpdateCategory(category);
            if (rowCount > 0)
            {
                return "Category updated successfully.";
            }
            return "Category not updated";
        }

    }
}