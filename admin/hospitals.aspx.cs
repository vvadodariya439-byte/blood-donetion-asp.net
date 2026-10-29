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
    public partial class hospitals : System.Web.UI.Page
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
            txtct.Text = "";
            txtadd.Text = "";
            txtperson.Text = "";
            txtmbl.Text = "";
            btn.Text = "Save Hospital";
        }

        void bindgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from hospitals", con);
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
            if (string.IsNullOrEmpty(txtname.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please enter hospital name.";
                return;
            }

            getcon();
            if (string.IsNullOrEmpty(hfId.Value))
            {
                cmd = new SqlCommand("insert into hospitals (HospitalName, City, Address, ContactPerson, Mobile) values ('" + txtname.Text.Trim() + "', '" + txtct.Text.Trim() + "', '" + txtadd.Text.Trim() + "', '" + txtperson.Text.Trim() + "', '" + txtmbl.Text.Trim() + "')", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Hospital added successfully!";
            }
            else
            {
                cmd = new SqlCommand("update hospitals set HospitalName='" + txtname.Text.Trim() + "', City='" + txtct.Text.Trim() + "', Address='" + txtadd.Text.Trim() + "', ContactPerson='" + txtperson.Text.Trim() + "', Mobile='" + txtmbl.Text.Trim() + "' where Id='" + hfId.Value + "'", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Hospital updated successfully!";
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
                da = new SqlDataAdapter("select * from hospitals where Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
                    txtname.Text = ds.Tables[0].Rows[0]["HospitalName"].ToString();
                    txtct.Text = ds.Tables[0].Rows[0]["City"].ToString();
                    txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    txtperson.Text = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
                    txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    btn.Text = "Update Hospital";
                }
            }
            else if (e.CommandName == "DeleteData")
            {
                getcon();
                cmd = new SqlCommand("delete from hospitals where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "Hospital deleted!";
                bindgrid();
            }
        }
    }
}
