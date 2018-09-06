using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemProject.DataAccessLayer;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.BusinessLogicLayer
{
    public class CompanyManager
    {
        CompanyGateway companyGateway = new CompanyGateway();
        public bool IsExist(string companyName)
        {
            return companyGateway.IsExist(companyName);
        }
        public string Save(Company company)
        {
            if (companyGateway.IsExist(company.CompanyName))
            {
                return "This Company Name already exist.";
            }

            if (companyGateway.Save(company)>0)
            {
                return "Company Name Saved Successfully";
            }
            else
            {
                return "Company Name Not Saved";
            }
        }

        public List<Company> GetCompanies()
        {
           return companyGateway.GetCompanies();
           
        }

    }
}