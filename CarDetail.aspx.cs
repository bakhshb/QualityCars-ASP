using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
using System.Data;
public partial class CarDetail : System.Web.UI.Page
{
    List<ShoppingCart> cartItem = new List<ShoppingCart>();
    string[] colors = new string[] { "White", "Green", "Black", "Blue", "Red" };

    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = false;
        if (!Page.IsPostBack)
        {
            try
            {
                string modelId = Request.QueryString["ModelID"];

                CarDetails cd = CatalogAccess.GetCarDetailbyModelId(modelId);


                if (!String.IsNullOrEmpty(cd.ModelName))
                {
                    string makeId = cd.MakerId.ToString();
                    lblCarModel.Text = cd.ModelName;
                    lblyearMake.Text = cd.Year.ToString();
                    lblFeature.Text = cd.Feature;
                    lblCarPrice.Text = cd.Price.ToString();
                    Image.ImageUrl = "../uploads/cars/" + cd.Image;
                    for (int i = 0; i < colors.Length; i++)
                    {
                        drpdwnColor.Items.Add(colors[i].ToString());
                    }
                    DataTable table = CatalogAccess.GetCarMakeById(makeId);
                    if (table.Rows.Count > 0)
                    {
                        DataRow dr = table.Rows[0];
                        lblCarMake.Text = dr["Name"].ToString();
                    }

                }
                else
                {
                    Server.Transfer("ErrorPage.aspx?ErrorMessage=File is not found");
                }
            }
            catch (Exception ex)
            {
                Log.LogException(ex);
                Session["ExceptionObject"] = ex;
                Server.Transfer("DisplayErrors.aspx?from=CarDetail");
            }
        }
    }

    protected void drpdwnColor_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated || Session["Admin"] != null)
        {
            ShoppingCart newItem = new ShoppingCart();
            int itemIndex = ItemIndexOfID(Convert.ToInt32(Request.QueryString["ModelID"]), drpdwnColor.SelectedItem.Text);
            if (itemIndex == -1)
            {
                newItem.ModelId = Convert.ToInt32(Request.QueryString["ModelID"]);
                newItem.ModelName = lblCarModel.Text;
                newItem.Price = Convert.ToDouble(lblCarPrice.Text);
                newItem.Quantity = Convert.ToInt32(txtQty.Text);
                newItem.Color = drpdwnColor.SelectedItem.Text;
                cartItem.Add(newItem);
            }
            else
            {
                
                cartItem[itemIndex].Quantity += Convert.ToInt32(txtQty.Text);
            }

            Session["cart"] = cartItem;
            Response.Redirect("Cart.aspx");

        }
        else
        {
            string url = HttpContext.Current.Request.Url.AbsoluteUri;
            Session["link"] = url;
            Response.Redirect("Login.aspx");
        }
    }
    private int ItemIndexOfID(int ModelId, string color)
    {
        int index = 0;
        if (Session["cart"] != null)
        {
            cartItem = Session["cart"] as List<ShoppingCart>;
            foreach (ShoppingCart item in cartItem)
            {
                if (item.ModelId == ModelId && item.Color.Equals(color))
                {
                    return index;
                }
                index += 1;
            }
        }
        return -1;
    }
}