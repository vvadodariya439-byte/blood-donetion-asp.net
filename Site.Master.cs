using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodBankSystem
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                phGuest.Visible = false;
                phUser.Visible = true;
                lblMasterUser.Text = "Welcome, " + Session["user_name"].ToString();

                string role = Session["role"] != null ? Session["role"].ToString().ToLower() : "";
                if (role == "admin")
                {
                    lnkDashboard.NavigateUrl = "~/admin/dashboard.aspx";
                }
                else if (role == "donor")
                {
                    lnkDashboard.NavigateUrl = "~/donor/dashboard.aspx";
                }
                else
                {
                    lnkDashboard.NavigateUrl = "~/index.aspx";
                }
            }
            else
            {
                phGuest.Visible = true;
                phUser.Visible = false;
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}
