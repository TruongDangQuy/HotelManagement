using Azure;
using Grpc.Core;
using HotelManager.DTO;
using System;
using System.Data;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace HotelManager.DAO
{
    public class AccountDAO
    {

        private static AccountDAO instance;
        internal string HashPass(string text)
        {
            MD5 md5 = MD5.Create();
            byte[] temp = Encoding.ASCII.GetBytes(text);
            byte[] hashData = md5.ComputeHash(temp);
            string hashPass = "";
            foreach (var item in hashData)
            {
                hashPass += item.ToString("x2");
            }
            return hashPass;
        }
        internal bool Login(string username, string password)
        {
           
            string query = "Select * from Staff where UserName='"+username+"' and PassWord='"+ password + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query, new object[] { username, password });
            return data.Rows.Count>0;
        }
        internal Account LoadStaffInforByUserName(string username)
        {
            //string query = "USP_GetNameStaffTypeByUserName @username";
            //DataTable dataTable = DataProvider.Instance.ExecuteQuery(query, new object[] { username });
            string query = "select * from Staff st where UserName='" + username + "'";
            DataTable dataTable = DataProvider.Instance.ExecuteQuery(query, new object[] { username });
            Account account = new Account(dataTable.Rows[0]);
            return account;
        }
        internal Account LoadStaffInforByUserName1(string username)
        {
            //string query = "USP_GetNameStaffTypeByUserName @username";
            //DataTable dataTable = DataProvider.Instance.ExecuteQuery(query, new object[] { username });
            string query = "select UserName,DisplayName,PassWord,IDStaffType,IDCard,DateOfBirth,Sex,Address,PhoneNumber,StartDay from Staff st where UserName='" + username + "'";
            DataTable dataTable = DataProvider.Instance.ExecuteQuery(query, new object[] { username });
            Account account = new Account(dataTable.Rows[0]);
            return account;
        }
        internal bool IsIdCardExists(string idCard)
        {
            //string query = "USP_IsIdCardExistsAcc1 @idCard";
            string query = "select *\r\nfrom Customer\r\nwhere IDCard='"+idCard+"'";
            //return DataProvider.Instance.ExecuteQuery(query, new object[] { idCard }).Rows.Count > 0;
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { idCard }) > 0;
        }
        internal bool UpdateDisplayName(string username,string displayname)
        {
            string query = "USP_UpdateDisplayName1 @username , @displayname";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { username, displayname }) > 0;
        }
        internal bool UpdatePassword(string username, string password)
        {
            string query = "update Staff\r\n\tset PassWord='"+password+"'\r\n\twhere UserName='"+username+"'";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { username, HashPass(password) }) > 0;
        }
        internal bool UpdateInfo(string username,string address, int phonenumber,string idCard, DateTime dateOfBirth,string sex,string picture)
        {          
            //string query = "USP_UpdateInfo1 @username , @address , @phonenumber , @idcard , @dateOfBirth , @sex";
            string query = "update Staff\r\n\t" +
                "set Address='"+address+"', PhoneNumber='"+phonenumber+"', IDCard='"+idCard+"', DateOfBirth='"+dateOfBirth+"',Picture='"+picture+"'\r\n\t" +
                "where UserName='"+username+"'";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { username, address, phonenumber,idCard,dateOfBirth,sex,picture}) > 0;
        }
        internal bool UpdateInfo1(string username, string name, string address, int phonenumber, string idCard, DateTime dateOfBirth, string sex, string picture, DateTime startDay, int idStaffType)
        {
            //string query = "USP_UpdateInfo1 @username , @address , @phonenumber , @idcard , @dateOfBirth , @sex";
            string query = "update Staff\r\n\t" +
                "set DisplayName=N'"+name+"', Address=N'" + address + "', PhoneNumber='" + phonenumber + "', IDCard='" + idCard + "', DateOfBirth='" + dateOfBirth + "',Sex=N'"+sex+"',Picture='" + picture + "',startDay='" + startDay+ "',idStaffType='" + idStaffType+"'\r\n\t" +
                "where UserName=N'" + username + "'";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { username, name, address, phonenumber, idCard, dateOfBirth, sex, picture,startDay, idStaffType }) > 0;
        }
        internal bool InsertInfo(string username,string name,string password, string address, int phonenumber, string idCard, DateTime dateOfBirth, string sex, string picture, DateTime startDay, int idStaffType)
        {
            //string query = "USP_UpdateInfo1 @username , @address , @phonenumber , @idcard , @dateOfBirth , @sex";
            string query = "INSERT INTO dbo.Staff(UserName, DisplayName, PassWord, IDStaffType, IDCard, DateOfBirth, Sex, Address, PhoneNumber, StartDay,Picture)\r\n\t"+
                           "VALUES(N'"+username+"', N'"+name+"', '"+password+ "','"+idStaffType+ "','"+idCard+ "','"+dateOfBirth+"', N'"+sex+ "',N'"+address+ "','" + phonenumber+ "','"+startDay+"', '" + picture+"')";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { username,name,password, address, phonenumber, idCard, dateOfBirth, sex, picture, startDay, idStaffType }) > 0;
        }
        internal bool CheckInfo(string username, string idCard)
        {      
            string query = "SELECT COUNT(*) FROM dbo.Staff WHERE UserName = N'" + username + "' OR IDCard = '" + idCard + "'";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { username, idCard}) > 0;
        }
        public string uploadimage(HttpPostedFileBase file)
        {
            Random r = new Random();
            string path = "-1";
            int random = r.Next();
            if (file != null && file.ContentLength > 0)
            {
                string extension = Path.GetExtension(file.FileName);
                if (extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg") || extension.ToLower().Equals(".png"))
                {
                    try
                    {
                        path = System.IO.Path.Combine(@"D:\file", random + Path.GetFileName(file.FileName));                     
                        file.SaveAs(path);
                        path = "" + random + Path.GetFileName(file.FileName);
                    }
                    catch (Exception ex)
                    {
                        path = "-1";
                    }
                }
                else
                {
                    Console.WriteLine("<script>alert('Only jpg ,jpeg or png formats are acceptable....'); </script>");
                }
            }
            else
            {
                Console.WriteLine("<script>alert('Please select a file'); </script>");
                path = "-1";
            }
            return path;
        }
        internal Account GetStaffSetUp(int idBill)
        {
            string query = "USP_GetStaffSetUp @idBill";
            Account account = new Account(DataProvider.Instance.ExecuteQuery(query, new object[] { idBill }).Rows[0]);
            return account;
        }
        internal DataTable LoadFullStaff()
        {
            string query = "USP_LoadFullStaff1";
            return DataProvider.Instance.ExecuteQuery(query);
        }
        internal bool InsertAccount(Account account)
        {
            string query = "EXEC USP_InsertStaff  @name , @pass , @idStaffType , @idCard , @dateOfBirth , @sex , @address , @phoneNumber , @startDay, @picture, @user";
            object[] parameter = new object[] { account.DisplayName, account.PassWord, account.IdStaffType,
                                                account.IdCard, account.DateOfBirth, account.Sex,
                                                account.Address, account.PhoneNumber, account.StartDay,account.Picture, account.UserName,};
            return DataProvider.Instance.ExecuteNoneQuery(query, parameter) > 0;
        }
        internal bool UpdateAccount(Account account)
        {
            string query = "EXEC USP_UpdateStaff  @name , @idStaffType , @idCard , @dateOfBirth , @sex , @address , @phoneNumber , @startDay, @picture, @user";
            object[] parameter = new object[] {account.DisplayName, account.IdStaffType,
                                               account.IdCard, account.DateOfBirth, account.Sex,
                                                account.Address, account.PhoneNumber, account.StartDay,account.Picture,account.UserName};
            return DataProvider.Instance.ExecuteNoneQuery(query, parameter) > 0;
        }
        internal bool UpdateAccount1(Account account)
        {
            string query = "USP_UpdateStaff1 @displayName , @idStaffType , @idCard , @dateOfBirth , @sex , @address , @phoneNumber , @startDay, @picture, @userName";
            object[] parameter = new object[] {account.DisplayName, account.IdStaffType,
                                               account.IdCard, account.DateOfBirth, account.Sex,
                                                account.Address, account.PhoneNumber, account.StartDay,account.Picture,account.UserName};
            return DataProvider.Instance.ExecuteNoneQuery(query, parameter) > 0;
        }
        internal bool ResetPassword(string user, string hashPass)
        {
            string query = "USP_UpdatePassword1 @user , @hashPass";
            return DataProvider.Instance.ExecuteNoneQuery(query, new object[] { user, hashPass }) > 0;
        }
        internal DataTable Search(string @string, int phoneNumber)
        {
            string query = "USP_SearchStaff @string , @int";
            return DataProvider.Instance.ExecuteQuery(query, new object[] { @string, phoneNumber });
        }
        internal static AccountDAO Instance {
            get { if (instance == null) instance = new AccountDAO();return instance; }
            private set => instance = value; }
        private AccountDAO() { }
    }
}
