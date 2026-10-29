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
    public partial class users : System.Web.UI.Page
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
            txtnm.Text = "";
            txteml.Text = "";
            txtpwd.Text = "";
            txtmbl.Text = "";
            btn.Text = "Save";
        }

        void bindgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from users", con);
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
            if (string.IsNullOrEmpty(txtnm.Text) || string.IsNullOrEmpty(txteml.Text) || string.IsNullOrEmpty(txtpwd.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please fill all required fields.";
                return;
            }

            getcon();
            if (string.IsNullOrEmpty(hfId.Value))
            {
                cmd = new SqlCommand("insert into users (Name, Email, Password, Mobile, Role) values ('" + txtnm.Text.Trim() + "', '" + txteml.Text.Trim() + "', '" + txtpwd.Text.Trim() + "', '" + txtmbl.Text.Trim() + "', '" + drprole.SelectedValue + "')", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "User added successfully!";
            }
            else
            {
                cmd = new SqlCommand("update users set Name='" + txtnm.Text.Trim() + "', Email='" + txteml.Text.Trim() + "', Password='" + txtpwd.Text.Trim() + "', Mobile='" + txtmbl.Text.Trim() + "', Role='" + drprole.SelectedValue + "' where Id='" + hfId.Value + "'", con);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "User updated successfully!";
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
                da = new SqlDataAdapter("select * from users where Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfId.Value = ds.Tables[0].Rows[0]["Id"].ToString();
                    txtnm.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    txteml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    txtpwd.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                    txtmbl.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    if (drprole.Items.FindByValue(ds.Tables[0].Rows[0]["Role"].ToString()) != null)
                    {
                        drprole.SelectedValue = ds.Tables[0].Rows[0]["Role"].ToString();
                    }
                    btn.Text = "Update";
                }
            }
            else if (e.CommandName == "DeleteData")
            {
                getcon();
                cmd = new SqlCommand("delete from users where Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                lblmsg.Text = "User deleted successfully!";
                bindgrid();
            }
        }
    }
}
