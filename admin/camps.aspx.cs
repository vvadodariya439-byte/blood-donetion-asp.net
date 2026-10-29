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
    public partial class camps : System.Web.UI.Page
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
            hfId.Value = "";
            txtname.Text = "";
            txtorg.Text = "";
            txtloc.Text = "";
            txtdt.Text = "";
            txttm.Text = "";
            txtperson.Text = "";
            txtmbl.Text = "";
            btn.Text = "Save Camp";
        }

        void bindgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from camps", con);
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

        protected void btn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtname.Text) || string.IsNullOrEmpty(txtloc.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please fill in camp details.";
                return;
            }

            getcon();
            if (string.IsNullOrEmpty(hfId.Value))
            {
                cmd = new SqlCommand("insert into camps (CampName, Organizer, Location, CampDate, CampTime, ContactPerson, Mobile, Status) values ('" + txtname.Text.Trim() + "', '" + txtorg.Text.Trim() + "', '" + txtloc.Text.Trim() + "', '" + txtdt.Text.Trim() + "', '" + txttm.Text.Trim() + "', '" + txtperson.Text.Trim() + "', '" + txtmbl.Text.Trim() + "', 'Upcoming')", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Camp added successfully!";
            }
            else
            {
                cmd = new SqlCommand("update camps set CampName='" + txtname.Text.Trim() + "', Organizer='" + txtorg.Text.Trim() + "', Location='" + txtloc.Text.Trim() + "', CampDate='" + txtdt.Text.Trim() + "', CampTime='" + txttm.Text.Trim() + "', ContactPerson='" + txtperson.Text.Trim() + "', Mobile='" + txtmbl.Text.Trim() + "' where Id='" + hfId.Value + "'", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Camp updated successfully!";
            }

            clear();
            bindgrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditData")
            {
                getcon();
                da = new SqlDataAdapter("select * from camps where Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
                    txtname.Text = ds.Tables[0].Rows[0]["CampName"].ToString();
                    txtorg.Text = ds.Tables[0].Rows[0]["Organizer"].ToString();
                    txtloc.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                    txtdt.Text = ds.Tables[0].Rows[0]["CampDate"].ToString();
                    txttm.Text = ds.Tables[0].Rows[0]["CampTime"].ToString();
                    txtperson.Text = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
                    txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    btn.Text = "Update Camp";
                }
            }
            else if (e.CommandName == "DeleteData")
            {
                getcon();
                cmd = new SqlCommand("delete from camps where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "Camp deleted!";
                bindgrid();
            }
        }
    }
}
