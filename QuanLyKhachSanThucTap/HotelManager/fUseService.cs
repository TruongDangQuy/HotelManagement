using HotelManager.DAO;
using HotelManager.DTO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Drawing.Text;
using System.IO;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using Windows.UI.Xaml;
using Microsoft.Office.Interop.Excel;
using DataTable = System.Data.DataTable;
using Windows.ApplicationModel.Payments;
using Button = System.Windows.Forms.Button;
using MetroFramework;

namespace HotelManager
{
    public partial class fUseService : Form
    {

        string staffSetUp;
        public fUseService(string userName)
        {
            staffSetUp = userName;
            InitializeComponent();
            LoadData();
        }
        private void LoadData()
        {
            LoadListServiceType();
            LoadListRoomType();
            LoadListFullRoom();
            ShowSurcharge();
        }
        public void Pay(int idBill, int discount)
        {
            BillDAO.Instance.UpdateRoomPrice(idBill);
            BillDAO.Instance.UpdateServicePrice(idBill);
            BillDAO.Instance.UpdateOther(idBill, discount);

        }
        public void Paid(int idBill,int paid)
        {
            BillDAO.Instance.UpdateOther1(idBill, paid);
        }
        public void LoadListRoomType()
        {
            List<RoomType> roomTypes = RoomTypeDAO.Instance.LoadListRoomType();
            switch (roomTypes.Count)
            {
                case 0:
                    {
                        color1.Visible = color2.Visible = color3.Visible = color4.Visible = color5.Visible = false;
                        lblRoomType1.Visible = lblRoomType2.Visible = lblRoomType3.Visible = lblRoomType4.Visible = lblRoomType5.Visible = false;
                        break;
                    }
                case 1:
                    {
                        lblRoomType1.Text = roomTypes[0].Name;
                        color2.Visible = color3.Visible = color4.Visible = color5.Visible = false;
                        lblRoomType2.Visible = lblRoomType3.Visible = lblRoomType4.Visible = lblRoomType5.Visible = false;
                        break;
                    }
                case 2:
                    {
                        lblRoomType1.Text = roomTypes[0].Name;
                        lblRoomType2.Text = roomTypes[1].Name;
                        color3.Visible = color4.Visible = color5.Visible = false;
                        lblRoomType3.Visible = lblRoomType4.Visible = lblRoomType5.Visible = false;
                        break;
                    }
                case 3:
                    {
                        lblRoomType1.Text = roomTypes[0].Name;
                        lblRoomType2.Text = roomTypes[1].Name;
                        lblRoomType3.Text = roomTypes[2].Name;
                        color4.Visible = color5.Visible = false;
                        lblRoomType4.Visible = lblRoomType5.Visible = false;
                        break;
                    }
                case 4:
                    {
                        lblRoomType1.Text = roomTypes[0].Name;
                        lblRoomType2.Text = roomTypes[1].Name;
                        lblRoomType3.Text = roomTypes[2].Name;
                        lblRoomType4.Text = roomTypes[3].Name;
                        color5.Visible = false;
                        lblRoomType5.Visible = false;
                        break;
                    }
            }
        }
        public void LoadListServiceType()
        {
            cbServiceType.DataSource = ServiceTypeDAO.Instance.GetServiceTypes();
            cbServiceType.DisplayMember = "Name";
        }
        public void LoadListService(int idServiceType)
        {
            cbService.DataSource = ServiceDAO.Instance.GetServices(idServiceType);
            cbService.DisplayMember = "Name";
        }
        public void DrawControl(Room room, Bunifu.Framework.UI.BunifuTileButton button)
        {
            int idRoomTypeName = RoomTypeDAO.Instance.GetRoomTypeByIdRoom(room.Id).Id;
            switch (idRoomTypeName)
            {
                case 1:
                    {
                        button.BackColor = System.Drawing.Color.Tomato;
                        button.color = System.Drawing.Color.Tomato;
                        button.colorActive = System.Drawing.Color.LightSalmon;
                        break;
                    }
                case 2:
                    {
                        button.BackColor = System.Drawing.Color.Violet;
                        button.color = System.Drawing.Color.Violet;
                        button.colorActive = System.Drawing.Color.Thistle;
                        break;
                    }
                case 3:
                    {
                        button.BackColor = System.Drawing.Color.DeepSkyBlue;
                        button.color = System.Drawing.Color.DeepSkyBlue;
                        button.colorActive = System.Drawing.Color.LightSkyBlue;
                        break;
                    }
                case 4:
                    {
                        button.BackColor = System.Drawing.Color.LimeGreen;
                        button.color = System.Drawing.Color.LimeGreen;
                        button.colorActive = System.Drawing.Color.LightGreen;
                        break;
                    }
                default:
                    {
                        button.BackColor = System.Drawing.Color.Gray;
                        button.color = System.Drawing.Color.Gray;
                        button.colorActive = System.Drawing.Color.Silver;
                        break;
                    }
            }
        }
        public void LoadListFullRoom()
        {
            flowLayoutRooms.Controls.Clear();
            listViewBillRoom.Items.Clear();
            listViewUseService.Items.Clear();
            List<Room> rooms = RoomDAO.Instance.LoadListFullRoom();
            foreach (Room item in rooms)
            {
                Bunifu.Framework.UI.BunifuTileButton button = new Bunifu.Framework.UI.BunifuTileButton();
                button.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
                button.ForeColor = System.Drawing.Color.White;
                button.Image = global::HotelManager.Properties.Resources.Room;
                button.ImagePosition = 14;
                button.ImageZoom = 36;
                button.LabelPosition = 29;
                button.Size = new System.Drawing.Size(110, 95);
                button.Margin = new System.Windows.Forms.Padding(1, 1, 1, 1);

                button.Tag = item;
                button.LabelText = item.Name;
                button.Click += Button_Click;

                DrawControl(item, button);

                flowLayoutRooms.Controls.Add(button);

                //BillDAO.Instance.UpdateRoomPrice(item.Id);
            }
        }

