using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
using System.Data;
public partial class CarModel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = false;
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["MakeId"]))
            {
                string makeId = Request.QueryString["makeId"];
                dlstCarModel.DataSource = CatalogAccess.GetCarModelbyMakeId(makeId);
                dlstCarModel.DataBind();
                DataTable table = CatalogAccess.GetCarMakeById(makeId);
                if (table.Rows.Count > 0)
                {
                    DataRow dr = table.Rows[0];
                    lblCarMake.Text = dr["Name"].ToString();
                }
            }
            else
            {
                dlstCarModel.DataSource = CatalogAccess.GetCarModelList();
                dlstCarModel.DataBind();
            }
        }
    }
}