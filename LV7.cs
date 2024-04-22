using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Baze_LV7_predlozak
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnSve_Click(object sender, EventArgs e)
        {
            // OVDJE SLIJEDI ZADATAK IZ LV7 a):
            SqlConnection conn = new SqlConnection("Data Source=161.53.201.59;Initial Catalog=student;User ID=student;Password=student");

            conn.Open();

            string statement = "SELECT * FROM osobe order by prezime";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(statement, conn);

            DataTable dt = new DataTable();
            dataAdapter.Fill(dt);

            dgvPodaci.DataSource = dt;

            conn.Close();
            
        }

        private void btnSpremi_Click(object sender, EventArgs e)
        {
            // OVDJE SLIJEDI ZADATAK IZ LV7 b) (i BONUS zadatak):
            SqlConnection conn = new SqlConnection("Data Source=161.53.201.59;Initial Catalog=student;User ID=student;Password=student");
            conn.Open();
           

            string datum = txtDatum.Value.ToString("yyyy-MM-dd");
            string spol;
            if (rbM.Checked) spol = "M";
            else spol = "Ž";
            String statement = "INSERT INTO osobe VALUES ('" + txtOIB.Text + "','" + txtIme.Text + "','" + txtPrezime.Text + "','" + spol + "','" + datum + "')";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(statement, conn);
            
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        public void obrisiSve()
        {
            txtOIB.Text = "";
            txtIme.Text = "";
            txtPrezime.Text = "";
            txtDatum.Text = "";
            dgvPodaci.ClearSelection();
            txtOIB.ReadOnly = false;
        }

        private void btnObrisi_Click(object sender, EventArgs e)
        {
            obrisiSve();
        }

        private void dgvPodaci_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //OVDJE JE DODATAK POTREBAN ZA BONUS ZADATAK
            txtOIB.Text = dgvPodaci.SelectedRows[0].Cells[0].Value.ToString();
            txtIme.Text = dgvPodaci.SelectedRows[0].Cells[1].Value.ToString();
            txtPrezime.Text = dgvPodaci.SelectedRows[0].Cells[2].Value.ToString();
            if (dgvPodaci.SelectedRows[0].Cells[3].Value.ToString() == "M") rbM.Checked = true;
            else rbZ.Checked = true;
            txtOIB.ReadOnly = true;
            txtDatum.Text = dgvPodaci.SelectedRows[0].Cells[4].Value.ToString();
        }





    }
}
