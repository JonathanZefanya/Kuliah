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
    public partial class Pengguna : Form
    {
        private Connection koneksi = new Connection();
        public Pengguna()
        {
            InitializeComponent();
        }

        private void lblMenu_Click(object sender, EventArgs e)
        {
            Menu menu = new Menu();
            this.Hide();
            menu.Show();
        }

        private void btnTambah_Click(object sender, EventArgs e)
        {
            if (koneksi.openConnection())
            {
                string query = String.Concat("INSERT INTO tb_user(username,password,status) VALUES ('", txtUsername.Text, "',sha1('", txtPassword.Text, "'),'1')");
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.cmd.ExecuteNonQuery();
                koneksi.closeConnection();

                MessageBox.Show("Register Berhasil !");

            }

            txtUsername.Enabled = true;
            txtPassword.Enabled = true;
            btnTambah.Enabled = true;

            txtUsername.Focus();
        }
        private void bersih()
        {
            txtUsername.Enabled = false;
            btnHapus.Enabled = false;
            txtUsername.Clear();
            txtPassword.Clear();
            tampilData();
        }
        private void tampilData()
        {
            if(koneksi.openConnection())
            {
                string query = "SELECT username,password,status FROM tb_user";
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataAdapter = new MySqlDataAdapter();
                koneksi.dataAdapter.SelectCommand = koneksi.cmd;
                koneksi.dataSet = new DataSet();
                koneksi.dataAdapter.Fill(koneksi.dataSet, "datauser");
                int row = koneksi.dataSet.Tables["datauser"].Rows.Count;
                dgvPengguna.Rows.Clear();
                for(int i = 0; i < row; i++)
                {
                    dgvPengguna.Rows.Add();
                    dgvPengguna.Rows[i].Cells[0].Value = i + 1;
                    dgvPengguna.Rows[i].Cells[1].Value = koneksi.dataSet.Tables["datauser"].Rows[i].ItemArray[0];
                    dgvPengguna.Rows[i].Cells[2].Value = koneksi.dataSet.Tables["datauser"].Rows[i].ItemArray[1];
                    dgvPengguna.Rows[i].Cells[3].Value = koneksi.dataSet.Tables["datauser"].Rows[i].ItemArray[2];
                }
                dgvPengguna.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
                dgvPengguna.AllowUserToAddRows = false;
                koneksi.closeConnection();
            }
        }

        private void Pengguna_Load(object sender, EventArgs e)
        {
            bersih();
            dgvPengguna.Columns[0].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            dgvPengguna.Columns[0].DefaultCellStyle.Padding = new Padding(0, 0, 5, 0);

            dgvPengguna.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvPengguna.Columns[1].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);

            dgvPengguna.Columns[2].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvPengguna.Columns[2].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);

            dgvPengguna.Columns[3].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleLeft;
            dgvPengguna.Columns[3].DefaultCellStyle.Padding = new Padding(4, 0, 0, 0);
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (koneksi.openConnection())
            {
                bool updatePassword = false;
                string query = String.Concat("SELECT password FROM tb_user WHERE username = '", txtUsername.Text, "' AND (password = '", txtPassword.Text, "' OR password = sha1('", txtPassword.Text, "'))");
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataReader = koneksi.cmd.ExecuteReader();

                if (!koneksi.dataReader.Read())
                {
                    updatePassword = true;
                }

                koneksi.dataReader.Close();

                if (updatePassword)
                {
                    query = String.Concat("UPDATE tb_user SET password = sha1('", txtPassword.Text, "') WHERE username ='",txtUsername.Text,"'");
                }

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
            if (txtUsername.Text.Length == 0)
            {
                return;
            }

            DialogResult dialogResult = MessageBox.Show("Yakin ingin hapus data '" + txtUsername.Text + "' ?"
                                        , "Hapus?"
                                        , MessageBoxButtons.YesNo
                                        , MessageBoxIcon.Question
                                        , MessageBoxDefaultButton.Button2);

            if (dialogResult == DialogResult.Yes)
            {
                if (koneksi.openConnection())
                {
                    string query = String.Concat("DELETE FROM tb_user WHERE username = '", txtUsername.Text, "'");
                    koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                    koneksi.cmd.ExecuteNonQuery();

                    koneksi.closeConnection();
                    MessageBox.Show("Delete Data Success!");
                    bersih();
                }
            }
        }

        private void dgvPengguna_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            if (e.RowIndex >= 0)
            {
                dgvPengguna.Rows[e.RowIndex].ReadOnly = true;
                txtUsername.Text = dgvPengguna.Rows[e.RowIndex].Cells["username"].Value.ToString();
                txtPassword.Text = dgvPengguna.Rows[e.RowIndex].Cells["password"].Value.ToString();

                btnHapus.Enabled = true;
                txtUsername.Focus();
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
