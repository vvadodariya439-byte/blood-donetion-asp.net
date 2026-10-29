using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //For Connection
using System.Data; //For DataSet
using System.Configuration; //For Connection String

namespace BloodBankSystem.donor
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

        void loadDonorProfile()
        {
            string userId = Session["user_id"] != null ? Session["user_id"].ToString() : "";
            string email = "";

            if (!string.IsNullOrEmpty(userId))
            {
                getcon();
                da = new SqlDataAdapter("select * from users where Id='" + userId + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblusername.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    lblname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    lblemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    lblmobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    lblcity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                    lbladdress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    email = ds.Tables[0].Rows[0]["Email"].ToString();
                }
            }

            if (!string.IsNullOrEmpty(email))
            {
                getcon();
                da = new SqlDataAdapter("select * from donors where Email='" + email + "' or UserId='" + userId + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows[0]["Name"] != DBNull.Value) lblname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    if (ds.Tables[0].Rows[0]["Email"] != DBNull.Value) lblemail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                    if (ds.Tables[0].Rows[0]["BloodGroup"] != DBNull.Value) lblbg.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    if (ds.Tables[0].Rows[0]["Mobile"] != DBNull.Value) lblmobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
                    if (ds.Tables[0].Rows[0]["City"] != DBNull.Value) lblcity.Text = ds.Tables[0].Rows[0]["City"].ToString();
                    if (ds.Tables[0].Rows[0]["Address"] != DBNull.Value) lbladdress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    if (ds.Tables[0].Rows[0]["Image"] != DBNull.Value && !string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Image"].ToString()))
                    {
                        imgphoto.ImageUrl = ds.Tables[0].Rows[0]["Image"].ToString().Replace("~/", "../");
                    }
                }
            }
        }

        void bindCampsDropdown()
        {
            getcon();
            da = new SqlDataAdapter("select Id, CampName from camps", con);
            ds = new DataSet();
            da.Fill(ds);

            drpcamps.DataSource = ds;
            drpcamps.DataTextField = "CampName";
            drpcamps.DataValueField = "Id";
            drpcamps.DataBind();
        }

        void bindAppointments()
        {
            getcon();
            da = new SqlDataAdapter("select * from appointments order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDonorProfile();
                bindCampsDropdown();
                bindAppointments();
            }
        }

        protected void btnbook_Click(object sender, EventArgs e)
        {
            if (drpcamps.SelectedItem == null || string.IsNullOrEmpty(txtdt.Text))
            {
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "Please select camp and appointment date.";
                return;
            }

            getcon();
            cmd = new SqlCommand("insert into appointments (DonorName, CampId, CampName, AppointmentDate, TimeSlot, Status) values ('" + lblname.Text + "', '" + drpcamps.SelectedValue + "', '" + drpcamps.SelectedItem.Text + "', '" + txtdt.Text.Trim() + "', '" + drpslot.SelectedValue + "', 'Scheduled')", con);
            cmd.ExecuteNonQuery();

            lblmsg.ForeColor = System.Drawing.Color.Green;
            lblmsg.Text = "Appointment Booked Successfully!";

            txtdt.Text = "";
            bindAppointments();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}
