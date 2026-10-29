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
    public partial class requests : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from blood_requests order by Id desc", con);
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ApproveData")
            {
                getcon();
                cmd = new SqlCommand("update blood_requests set Status='Approved' where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "Request Approved!";
                bindgrid();
            }
            else if (e.CommandName == "RejectData")
            {
                getcon();
                cmd = new SqlCommand("update blood_requests set Status='Rejected' where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "Request Rejected!";
                bindgrid();
            }
        }
    }
}
