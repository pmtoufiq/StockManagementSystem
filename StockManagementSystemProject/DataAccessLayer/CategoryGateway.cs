using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.Configuration;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.DataAccessLayer
{
    public class CategoryGateway:Gateway
    {
        public int Save(Category aCategory)
        {
            Connection.Open();
            Query = "INSERT INTO CategoryTable(categoryName) VALUES (@CategoryName)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("CategoryName", aCategory.CategoryName);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
           
        }

        public bool IsExist(string categoryName)
        {
            Connection.Open();
            Query = "SELECT * FROM CategoryTable WHERE categoryName=@categoryName";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("categoryName", categoryName);
            Reader = Command.ExecuteReader();

            if (Reader.HasRows)
            {
                Connection.Close();
                return true;
            }
            else
            {
                Connection.Close();
                return false;
            }
            

        }

        public List<Category> GetCategories()
        {
            Connection.Open();
            Query = "SELECT * FROM CategoryTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Category>categoryList=new List<Category>();
            Category bCategory = new Category();
            bCategory.CategoryName = "--Select Category--";
            categoryList.Add(bCategory);
            while (Reader.Read())
            {
                Category aCategory = new Category();
                aCategory.CategoryId = (int)Reader["categoryId"];
                aCategory.CategoryName = Reader["categoryName"].ToString();

                categoryList.Add(aCategory);
            }
            Reader.Close();
            Connection.Close();
            return categoryList;

             
        }

        public int UpdateCategory(Category category)
        {
            Connection.Open();
            Query = "UPDATE CategoryTable SET categoryName='" + category.CategoryName + "' WHERE categoryId = '" + category.CategoryId + "'";
            Command = new SqlCommand(Query, Connection);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }
    }
}