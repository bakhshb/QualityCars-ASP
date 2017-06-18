using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CatalogAccessLayers;
using System.Data;
using EmailLayers;
using System.Text;
using System.IO;
public partial class Cart : System.Web.UI.Page
{
    List<ShoppingCart> cartList = new List<ShoppingCart>();
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = true;
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated || Session["Admin"] != null)
            {
                DataRebind();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected void DataRebind()
    {
        try
        {
            cartList = Session["cart"] as List<ShoppingCart>;

            grdCart.DataSource = cartList;
            grdCart.DataBind();
            double theTotal = 0;
            if (cartList != null)
            {
                foreach (ShoppingCart total in cartList)
                {
                    theTotal += total.SubTotal;
                }
                lblTotal.Text = "$" + theTotal.ToString();
                double gst = (theTotal * .15) + theTotal;
                lblGstTotal.Text = "$" + gst.ToString();
            }



        }
        catch (Exception exGeneral)
        {

            Session["ExceptionObject"] = exGeneral;
            Server.Transfer("DisplayErrors.aspx?from=Cart");
        }

    }
    protected void grdCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdCart.EditIndex = e.NewEditIndex;
        DataRebind();
    }

    protected void grdCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdCart.EditIndex = -1;
        DataRebind();
    }
    protected void grdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        cartList = Session["cart"] as List<ShoppingCart>;
        cartList.RemoveAt(e.RowIndex);
        DataRebind();
    }
    protected void grdCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        cartList = Session["cart"] as List<ShoppingCart>;
        TextBox txtQuantity = (TextBox)grdCart.Rows[e.RowIndex].Cells[3].Controls[0];
        int Quantity = Convert.ToInt32(txtQuantity.Text);
        if (Quantity == 0)
        {
            cartList.RemoveAt(e.RowIndex);
        }
        else
        {
            cartList[e.RowIndex].Quantity = Quantity;
        }
        grdCart.EditIndex = -1;
        DataRebind();
    }
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        cartList = Session["cart"] as List<ShoppingCart>;
        if (cartList != null)
        {
            if (Session["Admin"] != null)
            {
                string script = "alert(\"You can not check out with Admin account. Please Login with user Account!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);

            }
            else
            {
                StringBuilder model = new StringBuilder();
                StringBuilder color = new StringBuilder();
                StringBuilder qty = new StringBuilder();
                StringBuilder price = new StringBuilder();
                StringBuilder body = new StringBuilder();
                string ship = "Waiting";

                CatalogAccess.AddOrder(Session["id"].ToString(), ship, lblTotal.Text.Replace("$", ""));
                DataTable order = CatalogAccess.GetOrderByCustomerId(Session["id"].ToString());
                string orderId = "";
                if (order.Rows.Count > 0)
                {
                    DataRow dr = order.Rows[0];
                    orderId = dr["Id"].ToString();
                }
                foreach (ShoppingCart item in cartList)
                {
                    
                    CatalogAccess.AddOrderItem(item.ModelId.ToString(), orderId, item.Quantity.ToString(), item.Color, item.Price.ToString());
                    model.Append(item.ModelName+"<br/>");
                    color.Append(item.Color + "<br/>");
                    qty.Append(item.Quantity + "<br/>");
                    price.Append(item.Price + "<br/>");
                }
                 body.Append(PopulateBody(model,color,qty,price));
                SendEmail.Send(Session["Email"].ToString(), " Your Purchase ",body.ToString());
                cartList.Clear();
                Response.Redirect("Thanks.aspx");
            }
        }
        else
        {
            string script = "alert(\"The cart is empty!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        cartList = Session["cart"] as List<ShoppingCart>;
        if (Session["cart"] != null)
        {
            cartList.Clear();
            DataRebind();
        }
    }
    protected void btnbtnConShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    private string PopulateBody(StringBuilder carmodel, StringBuilder color, StringBuilder quantity, StringBuilder price)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("PurchaseEmail.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{carModel}", carmodel.ToString());
        body = body.Replace("{color}", color.ToString());
        body = body.Replace("{quantity}", quantity.ToString());
        body = body.Replace("{price}", price.ToString());
        return body;
    }
}