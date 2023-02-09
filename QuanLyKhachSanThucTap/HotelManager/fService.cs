using HotelManager.DAO;
using HotelManager.DTO;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Runtime.InteropServices;
using System.ServiceProcess;
using System.Text;
using System.Windows.Forms;
using System.Windows.Markup;
using Windows.UI.Xaml.Media.Imaging;
using DataTable = System.Data.DataTable;
using Rectangle = System.Drawing.Rectangle;

namespace HotelManager
{
    public partial class fService : Form
    {
        #region Properties
        fServiceType _fServiceType;
        #endregion

        #region Constructor
        public fService()
        {
            this.DoubleBuffered = true;
            InitializeComponent();
            LoadFullServiceType();
            LoadFullService(GetFullService());
            comboboxID.DisplayMember = "id";
            txbSearch.KeyPress += TxbSearch_KeyPress;
            btnCancel.Click += BtnCancel_Click;
            KeyPreview = true;
            KeyPress += FService_KeyPress;
            dataGridViewService.ColumnHeadersDefaultCellStyle.Font = new System.Drawing.Font("Segoe UI", 9.75F);
        }


        #endregion

        #region Load
        private void LoadFullService(DataTable table)
        {
            BindingSource source = new BindingSource();
            ChangePrice(table);
            source.DataSource = table;
            dataGridViewService.DataSource = source;
            bindingService.BindingSource = source;
            comboboxID.DataSource = source;
        }
        private void LoadFullServiceType()
        {
            DataTable table = GetFullServiceType();
            comboBoxServiceType.DataSource = table;
            comboBoxServiceType.DisplayMember = "name";
            comboBoxIdServiceType.DataSource = table;
            comboBoxIdServiceType.DisplayMember = "id";
            ;
            if (table.Rows.Count > 0)
                comboBoxServiceType.SelectedIndex = 0;
                comboBoxIdServiceType.SelectedIndex = 0;
            _fServiceType = new fServiceType(table);
        }
        #endregion

