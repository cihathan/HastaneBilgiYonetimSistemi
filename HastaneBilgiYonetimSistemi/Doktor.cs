using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace HastaneBilgiYonetimSistemi
{
    public partial class Doktor1 : Form 
    {
        baglantı bgl = new baglantı();
        public int kul_id;
        public Doktor1()
        {
            InitializeComponent();
        }

        public int randevuid;
        private void Doktor_Load(object sender, EventArgs e)
        {
            label2.Text = DateTime.Now.ToString("yyyy-MM-dd"); //bugunse bugunku randevular cıkması ıcın 
            //select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel where Personel_id=1
            SqlCommand komut = new SqlCommand($"select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel where Personel_id={kul_id}", bgl.bagla());
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(komut);           
            da.Fill(dt);
            SqlDataReader oku = komut.ExecuteReader();
            {
                if (oku.Read())
                {
                    label1.Text = (oku["Ad Soyad"]).ToString();
                    
                }
            }
            bgl.bagla().Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            goster();
        }
        private void goster()
        {
            SqlCommand sqlData = new SqlCommand($"select r.Randevu_id,h.Tc,h.Ad + ' ' + h.Soyad as 'Ad Soyad',h.Cinsiyet,r.Sikayet,r.R_Saat from tbl_Randevular r inner join tbl_Hasta h on r.Hasta_id=h.Hasta_id inner join tbl_Personel p on p.Personel_id=r.Doktor_id where p.Personel_id={kul_id} and R_Gun like'%{label2.Text.ToString()}%'", bgl.bagla());
            DataTable dataTable = new DataTable();
            SqlDataAdapter sd = new SqlDataAdapter(sqlData);
            sd.Fill(dataTable);
            sqlData.ExecuteNonQuery();
            dataGridView1.DataSource = dataTable;
            dataGridView1.Columns["Randevu_id"].Visible = false;

            bgl.bagla().Close();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;

        }



        private void dataGridView1_DoubleClick(object sender, EventArgs e)
        {
            randevuid = int.Parse(dataGridView1.CurrentRow.Cells["Randevu_id"].Value.ToString());

            dataGridView1.Visible = false;
            panel1.Visible = true;
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            //Reçete veya tahlil istemek için receteler tablosunu kullandık 
            // recetelere datagrıdvıevde çift tıklanan hastanın randevu ıdsı ve textboxa ırılecek deger alınıp aktarıldı
            SqlCommand command0 = new SqlCommand();

            command0.CommandText = String.Format($"insert into tbl_Receteler(Randevu_id,Acıklama) Values('{randevuid}','{textBox1.Text}')");
            command0.Connection = bgl.bagla();
            bgl.bagla();
            int eklendi = command0.ExecuteNonQuery();
            if (eklendi > 0)
            {
                MessageBox.Show("Eklendi");
             
            }
            else
            {
                MessageBox.Show("Eklenmedı");
            }
            bgl.bagla().Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            panel1.Visible = false;
            dataGridView1.Visible = true;
            SqlCommand sqlData = new SqlCommand($"select re.Randevu_id,ha.Tc,ha.Ad+ ' '+ha.Soyad as 'Ad Soyad',re.Acıklama from tbl_Receteler re inner join tbl_Randevular ra on ra.Randevu_id=re.Randevu_id inner join tbl_Hasta ha on ra.Hasta_id=ha.Hasta_id where Doktor_id={kul_id}", bgl.bagla());
            DataTable dataTable = new DataTable();
            SqlDataAdapter sd = new SqlDataAdapter(sqlData);
            sd.Fill(dataTable);
            sqlData.ExecuteNonQuery();
            dataGridView1.DataSource = dataTable;
            dataGridView1.Columns["Randevu_id"].Visible = false;

            bgl.bagla().Close();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlCommand command0 = new SqlCommand();

            command0.CommandText = String.Format($"update tbl_Receteler set Acıklama = '{textBox1.Text}' where Randevu_id={randevuid}");
            command0.Connection = bgl.bagla();
            bgl.bagla();
            int eklendi = command0.ExecuteNonQuery();
            if (eklendi > 0)
            {
                MessageBox.Show("Guncellendi");

            }
            else
            {
                MessageBox.Show("Guncellenmedi");
            }
            bgl.bagla().Close();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            SqlCommand sqlData = new SqlCommand($"select r.Randevu_id,h.Tc,h.Ad + ' ' + h.Soyad as 'Ad Soyad',h.Cinsiyet,r.Sikayet,r.R_Saat from tbl_Randevular r inner join tbl_Hasta h on r.Hasta_id=h.Hasta_id inner join tbl_Personel p on p.Personel_id=r.Doktor_id where p.Personel_id={kul_id} ", bgl.bagla());
            DataTable dataTable = new DataTable();
            SqlDataAdapter sd = new SqlDataAdapter(sqlData);
            sd.Fill(dataTable);
            sqlData.ExecuteNonQuery();
            dataGridView1.DataSource = dataTable;
            dataGridView1.Columns["Randevu_id"].Visible = false;

            bgl.bagla().Close();
        }
    }
}
