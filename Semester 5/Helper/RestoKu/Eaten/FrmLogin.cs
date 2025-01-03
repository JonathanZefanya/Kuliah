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
namespace RestoKu
{
    public partial class FrmLogin : Form
    {
        private Connection koneksi = new Connection();
        public FrmLogin()
        {
            InitializeComponent();
        }


        private void btnRegister_Click(object sender, EventArgs e)
        {
            FrmRegister regis = new FrmRegister();
            regis.Show();
            this.Hide();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if(txtUsername.Text.Length == 0 || txtPassword.Text.Length == 0)
            {
                MessageBox.Show("Silahkan Isi Username / Password !", "Perhatian", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if(koneksi.openConnection())
            {
                string query = String.Concat("SELECT * FROM tb_user where username ='", txtUsername.Text, "' AND password =sha1('", txtPassword.Text, "')");
                koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                koneksi.dataReader = koneksi.cmd.ExecuteReader();
               
                if(koneksi.dataReader.Read())
                {
                    if(koneksi.dataReader["status"].ToString().Equals("1"))
                    {
                        this.Hide();
                        DashboardAdmin dashboard = new DashboardAdmin();
                        dashboard.Show();
                    }
                    else if(koneksi.dataReader["status"].ToString().Equals("0"))
                    {
                        this.Hide();
                        FrmMenuUtama frmMenuUtama = new FrmMenuUtama();
                        frmMenuUtama.Show();
                    }
                   
                }
                else
                {
                    MessageBox.Show("Login gagal !", "Perhatian", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                koneksi.dataReader.Close();
                koneksi.closeConnection();
            }
        }

        private void FrmLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }
    }
}
