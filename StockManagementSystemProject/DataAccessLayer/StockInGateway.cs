using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.DataAccessLayer
{
    public class StockInGateway:Gateway
    {
        public int Save(StockIn stockIn)
        {
            Connection.Open();
            Query =
                "INSERT INTO StockInTable(itemId, quantity) VALUES (@ItemId, @Quantity)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("ItemId", stockIn.ItemId);
            Command.Parameters.AddWithValue("Quantity", stockIn.Quantity);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }

        public string GetStockInQuantity(int itemId)
        {
            Connection.Open();
            Query = "SELECT ISNULL(sum(quantity),0)   FROM StockInTable WHERE  itemId=" + itemId;
            Command = new SqlCommand(Query, Connection);
            var data = Command.ExecuteScalar();
            StockIn stockIn = new StockIn();
            stockIn.Quantity = (int) data;
            
            Connection.Close();
            return stockIn.Quantity.ToString();

        }

        public bool IsExist(int itemId)
        {
            Connection.Open();
            Query = "SELECT quantity FROM StockInTable WHERE itemId='" + itemId + "'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}