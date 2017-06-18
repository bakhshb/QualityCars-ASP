using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
public partial class Manager_AddCarMake : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            CatalogAccess.AddCarMake(txtName.Text);
            string script = "alert(\"It was added successfully to the database!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
            var txtBox = new List<TextBox>() { txtName };
            foreach (var textBox in txtBox)
            {
                textBox.Text = "";
            }
        }
        catch (Exception exGeneral)
        {
            Session["ExceptionObject"] = exGeneral;
            Server.Transfer("../DisplayErrors.aspx?from=AddCarMake");
        }
        

    }
   
}