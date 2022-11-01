using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace HastaneBilgiYonetimSistemi
{
    public partial class Yonetici_paneli : Form
    {
        public Yonetici_paneli()
        {
            InitializeComponent();
        }
        baglantı bgl = new baglantı();
        int yetki;
        public int kul_id1;
        int personelid;
        int silid;
        public string sifre = "--";

        private void maskedTextBox1_TextChanged(object sender, EventArgs e)
        {
            try
            {
                if (maskedTextBox1.Text.Length >= 11)
                {


                    bgl.bagla();
                    SqlCommand sorgulama = new SqlCommand($"select * from tbl_Personel where P_Tc={maskedTextBox1.Text}", bgl.bagla());
                    SqlDataReader oku = sorgulama.ExecuteReader();
                    if (oku.Read())
                    {
                        personelid = oku.GetInt32(0);
                        textBox2.Text = oku[1].ToString();//AD
                        textBox3.Text = oku[2].ToString();
                        maskedTextBox2.Text = oku[3].ToString();//dt
                        comboBox2.Text = oku[5].ToString();
                        yetki = int.Parse(oku[6].ToString());
                        maskedTextBox3.Text = oku[7].ToString();
                        textBox4.Text = oku[8].ToString();//adres
                        textBox5.Text = oku[9].ToString();//Sifre
                        btn_Personel_Ekle.Enabled = false;
                        switch (yetki)
                        {
                            case 1: comboBox3.SelectedIndex = 1; break;
                            default:
                                break;
                        }



                        //  panel1.Visible = true;

                    }
                }
                else if (maskedTextBox1.Text.Length < 11)
                {
                    textBox2.Clear();
                    textBox3.Clear();
                    comboBox2.Text = "";
                    maskedTextBox2.Clear();
                    maskedTextBox3.Clear();
                    textBox5.Clear();
                    textBox4.Clear();
                    btn_Personel_Ekle.Enabled = true;
                    //****************************cb3 silinmeme

                    //comboBox4.Text = "";

                }
                bgl.bagla().Close();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void yonetici_paneli_Load(object sender, EventArgs e)
        {
            panel_personel.Visible = false;
            panel2.Visible = false;
            SqlCommand komut = new SqlCommand($"select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel where Personel_id={kul_id1}", bgl.bagla());
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            da.Fill(dt);
            SqlDataReader oku = komut.ExecuteReader();
            {
                if (oku.Read())
                {
                    label13.Text = (oku["Ad Soyad"]).ToString();

                }
            }
            bgl.bagla().Close();
        }

        private void button7_Click(object sender, EventArgs e) //Silme
        {
            //try
            //{//
            //    SqlCommand komut = new SqlCommand($"select * from tbl_Maas where Personel_id='{personelid}'", bgl.bagla());

            //    SqlDataReader oku = komut.ExecuteReader();

            //        if (oku.Read())
            //        {
            //            silid = int.Parse((oku[0]).ToString());

            //        }

            //    bgl.bagla().Close();

            //    SqlCommand sil1 = new SqlCommand($"delete from tbl_Maas where Maas_id={silid}", bgl.bagla());
            //    bgl.bagla().Close();
            //    SqlCommand sil = new SqlCommand($"delete from tbl_Personel where Personel_id='{personelid}'", bgl.bagla());
            //    int ok = sil.ExecuteNonQuery();
            //    int ok2 = sil1.ExecuteNonQuery();
            //    if (ok > 0 && ok2 > 0)
            //    {
            //        MessageBox.Show("Personel Silindi");
            //        textBox2.Clear();
            //        textBox3.Clear();
            //        comboBox2.Text = "";
            //        maskedTextBox2.Clear();
            //        maskedTextBox3.Clear();
            //        textBox5.Clear();
            //        textBox4.Clear();
            //        btn_Personel_Ekle.Enabled = true;
            //        maskedTextBox1.Clear();
            //    }
            //    else
            //    {
            //        MessageBox.Show("Personel Silinemedi");
            //    }
            //    bgl.bagla().Close();
            //}
            //catch (Exception ex)
            //{

            //    MessageBox.Show(ex.Message);
            //}

        }

        private void btn_Personel_Ekle_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBox5.Visible)
                {
                    sifre = textBox5.Text;
                }
                if (maskedTextBox1.Text.Length == 11 && textBox2.Text.Trim() != String.Empty && textBox3.Text.Trim() != String.Empty && maskedTextBox2.Text.Length == 10 && comboBox3.Text != String.Empty && comboBox2.Text != String.Empty && maskedTextBox3.Text.Length == 14 && textBox4.Text.Trim() != String.Empty && textBox5.Text.Trim() != String.Empty)
                {


                    SqlCommand prsnlEkle = new SqlCommand($"insert into tbl_Personel(P_Ad,P_Soyad,P_Dogum_Tarihi,P_TC,P_Görev,Yetki,P_Telefon,P_Adres,sifre) values('{textBox2.Text}','{textBox3.Text}','{maskedTextBox2.Text}','{maskedTextBox1.Text}','{comboBox2.Text}',{yetki},'{maskedTextBox3.Text}','{textBox4.Text}','{sifre}')", bgl.bagla());
                    int eklendi = prsnlEkle.ExecuteNonQuery();
                    if (eklendi > 0)
                    {
                        MessageBox.Show("Personel Eklendi");
                    }
                    else
                    {
                        MessageBox.Show("Personel Kayıtlı");
                    }
                    bgl.bagla().Close();


                }
                else
                {
                    MessageBox.Show("Alanlar Boş veya Eksik Geçilemez");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }




        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            comboBox1.Items.Clear();
            maskedTextBox4.Clear();
            panel_personel.Visible = false;
            panel2.Visible = true;




            bgl.bagla();
            SqlCommand sorgulama = new SqlCommand($"select P_Ad+' '+P_Soyad as 'Ad Soyad' from tbl_Personel p", bgl.bagla());
            SqlDataReader dataReader;

            dataReader = sorgulama.ExecuteReader();
            while (dataReader.Read())
            {
                comboBox1.Items.Add(dataReader["Ad Soyad"]);
            }


            bgl.bagla().Close();


        }



        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                bgl.bagla();
                SqlCommand maasEkle = new SqlCommand($"insert into tbl_Maas (Maas,Personel_id) values('{float.Parse(maskedTextBox4.Text)}','{personelid}')", bgl.bagla());

                int maas = maasEkle.ExecuteNonQuery();
                if (maas > 0)
                {
                    MessageBox.Show("Eklendi");
                }
                bgl.bagla().Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Böyle bir Personel Yoktur.");

            }
            comboBox1.Items.Clear();
            maskedTextBox4.Clear();
        }

        private void comboBox1_TextChanged(object sender, EventArgs e)
        {
            string persongorev = "";

            bgl.bagla();
            SqlCommand sorgulama = new SqlCommand($"select * from tbl_Personel where (P_Ad+' '+P_Soyad) = '{comboBox1.SelectedItem}'", bgl.bagla());
            SqlDataReader oku = sorgulama.ExecuteReader();
            if (oku.Read())
            {
                personelid = int.Parse(oku[0].ToString());
                persongorev = oku[5].ToString();
            }

            bgl.bagla().Close();
            oku.Close();

            SqlCommand sorgu2 = new SqlCommand($"select*from tbl_Maas where Personel_id={personelid}", bgl.bagla());
            SqlDataReader okuid = sorgu2.ExecuteReader();
            if (okuid.Read())
            {
                maskedTextBox4.Text = okuid[2].ToString();
                label12.Text = persongorev.ToString();
                button4.Enabled = false;

            }
            else
            {
                maskedTextBox4.Text = "";
                button4.Enabled = true;
            }
            bgl.bagla().Close();
            //select*from tbl_Maas where Personel_id=21

        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand sqlCommand = new SqlCommand($"update tbl_Maas set  Maas={maskedTextBox4.Text} where Personel_id={personelid}", bgl.bagla());
                int gnclmaas = sqlCommand.ExecuteNonQuery();
                if (gnclmaas > 0)
                {
                    MessageBox.Show("Maaş Güncellendi.");
                }
                bgl.bagla().Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            maskedTextBox4.Clear();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel2.Visible = false;
            panel_personel.Visible = true;
        }

        private void comboBox3_Click(object sender, EventArgs e)
        {
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (comboBox3.SelectedIndex)
            {
                case 0: yetki = 4; break;
                case 1: yetki = 1; break;
                case 2: yetki = 2; break;
                case 3: yetki = 3; break;
                case 4: yetki = 0; break;
                case 5: yetki = 5; break;
                default: yetki = 1; break;
            }
            if (comboBox3.SelectedIndex <= 3)
            {
                label10.Visible = true;
                textBox5.Visible = true;
            }
            else
            {
                label10.Visible = false;
                textBox5.Visible = false;
            }
        }

        private void comboBox2_Click(object sender, EventArgs e)
        {
            comboBox2.Items.Clear();
            SqlCommand bolum = new SqlCommand($"select DISTINCT P_Görev from tbl_Personel where Yetki={yetki}", bgl.bagla());
            SqlDataReader dataReader;
            bgl.bagla();
            dataReader = bolum.ExecuteReader();
            while (dataReader.Read())
            {
                comboBox2.Items.Add(dataReader["P_Görev"]);
            }
            bgl.bagla().Close();
        }
    }
}