        private void Button_Click(object sender, EventArgs e)
        {
            listViewBillRoom.Items.Clear();
            totalPrice = 0;
            Bunifu.Framework.UI.BunifuTileButton button = sender as Bunifu.Framework.UI.BunifuTileButton;
            flowLayoutRooms.Tag = button.Tag;
            button.BackColor = System.Drawing.Color.SeaGreen;
            button.color = System.Drawing.Color.SeaGreen;
            button.colorActive = System.Drawing.Color.MediumSeaGreen;
            foreach (var item in flowLayoutRooms.Controls)
            {
                if (item != button)
                    DrawControl((item as Bunifu.Framework.UI.BunifuTileButton).Tag as Room, item as Bunifu.Framework.UI.BunifuTileButton);
            }
            Room room = button.Tag as Room;
            ShowBill(room.Id);
            //if (!BillDAO.Instance.IsExistsBill(room.Id))
            //{
                int idReceiveRoom = ReceiveRoomDAO.Instance.GetIdReceiveRoomFromIdRoom(room.Id);
                InsertBill(idReceiveRoom, staffSetUp);
            //}
            BillDAO.Instance.UpdateRoomPrice(BillDAO.Instance.GetIdBillFromIdRoom(room.Id));
            ShowBillRoom(room.Id);

            txbTotalPrice.Text = totalPrice.ToString("c0", new CultureInfo("vi-vn"));
            txbTotalPriceInt.Text = totalPrice.ToString();
        }

