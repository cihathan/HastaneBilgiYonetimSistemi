﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
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
                    Doktor1 doktor = new Doktor1();
                    for (int i = 1; i <= 3; i++)
                    {
                        SqlCommand komut1 = new SqlCommand($"select * from tbl_Personel where yetki={i} and Personel_id='{id}'", bgl.bagla());
                        DataTable yetki = new DataTable();
                        SqlDataAdapter yetkiad = new SqlDataAdapter(komut1);
                        yetkiad.Fill(yetki);
                        if (yetki.Rows.Count > 0)
                        {
                           
                            switch (i)
                            {  
                                case 1:MessageBox.Show("Giriş Başarılı");

                                    doktor.kul_id = id;
                                    doktor.Visible = true;
                                    this.Hide();  break;
                                case 2: MessageBox.Show("Yetki 2"); break;
                                case 3: MessageBox.Show("Yetki 3"); break;
                                default:
                                    MessageBox.Show("Giriş Başarılı");
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
      


    }
  
}
