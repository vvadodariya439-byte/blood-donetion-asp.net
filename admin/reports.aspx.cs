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
    public partial class reports : System.Web.UI.Page
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

        void bindgrid()
        {
            getcon();
            string query = "select * from donors where 1=1";
            if (!string.IsNullOrEmpty(drpbg.SelectedValue))
            {
                query += " and BloodGroup='" + drpbg.SelectedValue + "'";
            }
            if (!string.IsNullOrEmpty(drpct.SelectedValue))
            {
                query += " and City='" + drpct.SelectedValue + "'";
            }
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            bindgrid();
        }
    }
}
