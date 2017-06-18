using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = false;

    }
    protected void DataPager1_PreRender(object sender, EventArgs e)
    {
        lstView.DataSource = CatalogAccess.GetCarModelList();
        lstView.DataBind();
    }
}