using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //For Connection
using System.Data; //For DataSet
using System.Configuration; //For Connection String

namespace BloodBankSystem.admin
{
    public partial class dashboard : System.Web.UI.Page
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

        void loadstats()
        {
            getcon();

            cmd = new SqlCommand("select count(*) from donors", con);
            lbldonors.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(*) from blood_requests where Status='Pending'", con);
            lblrequests.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select isnull(sum(Units), 0) from blood_inventory", con);
            lblinventory.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(*) from camps", con);
            lblcamps.Text = cmd.ExecuteScalar().ToString();

            // Load recent donors
            da = new SqlDataAdapter("select top 5 Name, BloodGroup, Mobile, City from donors order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridViewRecentDonors.DataSource = ds;
            GridViewRecentDonors.DataBind();

            // Load recent requests
            da = new SqlDataAdapter("select top 5 PatientName, BloodGroup, UnitsNeeded, Status from blood_requests order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);
            GridViewRecentRequests.DataSource = ds;
            GridViewRecentRequests.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadstats();
            }
        }
    }
}
