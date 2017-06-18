using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmailLayers;
using System.Text;

public partial class DisplayErrors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = true;
        Response.Clear();

        Exception ex = Session["ExceptionObject"] as Exception;
        lblErrorFrm.Text = Request.QueryString["from"];
        lblHlpLnk.Text = ex.HelpLink;
        if (ex.InnerException != null)
        {
            lblInrError.Text = ex.InnerException.Message;
        }

        lblMsg.Text = ex.Message;
        lblSrc.Text = ex.Source;
        lblStkTrc.Text = ex.StackTrace;
        lblTrgtSit.Text = ex.TargetSite.Name;

        //StringBuilder sb = new StringBuilder();
        //sb.Append("From: " + Request.QueryString["from"]);
        //sb.Append("\n");
        //sb.Append("\n Help Link: " + ex.HelpLink);
        //sb.Append("\n");
        //sb.Append("\n Inner Error: " + ex.InnerException.Message);
        //sb.Append("\n");
        //sb.Append("\n Message: " + ex.Message);
        //sb.Append("\n");
        //sb.Append("\n Source: " + ex.Source);
        //sb.Append("\n");
        //sb.Append("\n Stack Trace: " + ex.StackTrace);
        //sb.Append("\n");
        //sb.Append("\n Target Site: " + ex.TargetSite.Name);
        //SendEmail.Send("bakhshb@gmail.com", "Error", sb.ToString());
        
    }
}