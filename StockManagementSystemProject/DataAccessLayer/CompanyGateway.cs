using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using StockManagementSystemProject.Model;

namespace StockManagementSystemProject.DataAccessLayer
{
    public class CompanyGateway:Gateway
    {
        public int Save(Company company)
        {
            Connection.Open();
            Query = "INSERT INTO CompanyTable(companyName)VALUES (@CompanyName)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("CompanyName", company.CompanyName);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }


        public bool IsExist(string companyName)
        {
            Connection.Open();
            Query = "SELECT * FROM CompanyTable WHERE companyName=@CompanyName";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("CompanyName", companyName);
            Reader = Command.ExecuteReader();

            if (Reader.HasRows)
            {
                Connection.Close();
                return true;
            }
            else
            {
                Connection.Close();
                return false;
            }
           
        }

        public List<Company> GetCompanies()
        {
            Connection.Open();
            Query = "SELECT * FROM CompanyTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();

            List<Company> companyList = new List<Company>();
            Company bCompany = new Company();
            bCompany.CompanyName = "--Select Company--";
            companyList.Add(bCompany);
            while (Reader.Read())
            {
                Company  aCompany=new Company();
                aCompany.CompanyId = (int)Reader["companyId"];
                aCompany.CompanyName = Reader["CompanyName"].ToString();

                companyList.Add(aCompany);
                
            }
            Reader.Close();
            Connection.Close();
            return companyList;
        } 
        
    }
}