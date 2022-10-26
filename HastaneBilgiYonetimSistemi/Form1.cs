using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HastaneBilgiYonetimSistemi
{
    public partial class Giris_Ekranı : Form
    {
        public Giris_Ekranı()
        {
            InitializeComponent();
        }
        SqlConnection hastane = new SqlConnection("Data Source=DESKTOP-QJ144O6\\SQLEXPRESS; Initial Catalog=MCI_Hospital;Integrated Security=True");

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void button1_Click(object sender, EventArgs e)
        {
            int sifre = int.Parse(textBox2.Text);
            int id = int.Parse(textBox1.Text);
         
            SqlCommand command0 = new SqlCommand();

            command0.CommandText = String.Format($"select*from tbl_Personel where sifre like '%{sifre}%' and Personel_id like '%{id}%'");
            command0.Connection = hastane;
            hastane.Open();
            int sonuc = command0.ExecuteNonQuery();
            hastane.Close();
            if (sonuc > 0)
            {
                MessageBox.Show("var");
           
            }
            else
            {
                MessageBox.Show("yok");
            }
            //hastane.Close();
        }
    }
}
