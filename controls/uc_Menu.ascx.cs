using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
using Layers;
public partial class Control_uc_CarMake : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            repMenu.DataSource = CatalogAccess.GetCarMakeList();
            repMenu.DataBind();
            
        }
    }
}