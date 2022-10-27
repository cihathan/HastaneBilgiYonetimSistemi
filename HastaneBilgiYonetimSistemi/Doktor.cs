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
            //select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel where Personel_id=1
            SqlCommand komut = new SqlCommand($"select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel where Personel_id={kul_id}", bgl.bagla());
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                MessageBox.Show("asda");
            }

        }
    }
}
