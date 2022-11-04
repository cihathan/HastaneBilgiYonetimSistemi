using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace HastaneBilgiYonetimSistemi
{

    public partial class Giris_Ekrani : Form
    {
        public int id;
        public Giris_Ekrani()
        {
            InitializeComponent();
        }
        baglantı bgl = new baglantı();

        private void Form1_Load(object sender, EventArgs e)
        {


        }
        Muhasebe muhasebe = new Muhasebe();

        public void button1_Click(object sender, EventArgs e)
        {

            try
            {

                id = Convert.ToInt32(textBox1.Text);
                string sifre = textBox2.Text.Trim(); //TRim boşlukları keser 

                SqlCommand komut = new SqlCommand($"select * from tbl_Personel where sifre='{sifre}' and Personel_id='{id}'", bgl.bagla());
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(komut);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    textBox1.Clear();
                    textBox2.Clear();
                    Yonetici_paneli pnelyonetici = new Yonetici_paneli();
                    Doktor1 doktor = new Doktor1();
                    Sekreter_paneli sekreter_Paneli = new Sekreter_paneli();
                    for (int i = 1; i <= 4; i++)
                    {
                        SqlCommand komut1 = new SqlCommand($"select * from tbl_Personel where yetki={i} and Personel_id='{id}'", bgl.bagla());
                        DataTable yetki = new DataTable();
                        SqlDataAdapter yetkiad = new SqlDataAdapter(komut1);
                        yetkiad.Fill(yetki);
                        if (yetki.Rows.Count > 0)
                        {

                            switch (i)
                            {
                                case 1:

                                    doktor.kul_id = id;
                                    doktor.Visible = true;
                                    this.Hide(); break;
                                case 2:
                                    sekreter_Paneli.Kul_id = id;
                                    sekreter_Paneli.Visible = true;
                                    this.Hide(); break;
                                case 3:
                                    muhasebe.muhasebeid = id;
                                    muhasebe.Visible = true;
                                    this.Hide(); break;
                                case 4:
                                    pnelyonetici.kul_id1 = id;
                                    pnelyonetici.Visible = true;
                                    this.Hide(); break; //Yönetim giriş paneli
                                default: MessageBox.Show("Giriş Yetkniz Yoktur");
                                   
                                    break;
                            }
                        }
                    }
                }

                else
                {
                    MessageBox.Show("Hatalı Giriş");
                }
                //Giriş Yapan kullanıcının yetki numarası alınacak ona gore formlara yonlendırılecek              
                bgl.bagla().Close();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                textBox2.UseSystemPasswordChar = false;//checkbox basılı ıse sıfrelemıyor
            }
            else
            {
                textBox2.UseSystemPasswordChar = true;

            }
        }
    }

}
