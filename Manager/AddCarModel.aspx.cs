using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
public partial class Manager_AddCarModel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void drpdwnMake_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write(drpdwnMake.SelectedValue);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if( filMyFile.HasFile && (filMyFile.PostedFile.ContentType == "text/plain" || filMyFile.PostedFile.ContentType == "application/pdf" || filMyFile.PostedFile.ContentType == "application/msword" ||
                filMyFile.PostedFile.ContentType == "image/gif" || filMyFile.PostedFile.ContentType == "image/jpeg" ||  filMyFile.PostedFile.ContentType == "image/bmp"  ) )
            {
                string fileName = filMyFile.FileName;
                if (filMyFile.PostedFile.ContentType.Contains("image/"))
                {
                    //Save a file
                    filMyFile.SaveAs(Server.MapPath("../../uploads/cars/") + fileName);
                    CatalogAccess.AddCarModel(drpdwnMake.SelectedValue.ToString(), drpdwnSupplier.SelectedValue.ToString(), txtName.Text, txtYear.Text, txtPrice.Text, txtFeature.Text, fileName);

                    string script = "alert(\"It was added successfully to the database!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    var txtBox = new List<TextBox>() { txtFeature, txtPrice, txtName, txtYear };
                    foreach (var textBox in txtBox)
                    {
                        textBox.Text = "";
                    }
                }
                
            }

        }
        catch (Exception exGeneral)
        {
            Session["ExceptionObject"] = exGeneral;
            Server.Transfer("../DisplayErrors.aspx?from=AddCarModel");
            throw;
        }
    }
}