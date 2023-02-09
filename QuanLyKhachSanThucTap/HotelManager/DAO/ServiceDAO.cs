using HotelManager.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelManager.DAO
{
    public class ServiceDAO
    {
        private static ServiceDAO instance;
        public List<Service> GetServices(int idServiceType)
        {
            List<Service> services = new List<Service>();
            string query = "USP_LoadServiceByServiceType @idServiceType";
            DataTable dataTable = DataProvider.Instance.ExecuteQuery(query, new object[] { idServiceType });
            foreach (DataRow item in dataTable.Rows)
            {
                Service service = new Service(item);
                services.Add(service);
            }
            return services;
        }       
        internal bool InsertService(string name, int idtype, int price, int quantity, byte[] picture)
        {
            string query = "USP_InsertService @name , @idServiceType , @price, @quantity , @picture";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[]
            {
                name, idtype, price, quantity, picture
            }) > 0;
        }
        internal bool InsertService(Service serviceNow)
        {
            return InsertService(serviceNow.Name, serviceNow.IdServiceType, serviceNow.Price, serviceNow.Quantity, serviceNow.Picture);
        }
        internal bool UpdateService1(int id, string name, int idServiceType, int price, int quantity, byte[] picture)
        {
            string query = "update SERVICE\r\n\t" +
                "set\r\n\t" +
                "SERVICE.Name = '" + name + "',\r\n\t" +
                "SERVICE.IDServiceType = '" + idServiceType + "',\r\n\t" +
                "SERVICE.Price = '" + price + "',\r\n\t" +
                "SERVICE.Quantity = '" + quantity + "',\r\n\t" +
                "SERVICE.Picture = '" + picture + "'\r\n\t" +
                "where SERVICE.ID = '" + id + "'";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { id, name, idServiceType/*, price*/, quantity, picture }) > 0;
        }
        HotelManagementDataContext db=new HotelManagementDataContext();
        internal bool UpdateService(int id, string name, int idServiceType, int price,int quantity, byte[] picture)
        {           
            string query = "USP_UpdateService @id , @name , @idServiceType , @price , @quantity , @picture";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { id, name, idServiceType, price, quantity, picture }) > 0;
        }
        internal bool UpdateService(Service serviceNow, Service servicePre)
        {
            return UpdateService(serviceNow.Id, serviceNow.Name, serviceNow.IdServiceType, serviceNow.Price, serviceNow.Quantity, serviceNow.Picture);
        }
        internal bool CheckNameService(string name)
        {
            string query = "select count(*) from SERVICE where Name='" + name + "'";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { name }) > 0;
        }
        internal bool InsertServiceLinq(string name, int idtype, int price, int quantity, byte[] picture)
        {
            int a = db.USP_InsertService(name, idtype, price, quantity, picture);
            return a > 0;
        }
        internal bool UpdateServiceLinq(int id, string name, int idServiceType, int price, int quantity, byte[] picture)
        {
            int a = db.USP_UpdateService(id, name, idServiceType, price, quantity, picture);
            return a > 0;
        }
        internal DataTable LoadFullService()
        {
            string query = "USP_LoadFullService";
            return DataProvider.Instance.ExecuteQuery(query);
        }
        internal DataTable Search(string name, int id)
        {
            string query = "USP_SearchService @string , @int";
            return DataProvider.Instance.ExecuteQuery(query, new object[] { name, id });
        }
        public static ServiceDAO Instance { get { if (instance == null) instance = new ServiceDAO();return instance; }
            private set => instance = value; }
    }
}
