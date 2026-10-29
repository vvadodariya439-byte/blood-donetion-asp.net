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
    public partial class donors : System.Web.UI.Page
    {
        SqlConnection con; //For Connection
        SqlCommand cmd; //For Insert, update, delete
        SqlDataAdapter da; //For container
        DataSet ds; //For Select
        string fnm; //For file variable
        string s = ConfigurationManager.ConnectionStrings["dbstring"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (flpimg.HasFile)
            {
                fnm = "uploads/" + flpimg.FileName; //For Fetch Filename
                flpimg.SaveAs(Server.MapPath("~/uploads/" + flpimg.FileName)); //Copy File on Specified Location
            }
            else
            {
                fnm = "uploads/default.jpg";
            }
        }

        void clearForm()
        {
            hfId.Value = "";
            txtnm.Text = "";
            txteml.Text = "";
            txtadd.Text = "";
            txtmbl.Text = "";
            drpct.SelectedIndex = 0;
            drpbg.SelectedIndex = 0;
            btn.Text = "Save";
        }

        void bindgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from donors", con);
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
            if (string.IsNullOrEmpty(txtnm.Text) || string.IsNullOrEmpty(txteml.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please fill required fields.";
                return;
            }

            imgupload();

            getcon();
            if (string.IsNullOrEmpty(hfId.Value))
            {
                // Save / Insert
                cmd = new SqlCommand("insert into donors (Name, Gender, Email, BloodGroup, City, Address, Mobile, Image, Status) values ('" + txtnm.Text.Trim() + "', '" + rdbgen.SelectedValue + "', '" + txteml.Text.Trim() + "', '" + drpbg.SelectedValue + "', '" + drpct.SelectedValue + "', '" + txtadd.Text.Trim() + "', '" + txtmbl.Text.Trim() + "', '" + fnm + "', 'Active')", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Donor added successfully!";
            }
            else
            {
                // Update
                if (flpimg.HasFile)
                {
                    cmd = new SqlCommand("update donors set Name='" + txtnm.Text.Trim() + "', Gender='" + rdbgen.SelectedValue + "', Email='" + txteml.Text.Trim() + "', BloodGroup='" + drpbg.SelectedValue + "', City='" + drpct.SelectedValue + "', Address='" + txtadd.Text.Trim() + "', Mobile='" + txtmbl.Text.Trim() + "', Image='" + fnm + "' where Id='" + hfId.Value + "'", con);
                }
                else
                {
                    cmd = new SqlCommand("update donors set Name='" + txtnm.Text.Trim() + "', Gender='" + rdbgen.SelectedValue + "', Email='" + txteml.Text.Trim() + "', BloodGroup='" + drpbg.SelectedValue + "', City='" + drpct.SelectedValue + "', Address='" + txtadd.Text.Trim() + "', Mobile='" + txtmbl.Text.Trim() + "' where Id='" + hfId.Value + "'", con);
                }
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Donor updated successfully!";
            }

            clearForm();
            bindgrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditData")
            {
                getcon();
                da = new SqlDataAdapter("select * from donors where Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
                    txtnm.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    if (rdbgen.Items.FindByValue(ds.Tables[0].Rows[0]["Gender"].ToString()) != null)
                    {
                        rdbgen.SelectedValue = ds.Tables[0].Rows[0]["Gender"].ToString();
                    }
                    txteml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    if (drpbg.Items.FindByValue(ds.Tables[0].Rows[0]["BloodGroup"].ToString()) != null)
                    {
                        drpbg.SelectedValue = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    }
                    if (drpct.Items.FindByValue(ds.Tables[0].Rows[0]["City"].ToString()) != null)
                    {
                        drpct.SelectedValue = ds.Tables[0].Rows[0]["City"].ToString();
                    }
                    txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    btn.Text = "Update";
                }
            }
            else if (e.CommandName == "DeleteData")
            {
                getcon();
                cmd = new SqlCommand("delete from donors where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "Donor deleted successfully!";
                bindgrid();
            }
        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            clearForm();
        }
    }
}
