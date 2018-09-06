using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemProject.DataAccessLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.BusinessLogicLayer
{
    public class StockOutManager
    {
        StockOutGateway stockOutGateway = new StockOutGateway();
        public string GetStockOutQuantity(int itemId)
        {

            return stockOutGateway.GetStockOutQuantity(itemId);
        }

        public string SaveStockOutInfo(StockOut stockOut, string stockOutType)
        {
            if (stockOutGateway.SaveStockOutInfo(stockOut, stockOutType) > 0)
            {
                return "Stock Out Successfull";
            }
            else
            {
                return "Stock Out Failed";
            }
        }

        public List<StockOut> ViewSales(string fromDate, string toDate)
        {
            return stockOutGateway.ViewSales(fromDate, toDate);
        }
    }
}