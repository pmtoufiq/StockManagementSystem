using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemProject.Model
{
    public class StockIn
    {
        public int StockInId { get; set; }
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public int Quantity { get; set; }
    }
}