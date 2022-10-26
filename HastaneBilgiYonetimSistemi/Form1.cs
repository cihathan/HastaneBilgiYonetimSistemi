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
    }
}
