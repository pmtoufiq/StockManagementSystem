using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemProject.Model
{
    public class StockOut
    {
        public int StockOutId { get; set; }
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int ReorderLevel { get; set; }
        public int AvailableQuantity { get; set; }
        public string StockOutDate { get; set; }
        public int StockOutQuantity { get; set; }
        public string StockOutType { get; set; }
    }
}