using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.DataAccessLayer
{
    public class StockOutGateway:Gateway
    {
        public string GetStockOutQuantity(int itemId)
        {
            Connection.Open();
            Query = "SELECT ISNULL(sum(stockOutQuantity),0)   FROM StockOutTable WHERE  itemId=" + itemId;
            Command = new SqlCommand(Query, Connection);
            var data = Command.ExecuteScalar();
            StockIn stockIn = new StockIn();
            stockIn.Quantity = (int)data;

            Connection.Close();
            return stockIn.Quantity.ToString();

        }

        public int SaveStockOutInfo(StockOut stockOut, string stockOutType)
        {
            Connection.Open();
            Query = "INSERT INTO StockOutTable(itemId,stockOutQuantity,stockOutDate,stockOutType) Values (@ItemId, @StockOutQuantity, @StockOutDate, @stockOutType)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("ItemId", stockOut.ItemId);
            Command.Parameters.AddWithValue("StockOutQuantity", stockOut.StockOutQuantity);
            Command.Parameters.AddWithValue("StockOutDate", stockOut.StockOutDate);
            Command.Parameters.AddWithValue("stockOutType", stockOutType);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }

        public List<StockOut> ViewSales(string fromDate, string toDate)
        {
            Connection.Open();
            Query = "Select * From StockOutView where stockOutDate between '" + fromDate + "' and '" + toDate + "' AND stockOutType='Sell'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<StockOut> stockOutList = new List<StockOut>();

            while (Reader.Read())
            {
                StockOut stockOut = new StockOut();
                stockOut.StockOutId = (int)Reader["stockOutId"];
                stockOut.ItemId = (int)Reader["itemId"];
                //stockOut.StockOutDate = (string) Reader["stockOutDate"];
                stockOut.ItemName = Reader["itemName"].ToString();
                stockOut.StockOutQuantity = (int)Reader["stockOutQuantity"];
                stockOutList.Add(stockOut);
            }
            Reader.Close();
            Connection.Close();
            return stockOutList;
        }
    }
}