using System;
using System.Collections.Generic;
using StockManagementSystemProject.BusinessLogicLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.UI
{
    public partial class ViewSalesReportUI : System.Web.UI.Page
    {
        StockOutManager stockOutManager = new StockOutManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            //fromDateTextBox.Attributes.Add("ReadOnly", "ReadOnly");
            //toDateTextBox.Attribyutes.Add("ReadOnly", "ReadOnly");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            //List<StockOut> itemListByCompanyAndCategory = stockOutManager.ViewSales(fromDateTextBox.Text, toDateTextBox.Text);
            //showGridView.DataSource = itemListByCompanyAndCategory;
            //showGridView.DataBind();

            //if (fromDateTextBox.Text == "" && toDateTextBox.Text == "")
            //{
            //    showGridView.DataSource = stockOutManager.ViewSales(fromDateTextBox.Text, toDateTextBox.Text);
            //    showGridView.DataBind();
            //}

            ViewSalesReport vsr = new ViewSalesReport();
            String starting = Page.Request.Form["start"];
            String ending = Page.Request.Form["end"];
            vsr.StartDate = starting;
            vsr.EndDate = ending;

            showGridView.DataSource = stockOutManager.ViewSales(vsr.StartDate, vsr.EndDate);
            showGridView.DataBind();
        }
    }
}