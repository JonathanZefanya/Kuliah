using System;
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

        public FrmPembayaran(long total_harga, int total_item)
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
            try
            {
                int total = Convert.ToInt32(txtTotal.Text);
                int bayar = Convert.ToInt32(txtJumlah.Text);

                if (bayar < total)
                {
                    MessageBox.Show("Maaf, uang anda tidak mencukupi.", "Pengumuman", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                int kembalian = bayar - total;

                if (koneksi.openConnection())
                {
                    string query = "INSERT INTO tb_pesanan (id_menu, status) VALUES (@id_menu, @status)";
                    MySqlCommand cmd = new MySqlCommand(query, koneksi.connection);
                    cmd.Parameters.AddWithValue("@id_menu", 1); // Ganti dengan ID Menu yang sesuai
                    cmd.Parameters.AddWithValue("@status", "1");

                    cmd.ExecuteNonQuery();
                    koneksi.closeConnection();

                    MessageBox.Show($"Terima kasih sudah memesan. Kembalian Anda: {kembalian}", "Pengumuman", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    FrmMenuUtama utama = new FrmMenuUtama();
                    utama.Show();
                    this.Hide();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Terjadi kesalahan: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtJumlah_TextChanged(object sender, EventArgs e)
        {
            btnBayar.Enabled = !string.IsNullOrEmpty(txtJumlah.Text);
        }

        private void txtJumlah_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
    }
}
