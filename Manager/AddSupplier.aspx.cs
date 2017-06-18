using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
public partial class Manager_AddSupplier : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (CatalogAccess.SupplierEmail(txtEmail.Text)==true)
            {
                string script = "alert(\"Email is already exist!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);

            }
            else
            {
                Guid newGuid = Guid.NewGuid();

                CatalogAccess.AddSupplier( txtName.Text, txtEmail.Text, txtStreet.Text, txtSubrub.Text, txtCity.Text,
                             txtZipCode.Text, txtlandline.Text, txtMobile.Text, txtFax.Text);
                string script = "alert(\"It was added successfully to the database!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                var txtBox = new List<TextBox>() { txtName,txtEmail, txtStreet, txtCity,txtSubrub, txtZipCode, txtMobile,txtFax, txtlandline };
                foreach (var textBox in txtBox)
                {
                    textBox.Text = "";
                }
            }
        }
        catch (Exception exGeneral)
        {
            Session["ExceptionObject"] = exGeneral;
            Server.Transfer("../DisplayErrors.aspx?from=AddSupplier");

        }
    }
}