using HotelManager.DAO;
using HotelManager.DTO;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataTable = System.Data.DataTable;

namespace HotelManager
{
    public partial class fAddService : Form
    {
        public fAddService()
        {
            InitializeComponent();
            LoadFullServiceType();
            txbPrice.Text = IntToString("100000");
        }
        private void LoadFullServiceType()
        {
            DataTable table = GetFullServiceType();
            comboBoxServiceType.DataSource = table;
            comboBoxServiceType.DisplayMember = "name";
            comboBoxIdServiceType.DataSource = table;
            comboBoxIdServiceType.DisplayMember= "id";
            ;
            if (table.Rows.Count > 0)
                comboBoxServiceType.SelectedIndex = 0;
                comboBoxIdServiceType.SelectedIndex = 0;
        }
        private DataTable GetFullServiceType()
        {
            return ServiceTypeDAO.Instance.LoadFullServiceType();
        }
        private Service GetServiceNow()
        {
            Service service = new Service();
            txbName.Text = txbName.Text.Trim();
            service.Name = txbName.Text;
            service.Price = int.Parse(StringToInt(txbPrice.Text));
            int index = comboBoxServiceType.SelectedIndex;
            service.IdServiceType = (int)((DataTable)comboBoxServiceType.DataSource).Rows[index]["id"];
            service.IdServiceType = (int)((DataTable)comboBoxIdServiceType.DataSource).Rows[index]["id"];            
            return service;
        }
        private void ChangePrice(DataTable table)
        {
            table.Columns.Add("price_New", typeof(string));
            for (int i = 0; i < table.Rows.Count; i++)
            {
                table.Rows[i]["price_New"] = ((int)table.Rows[i]["price"]).ToString("C0", CultureInfo.CreateSpecificCulture("vi-VN"));
            }
        }
        private string StringToInt(string text)
        {
            if (text.Contains(".") || text.Contains(" "))
            {
                string[] vs = text.Split(new char[] { '.', ' ' });
                StringBuilder textNow = new StringBuilder();
                for (int i = 0; i < vs.Length - 1; i++)
                {
                    textNow.Append(vs[i]);
                }
                return textNow.ToString();
            }
            else return text;
        }
        private string IntToString(string text)
        {
            if (text == string.Empty)
                return 0.ToString("C0", CultureInfo.CreateSpecificCulture("vi-VN"));
            if (text.Contains(".") || text.Contains(" "))
                return text;
            else
                return (int.Parse(text).ToString("C0", CultureInfo.CreateSpecificCulture("vi-VN")));
        }

        private void TxbPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsNumber(e.KeyChar) && e.KeyChar != '\b')
            {
                e.Handled = true;
            }
        }

        private void TxbPrice_Leave(object sender, EventArgs e)
        {
            if (txbPrice.Text == string.Empty)
                txbPrice.Text = txbPrice.Tag as string;
            else
                txbPrice.Text = IntToString(txbPrice.Text);
        }
        private void TxbPrice_Enter(object sender, EventArgs e)
        {
            txbPrice.Tag = txbPrice.Text;
            txbPrice.Text = StringToInt(txbPrice.Text);
        }
        private bool CheckName(string name)
        {
            bool check = ServiceDAO.Instance.CheckNameService(name);
            if (check)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public void InSertSerVice(string name, int idServiceType, int price, int quantity, byte[] picture)
        {
            ServiceDAO.Instance.InsertServiceLinq(name, idServiceType, price, quantity, picture);
        }
        private void InsertService()
        {
            bool isFill = fCustomer.CheckFillInText(new Control[] { txbName, txbQuantity });
            byte[] images; ;
            FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(stream);
            images = br.ReadBytes((int)stream.Length);
            if (isFill)
            {               
                try
                {
                    //Service serviceNow = GetServiceNow();
                    CheckName(txbName.Text);
                    InSertSerVice(txbName.Text, int.Parse(comboBoxIdServiceType.Text), int.Parse(txbPriceId.Text), int.Parse(txbQuantity.Text), images);
                    MessageBox.Show("Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    //txbName.Text = string.Empty;
                    //txbPrice.Text = IntToString("100000");
                }
                catch
                {
                    MessageBox.Show("Dịch vụ đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                }
            }
            else
            {
                MessageBox.Show("Không được để trống", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void btnAddCustomer_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có muốn thêm mới dịch vụ?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            if (result == DialogResult.OK)
                InsertService();
            
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            Close();
        }
        private string imgLocation = "";
        private void btnPicture_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "png files(*.png)|*.png|jpg files(*.jpg)|*.jpg|All files(*.*)|*.*";
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                if (imgLocation == null)
                {
                    FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(stream);
                    SERVICE sv = new SERVICE();
                    sv.Picture = br.ReadBytes((int)stream.Length);
                }
                else
                {
                    imgLocation = ofd.FileName.ToString();
                    pictureBoxImage.ImageLocation = imgLocation;
                    pictureBox1.ImageLocation = imgLocation;
                    txtPath.Text = imgLocation;
                }

            }
        }
    }
}
