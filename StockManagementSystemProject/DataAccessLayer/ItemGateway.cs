using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.DataAccessLayer
{

    public class ItemGateway:Gateway
    {
        StockInGateway stockInGateway = new StockInGateway();
        StockOutGateway stockOutGateway = new StockOutGateway();
        public int Save(Item item)
        {
            Connection.Open();
            Query = "INSERT INTO ItemTable(itemName, categoryId, companyId, reorderLevel) VALUES (@ItemName, @CategoryId, @CompanyId, @ReorderLevel)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("ItemName", item.ItemName);
            Command.Parameters.AddWithValue("CategoryId", item.CategoryId);
            Command.Parameters.AddWithValue("CompanyId", item.CompanyId);
            Command.Parameters.AddWithValue("ReorderLevel", item.ReorderLevel);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }
        
        public List<Item> GetAllItem()
        {
            Connection.Open();
            Query =
                "SELECT i.itemName, ct.categoryName, cm.companyName, i.reorderLevel  FROM ItemTable i INNER JOIN CategoryTable ct ON ct.categoryId=i.categoryId INNER JOIN CompanyTable cm ON cm.companyId=i.companyId";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item item = new Item();
                item.ItemName = Reader["itemName"].ToString();
                item.CategoryName = (string)Reader["categoryName"];
                item.CompanyName = (string)Reader["companyName"];
                item.ReorderLevel = (int)Reader["reorderLevel"];
                itemList.Add(item);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public bool IsExist(string itemName)
        {
            Connection.Open();
            Query = "SELECT * FROM ItemTable WHERE itemName='" + itemName + "'";
            Command = new SqlCommand(Query, Connection);
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

        public List<Item> GetAllItemByCompanyName(int companyId)
        {
            Connection.Open();
            Query = "SELECT * FROM ItemTable WHERE companyId=" + companyId;
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item item = new Item();
                item.ItemId = (int)Reader["itemId"];
                item.ItemName = Reader["itemName"].ToString();
                itemList.Add(item);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public string GetItemReorderLevel(int reorderLevel)
        {
            Connection.Open();
            Query = "SELECT reorderLevel  FROM ItemTable where itemId=" + reorderLevel;
            Command = new SqlCommand(Query, Connection);
            var data = Command.ExecuteScalar();
            Item item = new Item();
            item.ReorderLevel = (int) data;

            Connection.Close();
            return item.ReorderLevel.ToString();

        }

        public List<Item> SearchItemByCompany(int companyId)
        {
            Connection.Open();
            Query = "Select * From SearchItem Where companyId=" + companyId;
                    Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item item = new Item();
                item.ItemId = (int)Reader["itemId"];

               int stockInQty= Convert.ToInt32(stockInGateway.GetStockInQuantity(item.ItemId));
               int stockOutQty= Convert.ToInt32(stockOutGateway.GetStockOutQuantity(item.ItemId));
                item.AvailableQuantity = stockInQty - stockOutQty;

                item.ItemName = Reader["itemName"].ToString();
                item.CompanyId = (int)Reader["companyId"];
                item.CompanyName = Reader["companyName"].ToString();
                item.CategoryId = (int)Reader["categoryId"];
                item.CategoryName = Reader["categoryName"].ToString();
                item.ReorderLevel = (int)Reader["reorderLevel"];
                itemList.Add(item);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public List<Item> SearchItemByCategory(int categoryId)
        {
            Connection.Open();
            Query = "Select * From SearchItem Where categoryId=" + categoryId;
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item item = new Item();
                item.ItemId = (int)Reader["itemId"];

                int stockInQty = Convert.ToInt32(stockInGateway.GetStockInQuantity(item.ItemId));
                int stockOutQty = Convert.ToInt32(stockOutGateway.GetStockOutQuantity(item.ItemId));
                item.AvailableQuantity = stockInQty - stockOutQty;

                item.ItemName = Reader["itemName"].ToString();
                item.CompanyId = (int)Reader["companyId"];
                item.CompanyName = Reader["companyName"].ToString();
                item.CategoryId = (int)Reader["categoryId"];
                item.CategoryName = Reader["categoryName"].ToString();
                item.ReorderLevel = (int)Reader["reorderLevel"];
                itemList.Add(item);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }

        public List<Item> SearchItemByCompanyAndCategory(int companyId, int categoryId)
        {
            Connection.Open();
            Query = "Select * From SearchItem Where companyId="+ companyId + "AND categoryId=" + categoryId;
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Item> itemList = new List<Item>();

            while (Reader.Read())
            {
                Item item = new Item();
                item.ItemId = (int)Reader["itemId"];

                int stockInQty = Convert.ToInt32(stockInGateway.GetStockInQuantity(item.ItemId));
                int stockOutQty = Convert.ToInt32(stockOutGateway.GetStockOutQuantity(item.ItemId));
                item.AvailableQuantity = stockInQty - stockOutQty;

                item.ItemName = Reader["itemName"].ToString();
                item.CompanyId = (int)Reader["companyId"];
                item.CompanyName = Reader["companyName"].ToString();
                item.CategoryId = (int)Reader["categoryId"];
                item.CategoryName = Reader["categoryName"].ToString();
                item.ReorderLevel = (int)Reader["reorderLevel"];
                itemList.Add(item);
            }
            Reader.Close();
            Connection.Close();
            return itemList;
        }
    }
}