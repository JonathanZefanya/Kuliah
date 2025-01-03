namespace Eaten
{
    partial class FrmPembayaran
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.txtTotal = new System.Windows.Forms.TextBox();
            this.txtJumlah = new System.Windows.Forms.TextBox();
            this.btnBayar = new System.Windows.Forms.Button();
            this.btnkembali = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(51, 61);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(70, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Total Bayar : ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(51, 103);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(114, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Jumlah yang Dibayar : ";
            // 
            // txtTotal
            // 
            this.txtTotal.Location = new System.Drawing.Point(173, 58);
            this.txtTotal.Multiline = true;
            this.txtTotal.Name = "txtTotal";
            this.txtTotal.Size = new System.Drawing.Size(244, 27);
            this.txtTotal.TabIndex = 0;
            // 
            // txtJumlah
            // 
            this.txtJumlah.Location = new System.Drawing.Point(173, 100);
            this.txtJumlah.Multiline = true;
            this.txtJumlah.Name = "txtJumlah";
            this.txtJumlah.Size = new System.Drawing.Size(244, 27);
            this.txtJumlah.TabIndex = 1;
            this.txtJumlah.TextChanged += new System.EventHandler(this.txtJumlah_TextChanged);
            this.txtJumlah.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtJumlah_KeyPress);
            // 
            // btnBayar
            // 
            this.btnBayar.BackColor = System.Drawing.Color.Lime;
            this.btnBayar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnBayar.Location = new System.Drawing.Point(54, 162);
            this.btnBayar.Name = "btnBayar";
            this.btnBayar.Size = new System.Drawing.Size(167, 47);
            this.btnBayar.TabIndex = 2;
            this.btnBayar.Text = "BAYAR";
            this.btnBayar.UseVisualStyleBackColor = false;
            this.btnBayar.Click += new System.EventHandler(this.btnBayar_Click);
            // 
            // btnkembali
            // 
            this.btnkembali.BackColor = System.Drawing.Color.Red;
            this.btnkembali.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnkembali.Location = new System.Drawing.Point(250, 162);
            this.btnkembali.Name = "btnkembali";
            this.btnkembali.Size = new System.Drawing.Size(167, 47);
            this.btnkembali.TabIndex = 3;
            this.btnkembali.Text = "KEMBALI";
            this.btnkembali.UseVisualStyleBackColor = false;
            this.btnkembali.Click += new System.EventHandler(this.btnkembali_Click);
            // 
            // FrmPembayaran
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            this.ClientSize = new System.Drawing.Size(446, 229);
            this.Controls.Add(this.btnkembali);
            this.Controls.Add(this.btnBayar);
            this.Controls.Add(this.txtJumlah);
            this.Controls.Add(this.txtTotal);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "FrmPembayaran";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Pembayaran";
            this.Load += new System.EventHandler(this.FrmPembayaran_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtTotal;
        private System.Windows.Forms.TextBox txtJumlah;
        private System.Windows.Forms.Button btnBayar;
        private System.Windows.Forms.Button btnkembali;
    }
}