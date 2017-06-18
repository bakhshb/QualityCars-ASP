using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    List<ShoppingCart> cartList = new List<ShoppingCart>();
    public static Boolean wide = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
        {
            
            lblLogin.Text = "Welcome " + Session["Login"].ToString() + " ";
            lnkBtnLogin.Text = "Logout";
            lblLogin.Visible = true;
            lnkBtnCart.Visible = true;
            lnkBtnRegister.Visible = false;
            lnkBtnManagement.Visible = false;
            

        }
        else if (Session["Admin"] != null)
        {
            lblLogin.Text = "Welcome " + Session["Admin"].ToString() + " ";
            lnkBtnLogin.Text = "Logout";
            lblLogin.Visible = true;
            lnkBtnManagement.Visible = true;
        }
        else
        {
            lnkBtnLogin.Text = "Login";
            lnkBtnRegister.Visible = true;
            lblLogin.Visible = false;
            lnkBtnCart.Visible = false;
            lnkBtnManagement.Visible = false;
            
        }
        int item = 0;
        if (Session["cart"] != null)
        {
            cartList = Session["cart"] as List<ShoppingCart>;
            
            foreach (ShoppingCart total in cartList)
            {
                item++;
            }
            lnkBtnCart.Text = "| ViewCart (" + item + ")";

        }
        else
        {
            lnkBtnCart.Text = "| ViewCart ("+item+")";
        }
        if (wide == true)
        {
            browse.Attributes["Style"] = "display: none;";
            body.Attributes["Style"] = "width:100%;";
        }
        else
        {
            browse.Attributes["Style"] = "display: block;";
        }
    }
    protected void lnkBtnLogin_Click(object sender, EventArgs e)
    {
        if (lnkBtnLogin.Text == "Login")
        {
            Response.Redirect("Login.aspx");
           
        }
        else
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            Session.Clear();
            Response.Redirect("Login.aspx");

        }
    }
    protected void lnkBtnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void lnkBtnCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
    protected void lnkBtnManagement_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Manager/Default.aspx");
    }
}
