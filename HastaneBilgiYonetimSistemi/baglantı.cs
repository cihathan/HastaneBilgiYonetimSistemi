using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HastaneBilgiYonetimSistemi
{
    public class baglantı
    {
       public int genelid;
        public SqlConnection bagla()
        {
            // Cihat'ın pc için bağlantı kodu
            SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-K3NST82; Initial Catalog=MCI_Hospital;Integrated Security=True");

            // İlker'in pc için bağlantı kodu
            //SqlConnection baglan = new SqlConnection("Data Source=DESKTOP-QJ144O6\\SQLEXPRESS; Initial Catalog=MCI_Hospital;Integrated Security=True");
            baglan.Open();
            
            return baglan;
        }
      

    }
}
