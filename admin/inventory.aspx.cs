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
    public partial class inventory : System.Web.UI.Page
    {
        SqlConnection con; //For Connection
        SqlCommand cmd; //For Insert, update, delete
        SqlDataAdapter da; //For container
        DataSet ds; //For Select
        int i;
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            hfId.Value = "";
            txtunits.Text = "";
        }

        void bindgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from blood_inventory", con);
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
            if (string.IsNullOrEmpty(txtunits.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please enter number of units.";
                return;
            }

            getcon();
            cmd = new SqlCommand("select count(*) from blood_inventory where BloodGroup='" + drpbg.SelectedValue + "'", con);
            i = Convert.ToInt16(cmd.ExecuteScalar());

            if (i > 0)
            {
                cmd = new SqlCommand("update blood_inventory set Units='" + txtunits.Text.Trim() + "', LastUpdated=GETDATE() where BloodGroup='" + drpbg.SelectedValue + "'", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Stock updated successfully!";
            }
            else
            {
                cmd = new SqlCommand("insert into blood_inventory (BloodGroup, Units, LastUpdated) values ('" + drpbg.SelectedValue + "', '" + txtunits.Text.Trim() + "', GETDATE())", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Stock added successfully!";
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
                da = new SqlDataAdapter("select * from blood_inventory where Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
                    if (drpbg.Items.FindByValue(ds.Tables[0].Rows[0]["BloodGroup"].ToString()) != null)
                    {
                        drpbg.SelectedValue = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    }
                    txtunits.Text = ds.Tables[0].Rows[0]["Units"].ToString();
                }
            }
            else if (e.CommandName == "DeleteData")
            {
                getcon();
                cmd = new SqlCommand("delete from blood_inventory where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "Stock entry deleted!";
                bindgrid();
            }
        }
    }
}
