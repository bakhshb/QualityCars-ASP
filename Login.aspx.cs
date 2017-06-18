using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
using System.Data;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = true;
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated || Session["Admin"] != null)
            {
                
                Response.Redirect("Default.aspx");
            }
        }

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        string [] user = CatalogAccess.UserInfo(txtEmail.Text);
        string [] admin = CatalogAccess.AdminInfo(txtEmail.Text);

        if (CatalogAccess.UserEmail(txtEmail.Text) == true || CatalogAccess.AdminEmail(txtEmail.Text) == true )
        {
            if (txtPass.Text == admin[0])
            {
                    if (FormsAuthentication.Authenticate(txtEmail.Text, txtPass.Text))
                    {
                        Session["Admin"] = txtEmail.Text;
                        Response.Redirect("Default.aspx");
                    }
            }
            else if (txtPass.Text == user[3])
            {
                if (CatalogAccess.AccountStatus(txtEmail.Text) == true)
                {
                    if (Session["link"] != null)
                    {
                        FormsAuthentication.RedirectFromLoginPage(txtEmail.Text, true);
                        Session["id"] = user[0];
                        Session["Login"] = user[1];
                        Session["Email"] = txtEmail.Text;
                        Response.Redirect(Session["link"].ToString());
                        Session.Remove("link");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                    
                }
                else
                {
                    lblChecker.Text = "Account is unactive, please contact the Admin!";
                }
            }
            else
            {
                lblChecker.Text = "Email or Password is incorrect!";
            }
        }
        else
        {
            lblChecker.Text = "Email or Password is incorrect!";
        }
    }
}