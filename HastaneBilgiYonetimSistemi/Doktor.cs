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
            SqlCommand sqlData = new SqlCommand($"select h.Tc,h.Ad + ' ' + h.Soyad as 'Ad Soyad',h.Cinsiyet,r.R_Gun,r.R_Saat from tbl_Randevular r inner join tbl_Hasta h on r.Hasta_id=h.Hasta_id inner join tbl_Personel p on p.Personel_id=r.Doktor_id where p.Personel_id=1 and R_Gun like'%{label2.Text.ToString()}%'", bgl.bagla());
            DataTable dataTable = new DataTable();
            SqlDataAdapter sd = new SqlDataAdapter(sqlData);
            sd.Fill(dataTable);
            sqlData.ExecuteNonQuery();
            dataGridView1.DataSource = dataTable;

           bgl.bagla().Close();

        }
    }
}
