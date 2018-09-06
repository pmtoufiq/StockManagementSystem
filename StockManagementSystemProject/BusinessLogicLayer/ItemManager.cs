using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemProject.DataAccessLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.BusinessLogicLayer
{
    public class ItemManager
    {
        ItemGateway itemGateway = new ItemGateway();

        public bool IsExist(string itemName)
        {
            return itemGateway.IsExist(itemName);
        }

        public string Save(Item item)
        {
            if (itemGateway.IsExist(item.ItemName))
            {
                return "This item already exist.";
            }

            if(itemGateway.Save(item)>0)
            {
                return "Item added successfully";
            }
            else
            {
                return "Item not added";
            }
        }

        public List<Item> GetAllItem()
        {
            return itemGateway.GetAllItem();
        }

        public List<Item> GetAllItemByCompanyName(int companyId)
        {
            return itemGateway.GetAllItemByCompanyName(companyId);
        }
        

        public string GetItemReorderLevel(int reorderLevel)
        {
            return itemGateway.GetItemReorderLevel(reorderLevel);
        }

        public List<Item> SearchItemByCompany(int companyId)
        {
            return itemGateway.SearchItemByCompany(companyId);
        }

        public List<Item> SearchItemByCategory(int categoryId)
        {
            return itemGateway.SearchItemByCategory(categoryId);
        }

        public List<Item> SearchItemByCompanyAndCategory(int companyId, int categoryId)
        {
            return itemGateway.SearchItemByCompanyAndCategory(companyId, categoryId);
        }
        
        
    }
}