        public bool IsExistsBill(int idRoom)
        {
            return BillDAO.Instance.IsExistsBill(idRoom);
        }
        public bool IsExistsBillDetails(int idRoom, int idService)
        {
            return BillDetailsDAO.Instance.IsExistsBillDetails(idRoom, idService);
        }
        public bool InsertBill(int idReceiveRoom, string staffSetUp)
        {
            return BillDAO.Instance.InsertBill(idReceiveRoom, staffSetUp);
        }
        public bool InsertBillDetails(int idBill, int idService, int count)
        {
            return BillDetailsDAO.Instance.InsertBillDetails(idBill, idService, count);
        }
        public bool UpdateBillDetails(int idBill, int idService, int _count)
        {
            return BillDetailsDAO.Instance.UpdateBillDetails(idBill, idService, _count);
        }
        public void AddBill(int idRoom, int idService, int count)
        {
            if (IsExistsBill(idRoom))
            {
                //Đã tồn tại Bill
                if (!IsExistsBillDetails(idRoom, idService))
                {
                    //Chưa tồn tại BillDetails
                    if (count > 0)
                    {
                        int idBill = BillDAO.Instance.GetIdBillFromIdRoom(idRoom);
                        InsertBillDetails(idBill, idService, count);
                    }
                    else
                        MetroFramework.MetroMessageBox.Show(this, "Số lượng không hợp lệ.\nVui lòng nhập lại.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    //ĐÃ tồn tại BillDetails
                    int idBill = BillDAO.Instance.GetIdBillFromIdRoom(idRoom);
                    UpdateBillDetails(idBill, idService, count);
                }
            }
            else
            {
                //Chưa tồn tại Bill
                if (count > 0)
                {
                    int idReceiveRoom = ReceiveRoomDAO.Instance.GetIdReceiveRoomFromIdRoom(idRoom);
                    InsertBill(idReceiveRoom, staffSetUp);
                    int idBill = BillDAO.Instance.GetIdBillMax();
                    InsertBillDetails(idBill, idService, count);
                }
                else
                    MetroFramework.MetroMessageBox.Show(this, "Số lượng không hợp lệ.\nVui lòng nhập lại.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        int id = 1;
        int totalPrice = 0;
        int quantity = 0;
        
        public void ShowSurcharge()
        {
            string query = "select * from Parameter";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                ListViewItem listViewItem = new ListViewItem(id.ToString());
                id++;

                ListViewItem.ListViewSubItem subItem1 = new ListViewItem.ListViewSubItem(listViewItem, item["Name"].ToString());
                ListViewItem.ListViewSubItem subItem2 = new ListViewItem.ListViewSubItem(listViewItem, ((double)item["Value"]).ToString());
                ListViewItem.ListViewSubItem subItem3 = new ListViewItem.ListViewSubItem(listViewItem, (item["Describe"]).ToString());

                listViewItem.SubItems.Add(subItem1);
                listViewItem.SubItems.Add(subItem2);
                listViewItem.SubItems.Add(subItem3);

                listViewSurcharge.Items.Add(listViewItem);
            }
            id = 0;
        }
        private Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }
        public Image Base64ToImage(byte[] imageBytes)
        {
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            Image image = Image.FromStream(ms, true);
            return image;
        }
        public void ShowBill(int idRoom)
        {
            //listViewUseService.OwnerDraw = true;
            listViewUseService.Items.Clear();
            DataTable dataTable = BillDAO.Instance.ShowBill(idRoom);
            CultureInfo cultureInfo = new CultureInfo("vi-vn");
            int _totalPrice = 0;
            int _quantity = 0;
            int _count = 0;
            foreach (DataRow item in dataTable.Rows)
            {
                ListViewItem listViewItem = new ListViewItem(id.ToString());
                id++;

                ListViewItem.ListViewSubItem subItem1 = new ListViewItem.ListViewSubItem(listViewItem, item["Tên dịch vụ"].ToString());
                ListViewItem.ListViewSubItem subItem2 = new ListViewItem.ListViewSubItem(listViewItem, ((int)item["Đơn giá"]).ToString("c0", cultureInfo));
                ListViewItem.ListViewSubItem subItem3 = new ListViewItem.ListViewSubItem(listViewItem, ((int)item["Số lượng"]).ToString());
                ListViewItem.ListViewSubItem subItem4 = new ListViewItem.ListViewSubItem(listViewItem, ((int)item["Thành tiền"]).ToString("c0", cultureInfo));
                ListViewItem.ListViewSubItem subItem5 = new ListViewItem.ListViewSubItem(listViewItem, ((int)item["Số lượng tồn"]).ToString());


                _totalPrice += (int)item["Thành tiền"];
                _quantity = (int)item["Số lượng tồn"];
                _count=(int)item["Số lượng"];

                listViewItem.SubItems.Add(subItem1);
                listViewItem.SubItems.Add(subItem2);
                listViewItem.SubItems.Add(subItem3);
                listViewItem.SubItems.Add(subItem4);
                listViewItem.SubItems.Add(subItem5);

                listViewUseService.Items.Add(listViewItem);
            }
            totalPrice += _totalPrice;
            quantity = _quantity;


            ListViewItem listViewItemTotalPrice = new ListViewItem();
            ListViewItem.ListViewSubItem subItemTotalPrice = new ListViewItem.ListViewSubItem(listViewItemTotalPrice, _totalPrice.ToString("c0", cultureInfo));
            ListViewItem.ListViewSubItem _subItem1 = new ListViewItem.ListViewSubItem(listViewItemTotalPrice, "");
            ListViewItem.ListViewSubItem _subItem2 = new ListViewItem.ListViewSubItem(listViewItemTotalPrice, "");
            ListViewItem.ListViewSubItem _subItem3 = new ListViewItem.ListViewSubItem(listViewItemTotalPrice, "");
            
           
            listViewItemTotalPrice.SubItems.Add(_subItem1);
            listViewItemTotalPrice.SubItems.Add(_subItem2);
            listViewItemTotalPrice.SubItems.Add(_subItem3);
            
            
            listViewItemTotalPrice.SubItems.Add(subItemTotalPrice);
            listViewUseService.Items.Add(listViewItemTotalPrice);

            id = 1;
        }
        public void GetFullService()
        {
             ServiceDAO.Instance.LoadFullService();            
        }
        public void ShowBillRoom(int idRoom)
        {
            CultureInfo cultureInfo = new CultureInfo("vi-vn");
            listViewBillRoom.Items.Clear();
            if (IsExistsBill(idRoom))
            {
                DataRow data = BillDAO.Instance.ShowBillRoom(idRoom);
                
                    ListViewItem listViewItem = new ListViewItem(data["Tên phòng"].ToString());

                    ListViewItem.ListViewSubItem subItem1 = new ListViewItem.ListViewSubItem(listViewItem, ((int)data["Đơn giá"]).ToString("c0", cultureInfo));
                    ListViewItem.ListViewSubItem subItem2 = new ListViewItem.ListViewSubItem(listViewItem, ((DateTime)data["Ngày nhận"]).ToString().Split(' ')[0]);
                    ListViewItem.ListViewSubItem subItem3 = new ListViewItem.ListViewSubItem(listViewItem, ((DateTime)data["Ngày trả"]).ToString().Split(' ')[0]);
                    ListViewItem.ListViewSubItem subItem4 = new ListViewItem.ListViewSubItem(listViewItem, ((int)data["Tiền phòng"]).ToString("c0", cultureInfo));
                    ListViewItem.ListViewSubItem subItem5 = new ListViewItem.ListViewSubItem(listViewItem, ((int)data["Phụ thu"]).ToString("c0", cultureInfo));
                    int roomPrice = (int)data["Tiền phòng"] + (int)data["Phụ thu"];
                    ListViewItem.ListViewSubItem subItem6 = new ListViewItem.ListViewSubItem(listViewItem, roomPrice.ToString("c0", cultureInfo));

                    totalPrice += roomPrice;

                    listViewItem.SubItems.Add(subItem1);
                    listViewItem.SubItems.Add(subItem2);
                    listViewItem.SubItems.Add(subItem3);
                    listViewItem.SubItems.Add(subItem4);
                    listViewItem.SubItems.Add(subItem5);
                    listViewItem.SubItems.Add(subItem6);

                    listViewBillRoom.Items.Add(listViewItem);
                
            }
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cbServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadListService((cbServiceType.SelectedItem as ServiceType).Id);
        }
        public Image GetImage(string value)
        {
            byte[] bytes = Convert.FromBase64String(value);
            Image image;
            using (MemoryStream ms = new MemoryStream(bytes))
            {
                image = Image.FromStream(ms);
            }
            return image;
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
        private void cbService_SelectedIndexChanged(object sender, EventArgs e)
        {
            CultureInfo cultureInfo = new CultureInfo("vi-vn");
            if (cbService.SelectedItem != null)
                txbPrice.Text = (cbService.SelectedItem as Service).Price.ToString("c0", cultureInfo);
            var data = (cbService.SelectedItem as Service).Picture;
            var stream = new MemoryStream(data);
            PictureService.Image = Image.FromStream(stream);
            txbQuantity.Text = (cbService.SelectedItem as Service).Quantity.ToString();
            //GetFullService();
        }
        //private void GetServiceNow()
        //{
        //    Service sv = new Service();
        //    sv.Quantity = int.Parse(txbQuantity.Text);           
        //} 
        //private DataTable GetFullService()
        //{
        //    return ServiceDAO.Instance.LoadFullService();
        //}
        //private DataTable GetFullService()
        //{
        //    return ServiceDAO.Instance.LoadFullService();
        //}
        //private void LoadFullService(DataTable table)
        //{
        //    BindingSource source = new BindingSource();
        //    ChangePrice(table);
        //    source.DataSource = table;
        //    dataGridViewService.DataSource = source;
        //    bindingService.BindingSource = source;
        //    comboboxID.DataSource = source;
        //}
        private void btnAdd_Click(object sender, EventArgs e)
        {
            LoadListService((cbServiceType.SelectedItem as ServiceType).Id);
            if (int.Parse(txbQuantity.Text) >= numericUpDownCount.Value)
            {
                totalPrice = 0;
                Room room = flowLayoutRooms.Tag as Room;                                 
                if (room != null)
                {
                    AddBill(room.Id, (cbService.SelectedItem as Service).Id, int.Parse(numericUpDownCount.Value.ToString()));
                    ShowBill(room.Id);
                    numericUpDownCount.Value = 1;
                    txbQuantity.Text = quantity.ToString();

                    ShowBillRoom(room.Id);
                    txbTotalPrice.Text = totalPrice.ToString("c0", new CultureInfo("vi-vn"));
                    //GetFullService();                                      
                }
                else
                {
                    MessageBox.Show("Vui lòng chọn số phòng!");
                }
            }
            else
            {
                //MessageBox.Show("Not enough!");
                MetroFramework.MetroMessageBox.Show(this, "Số lượng không đủ.\nVui lòng chọn sản phẩm khác.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void btnClose__Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txbIDRoom_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                e.Handled = true;
        }
        //public void PaymentItem()
        //{
        //    Room room = flowLayoutRooms.Tag as Room;
        //    if (MessageBox.Show("Bạn có chắc chắn thanh toán cho " + room.Name + " không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
        //    {
        //        int idBill = BillDAO.Instance.GetIdBillFromIdRoom(room.Id);
        //        Pay(idBill, int.Parse(numericUpDown1.Value.ToString()));
        //        ReportDAO.Instance.InsertReport(idBill);
        //        MessageBox.Show("Thanh toán thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        //        this.Hide();
        //        fPrintBill fPrintBill = new fPrintBill(room.Id, idBill);
        //        fPrintBill.ShowDialog();
        //        this.Show();
        //        LoadListFullRoom();
        //        listViewBillRoom.Items.Clear();
        //        listViewUseService.Items.Clear();
        //    }
        //}
        private void btnAddCustomer_Click(object sender, EventArgs e)
        {
            Room room = flowLayoutRooms.Tag as Room;
            //txtDisplay1.Text = Paid.ToString();
            if (room != null)
            {
                if (txtDisplay1.Text != "")
                {
                    if (int.Parse(txtDisplay1.Text) >= int.Parse(txbTotalPriceInt.Text))
                    {

                        if (MessageBox.Show("Bạn có chắc chắn thanh toán cho " + room.Name + " không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                        {
                            int idBill = BillDAO.Instance.GetIdBillFromIdRoom(room.Id);
                            Pay(idBill, int.Parse(numericUpDown1.Value.ToString()));
                            Paid(idBill, int.Parse(txtDisplay1.Text));
                            //txbTotalPriceInt.Text = totalPrice.ToString();
                            ReportDAO.Instance.InsertReport(idBill);
                            MessageBox.Show("Thanh toán thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.Hide();
                            fPrintBill fPrintBill = new fPrintBill(room.Id, idBill);
                            fPrintBill.ShowDialog();
                            this.Show();
                            LoadListFullRoom();
                            listViewBillRoom.Items.Clear();
                            listViewUseService.Items.Clear();
                        }
                    }
                    else
                    {
                        MetroFramework.MetroMessageBox.Show(this, "Số tiền khách đưa không đủ.\nVui lòng thêm tiền.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng nhập số tiền khách đưa!");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn số phòng!");
            }
        }

        private void txbTotalPrice_OnValueChanged(object sender, EventArgs e)
        {

        }

        private void listViewUseService_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void flowLayoutRooms_Paint(object sender, PaintEventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void numericUpDownCount_ValueChanged(object sender, EventArgs e)
        {

        }

        private void color4_Click(object sender, EventArgs e)
        {

        }

        private void bunifuThinButton214_Click(object sender, EventArgs e)
        {

        }

        private void button_click(object sender, EventArgs e)
        {
            //Bunifu.Framework.UI.BunifuTileButton button = new Bunifu.Framework.UI.BunifuTileButton();
            ////Button button =  (Button)sender;
            //txtDisplay1.Text = txtDisplay1.Text + button.Text;
        }

        private void Btn_click(object sender, EventArgs e)
        {
            Button button =  (Button)sender;
            txtDisplay1.Text = txtDisplay1.Text + button.Text;
        }

        private void bunifuThinButton215_Click(object sender, EventArgs e)
        {
            txtDisplay1.Clear();
        }

        private void bunifuThinButton210_Click(object sender, EventArgs e)
        {
            if(txtDisplay1.Text.Length>0)
                txtDisplay1.Text= txtDisplay1.Text.Remove(txtDisplay1.Text.Length-1,1);
            if (txtDisplay1.Text == "")
                txtDisplay1.Text = "0";
        }
    }
}
