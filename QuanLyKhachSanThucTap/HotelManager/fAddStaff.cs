using HotelManager.DAO;
using HotelManager.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HotelManager
{
    public partial class fAddStaff : Form
    {
        public fAddStaff()
        {
            InitializeComponent();
            LoadFullStaffType();
        }

        private void btnAddCustomer_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có muốn thêm nhân viên mới không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            if (result == DialogResult.OK)
            {

                if (CheckDate())
                {
                    InsertStaff();
                }
            }

        }
        private void TxbPhoneNumber_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
                e.Handled = true;
        }
        private void TxbUserName_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsLetter(e.KeyChar) || char.IsNumber(e.KeyChar) || e.KeyChar == '\b' || e.KeyChar == '.' || e.KeyChar == '-' ||
                e.KeyChar == '_' || e.KeyChar == '@'))
                e.Handled = true;
            // ^ ([a - zA - Z0 - 9\.\-_ ?@] +)$

        }
        private void LoadFullStaffType()
        {
            comboBoxSex.SelectedIndex = 0;
            DataTable table = GetFullStaffType();
            comboBoxStaffType.DataSource = table;
            comboBoxStaffType.DisplayMember = "Name";
            comboBoxIdStaffType.DataSource = table;
            comboBoxIdStaffType.DisplayMember = "id";
            if (table.Rows.Count > 0)
                comboBoxStaffType.SelectedIndex = 0;
        }
        private DataTable GetFullStaffType()
        {
            return AccountTypeDAO.Instance.LoadFullStaffType();
        }
        public void InsertInfo(string username, string name, string password, string address, int phonenumber, string idCard, DateTime dateOfBirth, string sex, string picture, DateTime startDay, int idStaffType)
        {
            AccountDAO.Instance.InsertInfo(username,name,password,address,phonenumber,idCard,dateOfBirth,sex,picture,startDay,idStaffType);
        }
        private bool CheckInfo(string username, string idCard)
        {
            bool check = AccountDAO.Instance.CheckInfo(username, idCard);
            if (check)
            {
                return false;               
            }
            else
            {
                return true;
            }
        }
        private void InsertStaff()
        {
            bool isFill = fCustomer.CheckFillInText(new Control[] { txbName, comboBoxIdStaffType, txbFullName ,
                                                            txbIDcard , comboBoxSex , txbPhoneNumber, txbAddress,textBoxNamePic});
            
            if (isFill)
            {
                try
                {
                    CheckDate();
                    CheckInfo(txbName.Text, txbIDcard.Text);
                    Account accountNow = GetStaffNow();
                    accountNow.PassWord = fStaff.HassPass;
                    InsertInfo(txbName.Text, txbFullName.Text, accountNow.PassWord, txbAddress.Text, int.Parse(txbPhoneNumber.Text), txbIDcard.Text, datepickerDateOfBirth.Value, comboBoxSex.Text, textBoxNamePic.Text, datePickerStartDay.Value, int.Parse(comboBoxIdStaffType.Text));

                    MessageBox.Show("Thêm Thành Công\n Mật khẩu mặc định cho tài khoản là " + txbName.Text +
                        ": 123456", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch
                {
                    MessageBox.Show("Nhân Viên Đã Tồn Tại(Trùng tên đăng nhập hoặc Số CMND)", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                }
            }
            else
            {
                MessageBox.Show("Không được để trống", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
        //private void InsertStaff()
        //{

        //    AccountDAO.Instance.InsertAccount(Account account);

        //}
        private Account GetStaffNow()
        {
            Account account = new Account();

            #region Format
            fStaff.Trim(new Bunifu.Framework.UI.BunifuMetroTextbox[] { txbName, txbIDcard, txbAddress });
            #endregion            
            account.UserName = txbName.Text.ToLower();
            int index = comboBoxStaffType.SelectedIndex;
            account.IdStaffType = (int)((DataTable)comboBoxStaffType.DataSource).Rows[index]["id"];
            int index1 = comboBoxIdStaffType.SelectedIndex;
            account.IdStaffType = (int)((DataTable)comboBoxIdStaffType.DataSource).Rows[index1]["id"];
            account.DisplayName = txbFullName.Text;
            account.IdCard = txbIDcard.Text;
            account.Sex = comboBoxSex.Text;
            account.DateOfBirth = datepickerDateOfBirth.Value;
            account.PhoneNumber = int.Parse(txbPhoneNumber.Text);
            account.Address = txbAddress.Text;
            account.StartDay = datePickerStartDay.Value;
            account.Picture = textBoxNamePic.Text;
            return account;
        }

        private bool CheckDate()
        {
            if (!CheckTrueDate(datepickerDateOfBirth.Value, DateTime.Now))
            {
                MessageBox.Show("Ngày sinh không hợp lệ (Tuổi phải lớn hơn 18)", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            else
                if (!CheckTrueDate(datepickerDateOfBirth.Value, datePickerStartDay.Value))
            {
                MessageBox.Show("Ngày vào làm không hợp lệ (Lớn hơn 18 tuổi)", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        private bool CheckTrueDate(DateTime date1, DateTime date2)
        {
            if (date2.Subtract(date1).Days < 6574)
                return false;
            return true;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void fAddStaff_Load(object sender, EventArgs e)
        {
            datePickerStartDay.Value = DateTime.Now;
            comboBoxSex.SelectedIndex = 1;
        }

        private void buttonAddPicture_Click(object sender, EventArgs e)
        {
            string imgLocation = @"D:\Vs Code\QuanLyKhachSanThucTap\HotelManager\file";
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "png files(*.png)|*.png|jpg files(*.jpg)|*.jpg|All files(*.*)|*.*";
                if (openFileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                {
                    imgLocation = openFileDialog.FileName;
                    pictureBoxAdd.ImageLocation = imgLocation;
                    pictureBox2.ImageLocation = imgLocation;
                    textBoxNamePic.Text = imgLocation;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Xảy ra lỗi", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void textBoxNamePic_TextChanged(object sender, EventArgs e)
        {

        }
    }

}
