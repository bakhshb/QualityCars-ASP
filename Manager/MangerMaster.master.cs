using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Manager_MangerMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.Configuration.FormsAuthenticationUser.Equals(Session["Admin"].ToString(), "Admin"))
        {
            Response.Redirect("~/Default.aspx");
        }
        else if (Session["Admin"] != null)
        {
            lblLogin.Text = "Welcome " + Session["Admin"].ToString() + " ";
            lnkBtnLogin.Text = "Logout";
            lblLogin.Visible = true;
            lnkBtnManagement.Visible = true;
        }

    }
    protected void lnkBtnLogin_Click(object sender, EventArgs e)
    {
        if (lnkBtnLogin.Text == "Login")
        {
            Response.Redirect("../Login.aspx");

        }
        else
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            Response.Redirect("../Login.aspx");

        }
    }
    protected void lnkBtnManagement_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
