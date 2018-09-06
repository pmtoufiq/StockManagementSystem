using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Mime;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class StockInUI : System.Web.UI.Page
    {
        public string connectionString =
           WebConfigurationManager.ConnectionStrings["StockManagementSystemConnectionString"].ConnectionString;

        StockInManager stockInManager =  new StockInManager();
        CompanyManager companyManager = new CompanyManager();
        ItemManager itemManager = new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDropDownList();
            }
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            StockIn stockIn = new StockIn();
            stockIn.ItemId = Convert.ToInt32(itemDropDownList.SelectedValue);
            stockIn.Quantity = Convert.ToInt32(stockInQuantityTextBox.Text);

            string saveStockIn = stockInManager.Save(stockIn);

            messageLabel.Text = saveStockIn;
           Clear();
        }

        public void ShowDropDownList()
        {
            List<Company> companyList = companyManager.GetCompanies();
           
                companyDropDownList.DataSource = companyList;
                //companyDropDownList.AppendDataBoundItems = true;
                //companyDropDownList.Items.Add(new ListItem("---Select Company---", ""));
                companyDropDownList.DataTextField = "companyName";
                companyDropDownList.DataValueField = "companyId";
                companyDropDownList.DataBind();
                
            
           
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedItem.Text != "---Select Items---")
            {
                reorderLevelTextBox.Text = itemManager.GetItemReorderLevel(Convert.ToInt32(itemDropDownList.SelectedValue));
                availableQuantityTextBox.Text = stockInManager.GetAvailableQuantity(Convert.ToInt32(itemDropDownList.SelectedValue));
            }
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedItem.Text != "--Select Company--")
            {
                itemDropDownList.Items.Clear();
                itemDropDownList.AppendDataBoundItems = true;
                itemDropDownList.Items.Add(new ListItem("---Select Items---", ""));
                itemDropDownList.DataSource =
                    itemManager.GetAllItemByCompanyName(Convert.ToInt32(companyDropDownList.SelectedValue));
                itemDropDownList.DataTextField = "ItemName";
                itemDropDownList.DataValueField = "ItemId";
                itemDropDownList.DataBind();
            }
        }

        public void Clear()
        {
            companyDropDownList.SelectedValue = null;
            itemDropDownList.SelectedValue = null;
            reorderLevelTextBox.Text=String.Empty;
            availableQuantityTextBox.Text=String.Empty;
            stockInQuantityTextBox.Text = String.Empty;
        }
    }
}