        #region Click
        private void BtnInsertService_Click(object sender, EventArgs e)
        {
            new fAddService().ShowDialog();
            if (btnCancel.Visible == false)
                LoadFullService(GetFullService());
            else
                BtnCancel_Click(null, null);
        }
        private void BtnUpdate_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show( "Bạn có muốn cập nhật lại dịch vụ?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            if (result == DialogResult.OK)
                UpdateService();
            comboboxID.Focus();
        }
        //insert into SERVICE(Name, IDServiceType, Price, Quantity, Picture)
        //select  'Cocktail','2','250000','270',
        //*from Openrowset(bulk N'D:\Vs Code\QuanLyKhachSanThucTap\HotelManager\Resources\icons8-hotel-bell-96.png', single_blob)image;
        private void BtnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void BtnServiceType_Click(object sender, EventArgs e)
        {
            this.Hide();
            _fServiceType.ShowDialog();
            this.LoadFullService(GetFullService());
            comboBoxServiceType.DataSource = _fServiceType.TableSerViceType;
            this.Show();
        }
        private void BindingNavigatorAddNewItem_Click(object sender, EventArgs e)
        {
            txbName.Text = string.Empty;
            txbPrice.Text = string.Empty;
        }
        private void BtnCLose1_Click(object sender, EventArgs e)
        {
            Close();
        }
        private void ToolStripLabel1_Click(object sender, EventArgs e)
        {
            if (saveService.ShowDialog() == DialogResult.Cancel)
                return;
            else
            {
                bool check;
                try
                {
                    switch (saveService.FilterIndex)
                    {
                        case 2:
                            check = ExportToExcel.Instance.Export(dataGridViewService, saveService.FileName, ModeExportToExcel.XLSX);
                            break;
                        case 3:
                            check = ExportToExcel.Instance.Export(dataGridViewService, saveService.FileName, ModeExportToExcel.PDF);
                            break;
                        default:
                            check = ExportToExcel.Instance.Export(dataGridViewService, saveService.FileName, ModeExportToExcel.XLS);
                            break;
                    }
                    if (check)
                        MessageBox.Show( "Xuất thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    else
                        MessageBox.Show( "Lỗi xuất thất bại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                catch
                {
                    MessageBox.Show( "Lỗi (Cần cài đặt Office)", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        private void BtnSearch_Click(object sender, EventArgs e)
        {
            txbSearch.Text = txbSearch.Text.Trim();
            if (txbSearch.Text != string.Empty)
            {
                txbName.Text = string.Empty;
                txbPrice.Text = string.Empty;
                btnSearch.Visible = false;
                btnCancel.Visible = true;
                Search();
            }
        }
        private void BtnCancel_Click(object sender, EventArgs e)
        {
            LoadFullService(GetFullService());
            btnCancel.Visible = false;
            btnSearch.Visible = true;
        }
        #endregion
        public Image convertbytetoimage(Byte[] data)
        {
            using (MemoryStream ms = new MemoryStream(data))
            {
                return Image.FromStream(ms);
            }
        }
        public Image Base64ToImage(byte[] imageBytes)
        {
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            Image image = Image.FromStream(ms, true);
            return image;
        }
        public byte[] ImageToBase64(Image image, System.Drawing.Imaging.ImageFormat format)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(ms, format);
                byte[] imageBytes = ms.ToArray();
                return imageBytes;
            }
        }
        private byte[] Hinhanh { get => Hinhanh; set => Hinhanh = value; }
        #region Method
        private void ChangeText(DataGridViewRow row)
        {
            if (row.IsNewRow)
            {
                bindingNavigatorMoveFirstItem.Enabled = false;
                bindingNavigatorMovePreviousItem.Enabled = false;
                txbName.Text = string.Empty;
                txbPrice.Text = string.Empty;
            }
            else
            {
                txbName.Text = row.Cells["colName"].Value.ToString();
                comboBoxServiceType.Text = row.Cells[colNameServiceType.Name].Value as string;
                comboBoxIdServiceType.SelectedIndex = (int)row.Cells["colIdServiceType"].Value - 1;
                txbPrice.Text = ((int)row.Cells[col.Name].Value).ToString("c0", CultureInfo.CreateSpecificCulture("vi-vn"));
                txbPriceInt.Text = row.Cells["col"].Value.ToString();
                txbQuantity.Text= row.Cells["colQuantity"].Value.ToString();
                var data = (byte[])(row.Cells["ColPicture"].Value);
                var stream = new MemoryStream(data);
                pictureBoxPicture.Image = Image.FromStream(stream);
                pictureBox1.Image = Image.FromStream(stream);
                SERVICE sv = new SERVICE();
                sv.Picture = data;
                txtPath.Text = row.Cells["ColPicture"].Value.ToString();
                //MemoryStream ms = new MemoryStream();
                //pictureBoxPicture.Image = Image.FromStream(ms);
                //pictureBoxPicture.Image = Image.FromFile(row.Cells["ColPicture"].Value.ToString());
                Service room = new Service(((DataRowView)row.DataBoundItem).Row);
                groupService.Tag = room;
                bindingNavigatorMoveFirstItem.Enabled = true;
                bindingNavigatorMovePreviousItem.Enabled = true;
            }
        }
        public void UpDateSerVice(int id, string name, int idServiceType, int price, int quantity, byte[] picture)
        {
            ServiceDAO.Instance.UpdateServiceLinq(id,name,idServiceType, price, quantity, picture);
        }
        private void UpdateService()
        {
            byte[] images; ;
            FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(stream);
            images = br.ReadBytes((int)stream.Length);
                   
            if (comboboxID.Text == string.Empty)
                MessageBox.Show( "Dịch vụ không tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            else
            if (!fCustomer.CheckFillInText(new Control[] { txbName, txbPrice, txbQuantity }))
            {
                MessageBox.Show( "Không được để trống", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else
            {
                //Service servicePre = groupService.Tag as Service;
                //////try
                //////{
                //Service serviceNow = GetServiceNow();
                //if (serviceNow.Equals(servicePre))
                //{
                //    MessageBox.Show("Bạn chưa thay đổi dữ liệu", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                //}
                //else
                //{
                    UpDateSerVice(int.Parse(comboboxID.Text), txbName.Text, int.Parse(comboBoxIdServiceType.Text), int.Parse(txbPriceInt.Text), int.Parse(txbQuantity.Text), images);

                    //if (check)
                    //{
                        MessageBox.Show("Thành Công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        //groupService.Tag = serviceNow;
                        if (btnCancel.Visible == false)
                        {
                            int index = dataGridViewService.SelectedRows[0].Index;
                            LoadFullService(GetFullService());
                            comboboxID.SelectedIndex = index;
                        }
                        else
                            BtnCancel_Click(null, null);
                    //}
                    //else
                    //    MessageBox.Show("Dịch vụ không tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                //}
                //}
                //catch
                //{
                //    MessageBox.Show( "Lỗi", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                //}
            }
        }
        private void Search()
        {
            LoadFullService(GetSearchService());
        }
        #endregion

        #region Get Data
        private DataTable GetFullService()
        {
            return ServiceDAO.Instance.LoadFullService();
        }
        private DataTable GetFullServiceType()
        {
            return ServiceTypeDAO.Instance.LoadFullServiceType();
        }
        public static byte[] BitmapToByteArray(Bitmap bitmap)
        {

            BitmapData bmpdata = null;

            try
            {
                bmpdata = bitmap.LockBits(new Rectangle(0, 0, bitmap.Width, bitmap.Height), ImageLockMode.ReadOnly, bitmap.PixelFormat);
                int numbytes = bmpdata.Stride * bitmap.Height;
                byte[] bytedata = new byte[numbytes];
                IntPtr ptr = bmpdata.Scan0;

                Marshal.Copy(ptr, bytedata, 0, numbytes);

                return bytedata;
            }
            finally
            {
                if (bmpdata != null)
                    bitmap.UnlockBits(bmpdata);
            }

        }
        public static Bitmap ByteToImage(byte[] blob)
        {
            MemoryStream mStream = new MemoryStream();
            byte[] pData = blob;
            mStream.Write(pData, 0, Convert.ToInt32(pData.Length));
            Bitmap bm = new Bitmap(mStream, false);
            mStream.Dispose();
            return bm;
        }
        private byte[] convert()
        {
            FileStream fs = new FileStream(txtPath.Text, FileMode.Open, FileAccess.Read);
            byte[] data = new byte[fs.Length];
            fs.Read(data,0,System.Convert.ToInt32(fs.Length));
            fs.Close();
            return data;
        }
        private Service GetServiceNow()
        {
            Service service = new Service();
            if (comboboxID.Text == string.Empty)
                service.Id = 0;
            else
                service.Id = int.Parse(comboboxID.Text);
            txbName.Text = txbName.Text.Trim();
            service.Name = txbName.Text;
            service.Price = int.Parse(StringToInt(txbPrice.Text));
            int index = comboBoxServiceType.SelectedIndex;
            int index1=comboBoxIdServiceType.SelectedIndex;
            service.IdServiceType = (int)((DataTable)comboBoxServiceType.DataSource).Rows[index]["id"];
            service.IdServiceType = (int)((DataTable)comboBoxIdServiceType.DataSource).Rows[index1]["id"];
            service.Quantity = int.Parse(txbQuantity.Text);
            service.Picture = Hinhanh;
            //var data = (byte[])pictureBoxPicture.Image.Clone();
            //byte[] images = null;
            //FileStream stream = new FileStream(imgLocation, FileMode.Open, FileAccess.Read);
            //BinaryReader br = new BinaryReader(stream);
            //images = br.ReadBytes((int)stream.Length);
            //service.Picture = images;            
            //service.Picture = images;
            
            //pictureBoxPicture.Image = ByteToImage();
            //service.Picture = Base64ToImage(pictureBoxPicture.Image.Clone());
            /*service.Picture = (byte[])pictureBoxPicture.Image.Clone()*/
            ;
            //var data = (byte[])pictureBoxPicture.Image.Clone();
            //var stream = new MemoryStream(data);
            //service.Picture = Image.FromStream(stream);
            //pictureBox1.Image = Image.FromStream(stream);
            //ImageConverter converter = new ImageConverter();

            return service;
        }
        private DataTable GetSearchService()
        {
            if (int.TryParse(txbSearch.Text, out int id))
                return ServiceDAO.Instance.Search(txbSearch.Text, id);
            else
                return ServiceDAO.Instance.Search(txbSearch.Text, 0);
        }
        #endregion

        #region Change
        private void DataGridViewService_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridViewService.SelectedRows.Count > 0)
            {
                DataGridViewRow row = dataGridViewService.SelectedRows[0];
                ChangeText(row);
            }
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
        #endregion

        #region Key
        private void TxbPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsNumber(e.KeyChar) && e.KeyChar != '\b')
            {
                e.Handled = true;
            }
        }
        private void TxbSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
                BtnSearch_Click(sender, null);
            else
                if (e.KeyChar == 27 && btnCancel.Visible == true)
                BtnCancel_Click(sender, null);
        }
        private void FService_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 27 && btnCancel.Visible == true)
                BtnCancel_Click(sender, null);
        }
        #endregion

        #region Enter
        private void TxbPrice_Enter(object sender, EventArgs e)
        {
            txbPrice.Tag = txbPrice.Text;
            txbPrice.Text = StringToInt(txbPrice.Text);
        }
        private void TxbName_Enter(object sender, EventArgs e)
        {
            txbName.Tag = txbName.Text;
        }

        #endregion

        #region Leave
        private void TxbPrice_Leave(object sender, EventArgs e)
        {
            if (txbPrice.Text == string.Empty)
                txbPrice.Text = txbPrice.Tag as string;
            else
                txbPrice.Text = IntToString(txbPrice.Text);
        }
        private void TxbName_Leave(object sender, EventArgs e)
        {
            if (txbName.Text == string.Empty)
                txbName.Text = txbName.Tag as string;
        }
        #endregion

        #region Close
        private void FService_FormClosing(object sender, FormClosingEventArgs e)
        {
            BtnCancel_Click(sender, null);
        }
        #endregion
        private string imgLocation= "";
       

        

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
                    pictureBoxPicture.ImageLocation = imgLocation;
                    pictureBox1.ImageLocation = imgLocation;
                    txtPath.Text = imgLocation;
                }

            }
            //OpenFileDialog of = new OpenFileDialog();
            ////For any other formats
            //of.Filter = "Image Files (*.bmp;*.jpg;*.jpeg,*.png)|*.BMP;*.JPG;*.JPEG;*.PNG";
            //if (of.ShowDialog() == DialogResult.OK)
            //{
            //    pictureBoxPicture.ImageLocation = of.FileName;
            //    pictureBox1.ImageLocation = of.FileName;
            //    txtPath.Text = of.FileName;
            //}

            //byte[] img = File.ReadAllBytes(of.FileName);
            //MemoryStream ms = new MemoryStream(img);
            //pictureBoxPicture.Image = Image.FromStream(ms);
            //pictureBox1.Image = Image.FromStream(ms);

            //OpenFileDialog dlg = new OpenFileDialog();
            //dlg.Filter = "PNG Files(*.png)|*.png|JPG Files(*.jpg)|*.jpg|All Files(*.*)|*.*";
            //dlg.Title = "Selecteer auto afbeelding.";
            //if (dlg.ShowDialog() == DialogResult.OK)
            //{
            //    string picPath = dlg.FileName.ToString();
            //    afbeelding_txt.Text = picPath;
            //    pictureBox1.ImageLocation = picPath;
            //}
        }

        private void saveService_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
        {

        }
    }
}
