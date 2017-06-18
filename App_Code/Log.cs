using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// Summary description for Log
/// </summary>

public class Log
{
    public Log()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public static void LogException(Exception e)
    {
        StreamWriter writer = null;
        try
        {
            String fileName = HttpContext.Current.Server.MapPath("../uploads/Log/") + "ExceptionLog-" + DateTime.Now.ToString("yyyyMMdd") + ".txt";

            StringBuilder sb = new StringBuilder();
            sb.Append("\n\r");
            sb.Append("------------START------------");
            sb.Append("\n\r");

            sb.Append("Error Time: ");
            sb.Append(System.DateTime.Now.ToString());
            sb.Append("\n\r");

            sb.Append("Error Message: ");
            sb.Append(e.Message);
            sb.Append("\n\r");

            sb.Append("Error Stack Trace: ");
            sb.Append(e.StackTrace);
            sb.Append("\n\r");

            sb.Append("------------END------------");
            sb.Append("\n\r");

            if (!File.Exists(fileName))
            {
                writer = File.CreateText(fileName);
            }
            else
            {
                writer = File.AppendText(fileName);
            }

            writer.WriteLine(sb.ToString());
            writer.Close();
        }
        catch
        {
            throw;
        }
        finally
        {
            if (writer != null)
                writer.Close();
        }


    }

}
