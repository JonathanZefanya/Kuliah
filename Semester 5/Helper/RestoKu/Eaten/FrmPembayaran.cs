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
    public partial class FrmPembayaran : Form
    {
        private Connection koneksi = new Connection();

        private long total_harga = 0;
        private int total_item = 0;
        public FrmPembayaran()
        {
            InitializeComponent();
        }
        public FrmPembayaran(long total_harga,int total_item)
        {
            InitializeComponent();
            this.total_harga = total_harga;
            this.total_item = total_item;
        }

        private void FrmPembayaran_Load(object sender, EventArgs e)
        {
            txtTotal.Text = total_harga.ToString();
            txtTotal.Enabled = false;
            btnBayar.Enabled = false;
        }

        private void btnkembali_Click(object sender, EventArgs e)
        {
         FrmMenuUtama utama = new FrmMenuUtama();
         utama.Show();
         this.Hide();
        }

        private void btnBayar_Click(object sender, EventArgs e)
        {
            String total = txtTotal.Text;
            String bayar = txtJumlah.Text;
            int kembalian = Convert.ToInt32(bayar) - Convert.ToInt32(total);
            if (Convert.ToInt32(bayar) > Convert.ToInt32(total))
            {
                if (koneksi.openConnection())
                {
                    string query = String.Concat("INSERT INTO tb_pesanan(total_bayar,total_dibayar,kembalian,total_item,status) VALUES ('", total, "','",bayar,"','",kembalian,"','" ,total_item, "','1')");
                    koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                    koneksi.cmd.ExecuteNonQuery();
                    koneksi.closeConnection();

                    DialogResult result = MessageBox.Show("Terima kasih sudah memesan, berikut kembalian'"
                      + kembalian.ToString()
                      + "' .", "Pengumuman"
                      , MessageBoxButtons.OK
                      , MessageBoxIcon.Information
                      , MessageBoxDefaultButton.Button1);
                    if (result == DialogResult.OK)
                    {
                        FrmMenuUtama utama = new FrmMenuUtama();
                        utama.Show();
                        this.Hide();
                    }
                }
              
            }
            else if (Convert.ToInt32(bayar) == Convert.ToInt32(total))
            {
                if (koneksi.openConnection())
                {
                    string query = String.Concat("INSERT INTO tb_pesanan(total_bayar,total_dibayar,total_item,status) VALUES ('", total, "','",bayar,"','" ,total_item, "','1')");
                    koneksi.cmd = new MySqlCommand(query, koneksi.connection);
                    koneksi.cmd.ExecuteNonQuery();
                    koneksi.closeConnection();

                    DialogResult hasil = MessageBox.Show("Terima kasih sudah memesan'"
                        + "' .", "Pengumuman"
                        , MessageBoxButtons.OK
                        , MessageBoxIcon.Information
                        , MessageBoxDefaultButton.Button1);
                    if (hasil == DialogResult.OK)
                    {
                        FrmMenuUtama utama = new FrmMenuUtama();
                        utama.Show();
                        this.Hide();
                    }
                }
                    
            }
            else
            {
                DialogResult result = MessageBox.Show("Maaf uang anda tidak mencukupi, silahkan coba lagi '"
                   + "' .", "Pengumuman"
                   , MessageBoxButtons.OK
                   , MessageBoxIcon.Information
                   , MessageBoxDefaultButton.Button1);
            }
        }

        private void txtJumlah_TextChanged(object sender, EventArgs e)
        {
            if(txtJumlah.Text.Trim().Length > 0)
            {
                btnBayar.Enabled = true;
            }
            else
            {
                btnBayar.Enabled = false;
            }
        }

        private void txtJumlah_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
    }
}
