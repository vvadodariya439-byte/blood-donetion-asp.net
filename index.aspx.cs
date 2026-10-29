using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //For Connection
using System.Data; //For DataSet
using System.Configuration; //For Connection String

namespace BloodBankSystem
{
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con; //For Connection
        SqlCommand cmd; //For Insert, update, delete
        SqlDataAdapter da; //For container
        DataSet ds; //For Select
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtnm.Text = "";
            txtunits.Text = "";
            txtmbl.Text = "";
            txthosp.Text = "";
            txtdt.Text = "";
        }

        void bindgrid()
        {
            getcon();
            string query = "select * from blood_inventory";
            if (!string.IsNullOrEmpty(drpbg.SelectedValue))
            {
                query += " where BloodGroup='" + drpbg.SelectedValue + "'";
            }
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void bindcamps()
        {
            getcon();
            da = new SqlDataAdapter("select * from camps where Status='Upcoming'", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
                bindcamps();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            bindgrid();
        }

        protected void btnreq_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtnm.Text) || string.IsNullOrEmpty(txtunits.Text) || string.IsNullOrEmpty(txtmbl.Text))
            {
                lblreqmsg.ForeColor = System.Drawing.Color.Red;
                lblreqmsg.Text = "Please fill in all required request fields.";
                return;
            }

            getcon();
            cmd = new SqlCommand("insert into blood_requests (PatientName, BloodGroup, UnitsNeeded, HospitalName, ContactMobile, RequirementDate, Status) values ('" + txtnm.Text.Trim() + "', '" + drpreqbg.SelectedValue + "', '" + txtunits.Text.Trim() + "', '" + txthosp.Text.Trim() + "', '" + txtmbl.Text.Trim() + "', '" + txtdt.Text.Trim() + "', 'Pending')", con);
            cmd.ExecuteNonQuery();

            lblreqmsg.ForeColor = System.Drawing.Color.Green;
            lblreqmsg.Text = "Blood Request Submitted Successfully!";
            clear();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }
    }
}
