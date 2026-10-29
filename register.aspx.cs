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
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con; //For Connection
        SqlCommand cmd; //For Insert, update, delete
        SqlDataAdapter da; //For container
        DataSet ds; //For Select
        string fnm; //For file variable
        int i;
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
                flpimg.SaveAs(Server.MapPath(fnm)); //Copy File on Specified Location
            }
            else
            {
                fnm = "uploads/default.jpg";
            }
        }

        void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtpwd.Text = "";
            txtmbl.Text = "";
            txtct.Text = "";
            txtadd.Text = "";
            txtst.Text = "";
            txtpin.Text = "";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtnm.Text) || string.IsNullOrEmpty(txteml.Text) || string.IsNullOrEmpty(txtpwd.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please fill in all required fields.";
                return;
            }

            getcon();
            cmd = new SqlCommand("select count(*) from users where Email='" + txteml.Text.Trim() + "'", con);
            i = Convert.ToInt16(cmd.ExecuteScalar());

            if (i > 0)
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Email already registered!";
                return;
            }

            imgupload();

            cmd = new SqlCommand("insert into users (Name, Email, Password, Mobile, Gender, City, Address, Role) values ('" + txtnm.Text.Trim() + "', '" + txteml.Text.Trim() + "', '" + txtpwd.Text.Trim() + "', '" + txtmbl.Text.Trim() + "', '" + rdbgen.SelectedValue + "', '" + txtct.Text.Trim() + "', '" + txtadd.Text.Trim() + "', '" + drprole.SelectedValue + "'); SELECT SCOPE_IDENTITY();", con);
            int userId = Convert.ToInt32(cmd.ExecuteScalar());

            if (drprole.SelectedValue == "donor")
            {
                cmd = new SqlCommand("insert into donors (UserId, Name, Gender, Email, Mobile, BloodGroup, Address, City, State, Pincode, Image, Status) values ('" + userId + "', '" + txtnm.Text.Trim() + "', '" + rdbgen.SelectedValue + "', '" + txteml.Text.Trim() + "', '" + txtmbl.Text.Trim() + "', '" + drpbg.SelectedValue + "', '" + txtadd.Text.Trim() + "', '" + txtct.Text.Trim() + "', '" + txtst.Text.Trim() + "', '" + txtpin.Text.Trim() + "', '" + fnm + "', 'Active')", con);
                cmd.ExecuteNonQuery();
            }

            clear();
            lblmsg.ForeColor = System.Drawing.Color.Green;
            lblmsg.Text = "Registration successful! You can now <a href='login.aspx'>login</a>.";
        }
    }
}
