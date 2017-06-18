using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EmailLayers;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SiteMaster.wide = true;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SendEmail.Send("bakhshb@gmail.com", txtSubject.Text, "Name:" + txtName.Text + "\n" + "Email:" + txtEmail.Text + "\n" + txtMsg.Text);
        lblMsg.Text="We will try to reply to you as soon as possible";
        var txtBox = new List<TextBox>() { txtEmail, txtMsg, txtName, txtSubject };
        foreach (var textBox in txtBox)
        {
            textBox.Text = "";
        }
    }
}
