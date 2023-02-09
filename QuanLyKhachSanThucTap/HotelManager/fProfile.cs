using HotelManager.DAO;
using HotelManager.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;

namespace HotelManager
{
    public partial class fProfile : Form
    {
      
        public fProfile(string userName)
        {
            InitializeComponent();
            LoadProfile(userName);
        }
        public Image GetImage(byte[] img)
        {
           MemoryStream ms = new MemoryStream(img);
           return Image.FromStream(ms);
        }
        string password;
        public void LoadProfile(string username)
        {
            
                Account staff = AccountDAO.Instance.LoadStaffInforByUserName(username);
                lblUserName.Text = txbUserName.Text = staff.UserName;
                lblDisplayName.Text = txbDisplayName.Text = staff.DisplayName;
                txbStaffType.Text = AccountTypeDAO.Instance.GetStaffTypeByUserName(username).Name;
                txbIDCard.Text = staff.IdCard.ToString();
                txbPhoneNumber.Text = staff.PhoneNumber.ToString();
                txbAddress.Text = staff.Address;
                dpkDateOfBirth.Value = staff.DateOfBirth;
                cbSex.Text = staff.Sex;
                txbStartDay.Text = staff.StartDay.ToShortDateString();
                textBox1.Text=staff.Picture.ToString();
                string fname = textBox1.Text;
                string folder = @"D:\Vs Code\QuanLyKhachSanThucTap\HotelManager\file";
                string pathstring = System.IO.Path.Combine(folder, fname);
                Picture.Image = Image.FromFile(pathstring);
                Picture1.Image=Image.FromFile(pathstring);
                password = staff.PassWord;
                
           
                
                
        
            
            //insert into STAFF(UserName, DisplayName, PassWord, IDStaffType, IDCard, DateOfBirth, Sex, Address, PhoneNumber, StartDay, Picture)
            //select 'dangquy', 'Truong Dang Quy','123','1','27602633','1990-01-01','Nam','Binh Thanh','388159145','2018-05-16',
            //*from Openrowset(bulk N'D:\Vs Code\QuanLyKhachSanThucTap\HotelManager\Resources\argentina.png',single_blob)image;
        }
        public void UpdateDisplayName(string username, string displayname)
        {
            AccountDAO.Instance.UpdateDisplayName(username, displayname);
        }
        public void UpdatePassword(string username, string password)
        {
            AccountDAO.Instance.UpdatePassword(username, password);
        }
        public void UpdateInfo(string username, string address, int phonenumber,string idCard, DateTime dateOfBirth, string sex, string picture)
        {
            AccountDAO.Instance.UpdateInfo(username, address, phonenumber,idCard,dateOfBirth,sex, picture);
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnBookRoom_Click(object sender, EventArgs e)
        {
            if(txbDisplayName.Text!=String.Empty)
            {
                UpdateDisplayName(txbUserName.Text, txbDisplayName.Text);
                MessageBox.Show( "Cập nhật thông tin tài khoản thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LoadProfile(txbUserName.Text);
            }
            else
                MessageBox.Show( "Tên hiển thị không hợp lệ.\nVui lòng nhập lại.", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void bunifuThinButton22_Click(object sender, EventArgs e)
        {
            if (txbPass.Text==password)
            {
                if (txbNewPass.Text==txbReNewPass.Text)
                {
                    UpdatePassword(txbUserName.Text, txbNewPass.Text);
                    MessageBox.Show( "Cập nhật mật khẩu thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txbPass.Text = txbNewPass.Text = txbReNewPass.Text = string.Empty;
                    LoadProfile(txbUserName.Text);
                }
                else
                {
                    MessageBox.Show( "Xác nhận mật khẩu mới không hợp lệ.\nVui lòng nhập lại.", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txbNewPass.Text = txbReNewPass.Text = string.Empty;
                }
            }
            else
            {
                MessageBox.Show("Mật khẩu cũ không đúng.\nVui lòng nhập lại.", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txbPass.Text = txbNewPass.Text = txbReNewPass.Text = string.Empty;
            }
        }

        private void bunifuThinButton21_Click(object sender, EventArgs e)
        {
            if (txbAddress.Text != String.Empty && txbPhoneNumber.Text!=String.Empty && cbSex.Text!=string.Empty && dpkDateOfBirth.Value<DateTime.Now.Date)
            {
                //if (AccountDAO.Instance.IsIdCardExists(txbIDCard.Text))
                //{
                    UpdateInfo(txbUserName.Text, txbAddress.Text, int.Parse(txbPhoneNumber.Text), txbIDCard.Text, dpkDateOfBirth.Value, cbSex.Text, textBox1.Text);
                    MessageBox.Show( "Cập nhật thông tin cơ bản thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    LoadProfile(txbUserName.Text);
                //}
                //else
                //    MessageBox.Show( "Thẻ căn cước/ CMND không tồn tại.\nVui lòng nhập lại.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
                MessageBox.Show( "Thông tin cơ bản không hợp lệ.\nVui lòng nhập lại.", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void txbPhoneNumber_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                e.Handled = true;
        }

        private void btnClose__Click(object sender, EventArgs e)
        {
            Close();
        }

        private void txbPass_OnValueChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void lblDisplayName_Click(object sender, EventArgs e)
        {

        }

        private void lblUserName_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {           
            string imgLocation = @"D:\file";
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "png files(*.png)|*.png|jpg files(*.jpg)|*.jpg|All files(*.*)|*.*";
                if(openFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    imgLocation = openFileDialog.FileName;
                    Picture.ImageLocation= imgLocation;
                    Picture1.ImageLocation = imgLocation;
                    textBox1.Text = imgLocation;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Xảy ra lỗi","Lỗi",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
        }
    }
}
