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
    public partial class login : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] != null && Session["role"] != null)
            {
                string role = Session["role"].ToString().ToLower();
                if (role == "admin")
                {
                    Response.Redirect("~/admin/dashboard.aspx");
                }
                else if (role == "donor")
                {
                    Response.Redirect("~/donor/dashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txteml.Text) || string.IsNullOrEmpty(txtpwd.Text))
            {
                lblmsg.Text = "Please enter email and password.";
                return;
            }

            getcon();
            da = new SqlDataAdapter("select * from users where Email='" + txteml.Text.Trim() + "' and Password='" + txtpwd.Text.Trim() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string role = ds.Tables[0].Rows[0]["Role"].ToString().ToLower();
                Session["user_id"] = ds.Tables[0].Rows[0]["Id"].ToString();
                Session["user_name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                Session["role"] = role;

                if (role == "admin")
                {
                    Response.Redirect("~/admin/dashboard.aspx");
                }
                else if (role == "donor")
                {
                    Response.Redirect("~/donor/dashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
            else
            {
                lblmsg.Text = "Invalid Email or Password!";
            }
        }
    }
}
