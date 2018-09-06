using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.DataAccessLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class StockOutUI : System.Web.UI.Page
    {
        ItemManager itemManager = new ItemManager();
        CompanyManager companyManager = new CompanyManager();
        StockInManager stockInManager = new StockInManager();
        StockOutManager stockOutManager = new StockOutManager();
        Gateway gateway = new Gateway();

        List<StockOut> stockOutList = new List<StockOut>();
        int stockOut;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Company> companyList = companyManager.GetCompanies();

                companyDropDownList.DataSource = companyList;
                companyDropDownList.DataTextField = "companyName";
                companyDropDownList.DataValueField = "companyId";
                companyDropDownList.DataBind();

                stockOutGridView.DataSource = stockOutList;
                stockOutGridView.DataBind();

                if (companyHiddenField.Value != Request.Form[companyDropDownList.UniqueID])
                {
                    companyDropDownList_SelectedIndexChanged(sender, e);
                    companyHiddenField.Value = Request.Form[companyDropDownList.UniqueID];
                }
                addButton.Enabled = false;
                sellButton.Enabled = false;
                damageButton.Enabled = false;
                lostButton.Enabled = false;
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

                Clear();
            }
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedItem.Text != "---Select Items---")
            {
                stockOutQuantityTextBox.Enabled = true;
                reorderLevelTextBox.Text =
                    itemManager.GetItemReorderLevel(Convert.ToInt32(itemDropDownList.SelectedItem.Value));
                availableQuantityTextBox.Text =
                    stockInManager.GetAvailableQuantity(Convert.ToInt32(itemDropDownList.SelectedValue));
                if (availableQuantityTextBox.Text == "0")
                {
                    stockOutQuantityTextBox.Enabled = false;
                }

                IdHiddenField.Value = Convert.ToInt32(itemDropDownList.SelectedValue).ToString();

            }
        }
        
        protected void addButton_Click(object sender, EventArgs e)
        {
            int flag = 0;

            if (Session["stockList"] != null)
            {
                stockOutList = (List<StockOut>)Session["stocklist"];
            }
            int stockOutQuantity;
            if (int.TryParse(stockOutQuantityTextBox.Text, out stockOutQuantity))
            {
                if (stockOutQuantity > 0)
                {
                    foreach (var itemId in stockOutList)
                    {
                        if (itemId.ItemId == Convert.ToInt32(IdHiddenField.Value))
                        {
                            itemId.StockOutQuantity += Convert.ToInt32(stockOutQuantityTextBox.Text);
                            flag = 1;
                        }
                    }

                    if (flag == 0)
                    {
                        StockOut stockOut = new StockOut();
                        stockOut.ItemName = itemDropDownList.SelectedItem.Text;
                        stockOut.ItemId = Convert.ToInt32(IdHiddenField.Value);
                        stockOut.CompanyName = companyDropDownList.SelectedItem.Text;
                        int availableQty = Convert.ToInt32(availableQuantityTextBox.Text);
                        stockOut.StockOutQuantity = Convert.ToInt32(stockOutQuantityTextBox.Text);
                        stockOut.StockOutDate = System.DateTime.Today.ToString("yyyy-MM-dd");
                        stockOut.AvailableQuantity = availableQty - stockOut.StockOutQuantity;
                        stockOutList.Add(stockOut);

                    }

                    Session["stockList"] = stockOutList;
                    stockOutGridView.DataSource = stockOutList;
                    stockOutGridView.DataBind();

                    sellButton.Enabled = true;
                    damageButton.Enabled = true;
                    lostButton.Enabled = true;
                }
                else
                {
                    Response.Write("<script>alert('Invalid input');</script>");
                }
            }

            else
            {
                Response.Write("<script>alert('Stock out quantity must be an integer');</script>");
            }

        }

        public void Clear()
        {
            reorderLevelTextBox.Text = String.Empty;
            availableQuantityTextBox.Text = String.Empty;
            stockOutQuantityTextBox.Text = String.Empty;
        }


        protected void sellButton_Click(object sender, EventArgs e)
        {

            var data = (List<StockOut>)Session["stocklist"];

            foreach (var items in data)
            {
                string saveStockOut = stockOutManager.SaveStockOutInfo(items, "Sell");
                SaveSuccessful();
            }
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            var data = (List<StockOut>)Session["stocklist"];

            foreach (var items in data)
            {
                string saveStockOut = stockOutManager.SaveStockOutInfo(items, "Damage");
                SaveSuccessful();
            }
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            var data = (List<StockOut>)Session["stocklist"];

            foreach (var items in data)
            {
                string saveStockOut = stockOutManager.SaveStockOutInfo(items, "Lost");
                SaveSuccessful();
            }
        }

        protected void stockOutQuantityTextBox_TextChanged(object sender, EventArgs e)
        {
            if (Session["stocklist"] != null)
            {
                stockOutList = (List<StockOut>)Session["stocklist"];
            }

            int temp = 0;
            foreach (var data in stockOutList)
            {
                if (data.ItemId == Convert.ToInt32(IdHiddenField.Value))
                {
                    temp = data.StockOutQuantity;
                }

            }
            if (int.TryParse(stockOutQuantityTextBox.Text, out stockOut))
            {
                addButton.Enabled = false;
                int availableQuantity = Convert.ToInt32(availableQuantityTextBox.Text);
                int id = Convert.ToInt32(IdHiddenField.Value);
                foreach (var data in stockOutList)
                {
                    if (id==data.ItemId)
                    {
                        stockOut += data.StockOutQuantity;
                    }
                }

                if (availableQuantity >= stockOut + temp)
                {

                    addButton.Enabled = true;
                }
                else
                {
                    Response.Write("<script>alert('Stock out quantity can't be greater than available quantity.');</script>");
                }
            }
        }

        protected void SaveSuccessful()
        {
            Response.Write("<script>alert('Stock out successful');</script>");
            Session["stocklist"] = null;
            stockOutGridView.DataSource = null;
            stockOutGridView.DataBind();
            int avaialableQuantity = Convert.ToInt32(stockInManager.GetAvailableQuantity(Convert.ToInt32(IdHiddenField.Value)));
            
            availableQuantityTextBox.Text = avaialableQuantity.ToString();
            stockOutQuantityTextBox.Text = null;
        }


    }
}
