using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemProject.DataAccessLayer;
using StockManagementSystemProject.Model;
using StockManagementSystemProject.UI;

namespace StockManagementSystemProject.BusinessLogicLayer
{
    public class StockInManager
    {
        StockInGateway stockInGateway = new StockInGateway();
        StockOutGateway stockOutGateway = new StockOutGateway();
        StockIn stockIn = new StockIn();
        StockOut stockOut = new StockOut();
        public string Save(StockIn stockIn)
        {
            if (stockIn.Quantity<=0)
            {
                return "Item Quantity can not be zero and must be positive number";
            }
            else if (stockInGateway.Save(stockIn)>0)
            {
                return "Stock In Successfully";
            }
            else
            {
                return "Stock In Failed";
            }
        }

        public bool IsExist(int itemId)
        {
            return stockInGateway.IsExist(itemId);
        }
        public string GetStockInQuantity(int itemId)
        {
            return stockInGateway.GetStockInQuantity(itemId);
        }

        public string GetStockOutQuantity(int itemId)
        {
            return stockOutGateway.GetStockOutQuantity(itemId);
        }

        public string GetAvailableQuantity(int itemId)
        {
            int stkin= Convert.ToInt32(stockInGateway.GetStockInQuantity(itemId));
            int stkout = Convert.ToInt32(stockOutGateway.GetStockOutQuantity(itemId));
            return (stkin - stkout).ToString();
        }
    }
}