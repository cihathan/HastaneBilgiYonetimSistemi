﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
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
        int doktor_id;

        public Sekreter_paneli()
        {
            InitializeComponent();
        }
        public void Hastatcden_id()
        {
            bgl.bagla();
            SqlCommand sorgulama = new SqlCommand($"select * from tbl_Hasta where Tc={maskedTextBox1.Text}", bgl.bagla());
            SqlDataReader oku = sorgulama.ExecuteReader();
            if (oku.Read())
            {
                hasta_id = int.Parse(oku[0].ToString());
            }
            bgl.bagla().Close();
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
                        maskedTextBox3.Text = oku[5].ToString();
                        maskedTextBox2.Text = oku[6].ToString();
                        comboBox4.Text = oku[7].ToString();
                        hasta_id = int.Parse(oku[0].ToString());

                        panel1.Visible = true;

                    }
                    else
                    {


                    }
                    bgl.bagla().Close();
                }
                else
                    MessageBox.Show("Önce Hasta TC'si giriniz.");

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }


        }

        

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                bgl.bagla();
                SqlCommand sorgulama = new SqlCommand($"select * from tbl_Hasta where Tc={maskedTextBox1.Text}", bgl.bagla());
                sorgulama.Parameters.AddWithValue("@tc", maskedTextBox1.Text);
                SqlDataReader oku = sorgulama.ExecuteReader();              
                if (oku.Read()==false)
                {

                    SqlCommand kaydet = new SqlCommand($"insert into tbl_Hasta (Ad,Soyad,Cinsiyet,Tc,Doğum_Tarihi,Telefon,Ssk_Durum) Values ('{textBox2.Text}','{textBox4.Text}','{comboBox1.Text}','{maskedTextBox1.Text}','{maskedTextBox3.Text}','{maskedTextBox2.Text}','{comboBox4.Text}')", bgl.bagla());

                    int eklendı = kaydet.ExecuteNonQuery();
                    if (eklendı > 0)
                    {
                        MessageBox.Show("Hasta Eklendi");
                        panel1.Visible = true;

                    }

                }
                else
                {
                    MessageBox.Show("Bu Tc kayıtlıdır Güncelleme yapabilirsiniz");
                    textBox2.Text = oku[1].ToString();
                    textBox4.Text = oku[2].ToString();
                    comboBox1.Text = oku[3].ToString();
                    maskedTextBox3.Text = oku[5].ToString();
                    maskedTextBox2.Text = oku[6].ToString();
                    comboBox4.Text = oku[7].ToString();
                    hasta_id = int.Parse(oku[0].ToString());
                    panel1.Visible = true;

                }
                bgl.bagla().Close();
                Hastatcden_id();
            }
            catch (Exception ex)
            {

               MessageBox.Show(ex.Message.ToString());
            }


        }

        private void button4_Click(object sender, EventArgs e)
        {
            //update tbl_Hasta set Ad='asa',Soyad='asd' where Tc=26056519915
            SqlCommand kaydet = new SqlCommand($"update tbl_Hasta set Ad='{textBox2.Text}',Soyad='{textBox4.Text}',Cinsiyet='{comboBox1.Text}',Doğum_Tarihi='{maskedTextBox3.Text}',Telefon='{maskedTextBox2.Text}',Ssk_Durum='{comboBox4.Text}' where Tc='{maskedTextBox1.Text}'", bgl.bagla());

            int eklendı = kaydet.ExecuteNonQuery();
            if (eklendı > 0)
            {
                MessageBox.Show("Güncellendi");
                panel1.Visible = true;
                Hastatcden_id();
            }

        }

        private void comboBox2_TextChanged(object sender, EventArgs e)
        {

            comboBox3.Items.Clear();
            comboBox3.Text = "";
           SqlCommand komut = new SqlCommand($"select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel where P_Görev = '{comboBox2.SelectedItem}'", bgl.bagla());
          
            SqlDataReader dataReader;

            bgl.bagla();
            dataReader = komut.ExecuteReader();
            while (dataReader.Read())
            {
                comboBox3.Items.Add(dataReader["Ad Soyad"]);
            }
            bgl.bagla().Close();
        }

        private void comboBox3_TextChanged(object sender, EventArgs e)
        {
            bgl.bagla();
            SqlCommand sorgulama = new SqlCommand($"select * from tbl_Personel where (P_Ad+' '+P_Soyad) = '{comboBox3.SelectedItem}'", bgl.bagla());
            SqlDataReader oku = sorgulama.ExecuteReader();
            if (oku.Read())
            {
                doktor_id = int.Parse(oku[0].ToString());
            }
            bgl.bagla().Close();
        }
      
        private void maskedTextBox4_TextChanged(object sender, EventArgs e)
        {
            comboBox5.Items.Clear();
            comboBox5.Items.Add("08:00");
            comboBox5.Items.Add("09:00");
            comboBox5.Items.Add("10:00");
            comboBox5.Items.Add("11:00");
            comboBox5.Items.Add("13:00");
            comboBox5.Items.Add("14:00");
            comboBox5.Items.Add("15:00");
            comboBox5.Items.Add("16:00");
            SqlCommand sqlCommand1 = new SqlCommand($"select R_Saat from tbl_Randevular  where Doktor_id ={doktor_id} and  R_Gun='{maskedTextBox4.Text}'", bgl.bagla());
            SqlDataReader rd;
            bgl.bagla();
            rd = sqlCommand1.ExecuteReader();
            while (rd.Read())
            {
                comboBox5.Items.Remove(rd["R_Saat"]);
            }
            bgl.bagla().Close();
        }

        private void maskedTextBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                
                    if (maskedTextBox1.Text.Length>=11)
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
                            maskedTextBox3.Text = oku[5].ToString();
                            maskedTextBox2.Text = oku[6].ToString();
                            comboBox4.Text = oku[7].ToString();
                            hasta_id = int.Parse(oku[0].ToString());

                            panel1.Visible = true;

                        }
                        else
                        {

                        MessageBox.Show("Kayıtlarda hasta bulunamadı");

                    }
                    bgl.bagla().Close();
                    }
                   

                
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }

       
    }
}
