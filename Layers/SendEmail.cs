using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;

namespace EmailLayers
{
    public class SendEmail
    {
        public SendEmail()
        {
        }
        public static void Send(string to ,string sub, string body)
        {
            MailAddress toAddress = new MailAddress(to);
            MailAddress fromAddress = new MailAddress("Admin@qaulitycar.co.nz");
            MailMessage message = new MailMessage(fromAddress, toAddress);
            message.Subject = "Quality Car"+" "+ sub;
            message.IsBodyHtml = true;
            message.Body = body;
            SmtpClient mailClient = new SmtpClient();
            try
            {
                mailClient.Host = "localhost";
                mailClient.Send(message);

            }
            catch (Exception exGeneral)
            {
                System.Web.HttpContext.Current.Session["ExceptionObject"] = exGeneral;
                System.Web.HttpContext.Current.Server.Transfer("DisplayErrors.aspx?from=Catch General");
            }


        }
        

    }
}
