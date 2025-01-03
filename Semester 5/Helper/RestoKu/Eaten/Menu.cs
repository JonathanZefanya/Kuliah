using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RestoKu
{
    public partial class Menu : Form
    {

        private Connection koneksi = new Connection();
        public Menu()
        {
            InitializeComponent();
        }

        private void lblPengguna_Click(object sender, EventArgs e)
        {
            Pengguna pengguna = new Pengguna();
            this.Hide();
            pengguna.Show();
        }
        private void tampilData()
        {
            if (koneksi.openConnection())
            {
                string query = "SELECT * FROM tb_menu";
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataAdapter = new MySqlDataAdapter();
                koneksi.dataAdapter.SelectCommand = koneksi.cmd;
                koneksi.dataSet = new DataSet();
                koneksi.dataAdapter.Fill(koneksi.dataSet, "datamenu");

                int row = koneksi.dataSet.Tables["datamenu"].Rows.Count;
                dgvMenu.Rows.Clear();
                for (int i = 0; i < row; i++)
                {
                    dgvMenu.Rows.Add();
                    dgvMenu.Rows[i].Cells[0].Value = i + 1;
                    dgvMenu.Rows[i].Cells[1].Value = koneksi.dataSet.Tables["datamenu"].Rows[i].ItemArray[0];
                    dgvMenu.Rows[i].Cells[2].Value = koneksi.dataSet.Tables["datamenu"].Rows[i].ItemArray[1];
                    dgvMenu.Rows[i].Cells[3].Value = koneksi.dataSet.Tables["datamenu"].Rows[i].ItemArray[2];
                    dgvMenu.Rows[i].Cells[4].Value = koneksi.dataSet.Tables["datamenu"].Rows[i].ItemArray[3];
                    dgvMenu.Rows[i].Cells[5].Value = koneksi.dataSet.Tables["datamenu"].Rows[i].ItemArray[4];

                }
                dgvMenu.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
                dgvMenu.AllowUserToAddRows = false;
                koneksi.closeConnection();
            }
        }

        private void btnTambah_Click(object sender, EventArgs e)
        {
            if (txtDeskripsi.Text.Length == 0 || txtHarga.Text.Length == 0 || txtNama.Text.Length == 0)
            {
                MessageBox.Show("Silahkan Isi Username / Password !", "Perhatian", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (koneksi.openConnection())
            {
                string query = String.Concat("INSERT INTO tb_menu(nama_menu,harga,deskripsi,status) VALUES ('", txtNama.Text, "',('", txtHarga.Text, "'),('",txtDeskripsi.Text,"'),('",cbStatus.Text.Equals("Makanan") ?"1" : "0","'))");

                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.cmd.ExecuteNonQuery();
                koneksi.closeConnection();

                MessageBox.Show("Tambah Berhasil !");

            }
        }
        private void bersih()
        {
            txtId.Enabled = false;
            txtNama.Enabled = true;
            txtNama.Clear();
            txtHarga.Clear();
            txtDeskripsi.Clear();
            txtId.Clear();
            cbStatus.Items.Clear();
            cbStatus.Items.Add("Makanan");
            cbStatus.Items.Add("Minuman");
            cbStatus.SelectedIndex = 0;
            tampilData();

        }

        private void Menu_Load(object sender, EventArgs e)
        {
            bersih();
            dgvMenu.Columns[0].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            dgvMenu.Columns[0].DefaultCellStyle.Padding = new Padding(0, 0, 5, 0);

            dgvMenu.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvMenu.Columns[1].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);

            dgvMenu.Columns[2].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvMenu.Columns[2].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);

            dgvMenu.Columns[3].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvMenu.Columns[3].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);

            dgvMenu.Columns[4].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvMenu.Columns[4].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);

            dgvMenu.Columns[5].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvMenu.Columns[5].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (koneksi.openConnection())
            {
               
                   String query = String.Concat("UPDATE tb_menu SET nama_menu = '",txtNama.Text,"',harga ='",txtHarga.Text,"',deskripsi ='",txtDeskripsi.Text,"',status ='", cbStatus.Text.Equals("Makanan") ? "1" : "0", "' WHERE id ='", txtId.Text,"'");
                

                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.cmd.ExecuteNonQuery();
                koneksi.closeConnection();

                MessageBox.Show("Update Data Sukses!");
                bersih();
            }
        }



        private void btnRefresh_Click(object sender, EventArgs e)
        {
            bersih();
        }

        private void btnHapus_Click(object sender, EventArgs e)
        {
            if (txtId.Text.Length == 0)
            {
                return;
            }

            DialogResult dialogResult = MessageBox.Show("Yakin ingin hapus data '" + txtId.Text + "' ?"
                                        , "Hapus?"
                                        , MessageBoxButtons.YesNo
                                        , MessageBoxIcon.Question
                                        , MessageBoxDefaultButton.Button2);

            if (dialogResult == DialogResult.Yes)
            {
                if (koneksi.openConnection())
                {
                    string query = String.Concat("DELETE FROM tb_menu WHERE id = '", txtId.Text, "'");
                    koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                    koneksi.cmd.ExecuteNonQuery();

                    koneksi.closeConnection();
                    MessageBox.Show("Delete Data Success!");
                    bersih();
                }
            }
        }

        private void dgvMenu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                dgvMenu.Rows[e.RowIndex].ReadOnly = true;
                txtId.Text = dgvMenu.Rows[e.RowIndex].Cells["id"].Value.ToString();
                txtNama.Text = dgvMenu.Rows[e.RowIndex].Cells["nama_menu"].Value.ToString();
                txtHarga.Text = dgvMenu.Rows[e.RowIndex].Cells["harga"].Value.ToString();
                txtDeskripsi.Text = dgvMenu.Rows[e.RowIndex].Cells["deskripsi"].Value.ToString();
                cbStatus.SelectedIndex = Convert.ToInt32(dgvMenu.Rows[e.RowIndex].Cells["status"].Value.ToString())-1 ;
            
            }
        }

        private void btnLogOut_Click(object sender, EventArgs e)
        {
            FrmLogin login = new FrmLogin();
            login.Show();
            this.Hide();
        }
    }
}
