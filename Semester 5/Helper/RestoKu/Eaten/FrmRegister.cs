using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace RestoKu
{
    public partial class FrmRegister : Form
    {
        private Connection koneksi = new Connection();

        public FrmRegister()
        {
            InitializeComponent();
        }

        private void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnKembali_Click(object sender, EventArgs e)
        {
            FrmLogin login = new FrmLogin();
            login.Show();
            this.Hide();
        }

        private void btnregister_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text.Length == 0 || txtPassword.Text.Length == 0)
            {
                MessageBox.Show("Silahkan Isi Username / Password !", "Perhatian", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (koneksi.openConnection())
            {
                //string query = String.Concat("INSERT INTO tb_user(username,password) VALUES('",txtUsername.Text,"',sha1('",txtPassword.Text,"')'");
                string query = String.Concat("INSERT INTO tb_user(username, password, status, nama) VALUES ('", txtUsername.Text, "', sha1('", txtPassword.Text, "'), '0', 'default_nama')");

                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.cmd.ExecuteNonQuery();
                koneksi.closeConnection();

                MessageBox.Show("Register Berhasil !");
                FrmLogin login = new FrmLogin();
                login.Show();
                this.Hide();

            }
        }
    }
}
