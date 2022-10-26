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
        DataGridView dataGridView1 = new DataGridView();
        private void Form1_Load(object sender, EventArgs e)
        {

            #region MyRegion
            dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new System.Drawing.Point(63, 23);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.RowHeadersWidth = 51;
            dataGridView1.RowTemplate.Height = 24;
            dataGridView1.Size = new System.Drawing.Size(240, 150);
            dataGridView1.TabIndex = 11;
            this.Controls.Add(dataGridView1);

            #endregion


        }
        private void button1_Click(object sender, EventArgs e)
        {
            #region deneme
            //int sifre = int.Parse(textBox2.Text);
            //int id = int.Parse(textBox1.Text);

            //SqlCommand command0 = new SqlCommand();

            //command0.CommandText = String.Format($"select*from tbl_Personel where sifre like '%{sifre}%' and Personel_id like '%{id}%'", hastane);


            //DataTable dataTable = new DataTable();

            //SqlDataAdapter adapter = new SqlDataAdapter($"select*from tbl_Personel where sifre like '%{sifre}%' and Personel_id like '%{id}%'", hastane);
            //adapter.Fill(dataTable);




            //command0.Connection = hastane;
            //hastane.Open();
            //int sonuc = command0.ExecuteNonQuery();
            //hastane.Close();

            ////if (dataGridView1.CurrentCell ==true)
            ////{
            ////    MessageBox.Show("var");

            ////}
            ////else
            ////{
            ////    MessageBox.Show("yok");
            ////}
            //hastane.Close();
            #endregion


            try
            {

                hastane.Open();

                int id = Convert.ToInt32(textBox1.Text);
                string sql = "select Personel_id,sifre from tbl_Personel where sifre=@sıfre and Personel_id=@id";
                SqlParameter sfr = new SqlParameter("sıfre", textBox2.Text.Trim());
                SqlParameter kadı = new SqlParameter("id", int.Parse(textBox1.Text.Trim()));
                SqlCommand komut = new SqlCommand(sql, hastane);
                komut.Parameters.Add(sfr);
                komut.Parameters.Add(kadı);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(komut);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    MessageBox.Show("OK");
                }


            }
            catch (Exception)
            {

                throw;
            }



        }

       
    }
}
