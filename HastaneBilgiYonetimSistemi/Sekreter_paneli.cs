using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace HastaneBilgiYonetimSistemi
{
    public partial class Sekreter_paneli : Form
    {
        public int Kul_id;
        public Sekreter_paneli()
        {
            InitializeComponent();
        }
        baglantı bgl = new baglantı();
        int hasta_id;
        private void button1_Click(object sender, EventArgs e)
        {
            //Tcye göre hasta kontrol edıldı yoksa eklenmesı ıstendı

            try
            {
                if (maskedTextBox1.Text != "")
                {
                  

                    bgl.bagla();
                    SqlCommand sorgulama = new SqlCommand($"select * from tbl_Hasta where Tc={maskedTextBox1.Text}", bgl.bagla());
                    sorgulama.Parameters.AddWithValue("@tc", maskedTextBox1.Text);
                    SqlDataReader oku = sorgulama.ExecuteReader();
                    if (oku.Read())
                    {

                        textBox2.Text = oku[1].ToString();
                        textBox4.Text = oku[2].ToString();
                        comboBox1.Text = oku[3].ToString();
                        maskedTextBox3.Text=oku[5].ToString();
                        maskedTextBox2.Text = oku[6].ToString();
                        textBox5.Text=oku[7].ToString();
                        hasta_id=int.Parse(oku[0].ToString());

                        button2.Visible = false;
                        panel1.Visible = true;

                    }
                    else
                    {
                        MessageBox.Show("Bu kriterde bir hasta bulunamadı. Lütfen kayıt yapınız.");
                        button2.Visible = true;

                    }
                    bgl.bagla().Close();
                }
                else
                    MessageBox.Show("Önce Hasta TC'si giriniz.");

            }
            catch
            {
                MessageBox.Show("Hata!! Daha Sonra Tekrar Deneyiniz");

            }

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
