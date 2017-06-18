using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
using EmailLayers;

public partial class Register : System.Web.UI.Page
{
    string Enable = "1";
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = false;
        if (User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (CatalogAccess.UserEmail(txtEmail.Text) == true)
            {
                string script = "alert(\"Email is already exist!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);

            }
            else
            {
                Guid newGuid = Guid.NewGuid();

                CatalogAccess.AddCustomer(newGuid.ToString(), txtfName.Text, txtlName.Text, txtEmail.Text, txtPass.Text, txtStreet.Text, txtSubrub.Text, txtCity.Text,
                             txtZipCode.Text, txtlandline.Text, txtMobile.Text, txtFax.Text, Enable);
                SendEmail.Send(txtEmail.Text, "Registration Information","<h1>Your Login Details:</h1><br/>"+ "Your login: " + txtEmail.Text + "<br/> Password: " + txtPass.Text +"<br/> Please keep these information safe "+ "<br/> Thank you for Registring  <br/> Admin<br/> bakhshb@gmail.com");
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception exGeneral)
        {
            Session["ExceptionObject"] = exGeneral;
            Server.Transfer("DisplayErrors.aspx?from=Registration");
        }
    }

}