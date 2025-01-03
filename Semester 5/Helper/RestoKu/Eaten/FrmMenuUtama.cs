using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace Eaten
{

    public partial class FrmMenuUtama : Form
    {
        private Connection koneksi = new Connection();

        //long harga = 0;
        string desk = "";

        public FrmMenuUtama()
        {
            InitializeComponent();
        }

        private void FrmMenuUtama_Load(object sender, EventArgs e)
        {
            bersih();
            clearListView();
        }

        private void bersih()
        {
            cbjenis.Items.Clear();
            cbjenis.Items.Add("Makanan");
            cbjenis.Items.Add("Minuman");
            cbpilihan.DataSource = null;
            txtdeskripsi.Enabled = false;
            txtdeskripsi.Clear();
            txtharga.Enabled = false;
            txtharga.Clear();
            btnTambah.Enabled = false;
            btnBayar.Enabled = false;
            nrcjumlah.Value = 1;
            nrcjumlah.Minimum = 1;
            lblTotalBayar.Text = "0";
            lblTotalItem.Text = "0";
        }

        private void clearListView()
        {
            lvPesanan.Clear();
            lvPesanan.Columns.Add("No", 30, HorizontalAlignment.Center);
            lvPesanan.Columns.Add("Nama", 117, HorizontalAlignment.Center);
            lvPesanan.Columns.Add("Jenis", 60, HorizontalAlignment.Center);
            lvPesanan.Columns.Add("Jumlah", 90, HorizontalAlignment.Center);
            lvPesanan.Columns.Add("Harga", 110, HorizontalAlignment.Center);
            lvPesanan.Columns.Add("Sub Total", 125, HorizontalAlignment.Center);
            lvPesanan.View = View.Details;
            lvPesanan.GridLines = true;
            lvPesanan.FullRowSelect = true;
        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            FrmLogin login = new FrmLogin();
            login.Show();
            this.Hide();
        }

        private void btnBayar_Click(object sender, EventArgs e)
        {
            
            FrmPembayaran bayar = new FrmPembayaran(Convert.ToInt64(lblTotalBayar.Text.Replace(".","")),Convert.ToInt32(lblTotalItem.Text));
            bayar.Show();
            this.Hide();
        }

        private void cbjenis_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbpilihan.Items.Clear();
            if (cbjenis.SelectedItem.ToString().Equals("Makanan"))
            {
                string query = "SELECT nama_menu FROM tb_menu WHERE status = '1'";
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataAdapter = new MySqlDataAdapter();
                koneksi.dataAdapter.SelectCommand = koneksi.cmd;
                koneksi.dataSet = new DataSet();
                koneksi.dataAdapter.Fill(koneksi.dataSet, "datamenu");
                for (int i = 0; i < koneksi.dataSet.Tables["datamenu"].Rows.Count; i++)
                {
                    cbpilihan.Items.Add(koneksi.dataSet.Tables["datamenu"].Rows[i].ItemArray[0].ToString());
                }
                cbpilihan.SelectedIndex = 0;
                txtdeskripsi.Clear();
                txtharga.Clear();
                nrcjumlah.Value = 1;
                nrcjumlah.Minimum = 1;
            }
            else if (cbjenis.SelectedItem.ToString().Equals("Minuman"))
            {
               string query = "SELECT nama_menu FROM tb_menu WHERE status = '0'";
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataAdapter = new MySqlDataAdapter();
                koneksi.dataAdapter.SelectCommand = koneksi.cmd;
                koneksi.dataSet = new DataSet();
                koneksi.dataAdapter.Fill(koneksi.dataSet, "datamenuu");
                for (int i = 0; i < koneksi.dataSet.Tables["datamenuu"].Rows.Count; i++)
                {
                    cbpilihan.Items.Add(koneksi.dataSet.Tables["datamenuu"].Rows[i].ItemArray[0].ToString());
                }
                cbpilihan.SelectedIndex = 0;
                txtdeskripsi.Clear();
                txtharga.Clear();
                nrcjumlah.Value = 1;
                nrcjumlah.Minimum = 1;
            }
        }



        private void btnTambah_Click(object sender, EventArgs e)
        {
            btnBayar.Enabled = true;
            bool isFounded = false;
            int position = -1;

            for (int i = 0; i < lvPesanan.Items.Count; i++)
            {
                if (cbpilihan.SelectedItem.Equals(lvPesanan.Items[i].SubItems[1].Text))
                {
                    isFounded = true;
                    position = i;
                    break;
                }
            }

            if (isFounded)
            {
                lvPesanan.Items[position].SubItems[3].Text = (Convert.ToInt64(lvPesanan.Items[position].SubItems[3].Text) + Convert.ToInt64(nrcjumlah.Value)).ToString();
                long subTotal = Convert.ToInt64(lvPesanan.Items[position].SubItems[3].Text) * Convert.ToInt64(lvPesanan.Items[position].SubItems[4].Text.Replace(".", ""));
                lvPesanan.Items[position].SubItems[5].Text = subTotal.ToString("#,##0");
            }
            else
            {
                ListViewItem item = new ListViewItem((lvPesanan.Items.Count + 1).ToString());
                item.SubItems.Add(cbpilihan.Text);
                item.SubItems.Add(cbjenis.SelectedItem.ToString());
                item.SubItems.Add(nrcjumlah.Value.ToString());
                item.SubItems.Add(txtharga.Text);
                long subtotal = Convert.ToInt64(txtharga.Text.Replace(".", "")) * Convert.ToInt64(nrcjumlah.Value.ToString());
                item.SubItems.Add(subtotal.ToString("#,##0"));
                lvPesanan.Items.Add(item);
            }

            long total = 0;
            long items = 0;
            for (int i = 0; i < lvPesanan.Items.Count; i++)
            {
                total = total + Convert.ToInt64(lvPesanan.Items[i].SubItems[5].Text.Replace(".", ""));
                items = items + Convert.ToInt64(lvPesanan.Items[i].SubItems[3].Text.Replace(".", ""));
            }
            lblTotalItem.Text = items.ToString("#,##0");
            lblTotalBayar.Text = total.ToString("#,##0");
        }

        private void btnBatal_Click(object sender, EventArgs e)
        {
            bersih();
            clearListView();
        }

        private void lvPesanan_KeyDown(object sender, KeyEventArgs e)
        {
            if (lvPesanan.Items.Count > 0)
            {
                if (e.KeyCode == Keys.Delete)
                {
                    int pos = lvPesanan.FocusedItem.Index;

                    DialogResult result = MessageBox.Show("Are you sure to delete '"
                        + lvPesanan.Items[pos].SubItems[1].Text
                        + "' ?", "Confirm?"
                        , MessageBoxButtons.YesNo
                        , MessageBoxIcon.Question
                        , MessageBoxDefaultButton.Button2);

                    if (result == DialogResult.Yes)
                    {
                        lvPesanan.Items.Remove(lvPesanan.FocusedItem);

                        for (int i = pos; i < lvPesanan.Items.Count; i++)
                        {
                            lvPesanan.Items[i].SubItems[0].Text = (i + 1).ToString();
                        }

                        long total = 0;
                        long items = 0;
                        for (int i = 0; i < lvPesanan.Items.Count; i++)
                        {
                            total = total + Convert.ToInt64(lvPesanan.Items[i].SubItems[5].Text.Replace(".", ""));
                            items = items + Convert.ToInt64(lvPesanan.Items[i].SubItems[3].Text.Replace(".", ""));
                        }
                        lblTotalItem.Text = items.ToString("#,##0");
                        lblTotalBayar.Text = total.ToString("#,##0");
                    }
                }
            }
        }

      

        private void cbpilihan_SelectedValueChanged(object sender, EventArgs e)
        {
            btnTambah.Enabled = true;
            if (koneksi.openConnection())
            {
                string query = String.Concat("SELECT harga,deskripsi FROM tb_menu WHERE nama_menu='", cbpilihan.Text, "'");
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataReader = koneksi.cmd.ExecuteReader();
                if (koneksi.dataReader.Read())
                {
                    txtharga.Text = koneksi.dataReader["harga"].ToString();
                    txtdeskripsi.Text = koneksi.dataReader["deskripsi"].ToString();
                }
            }
            koneksi.closeConnection();

            //txtdeskripsi.Text = "deskripsi";
            //txtdeskripsi.DataSource = koneksi.dataSet.Tables["datamenu"];


            //txtharga.Text = harga.ToString("#,##0");
            //txtdeskripsi.Text = desk;

        }

        private void btnLogOut_Click(object sender, EventArgs e)
        {
            FrmLogin login = new FrmLogin();
            login.Show();
            this.Hide();
        }
    }
}
