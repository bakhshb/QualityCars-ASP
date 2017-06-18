using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Layers
{
    public class Link
    {
        public Link()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static string BuildAbsolute(string relativeUri)
        {
            Uri uri = HttpContext.Current.Request.Url;
            string app = HttpContext.Current.Request.ApplicationPath;
            if (!app.EndsWith("/"))
                app += "/";

            relativeUri = relativeUri.TrimStart('/');
            return HttpUtility.UrlPathEncode(String.Format("http://{0}:{1}{2}{3}", uri.Host, uri.Port, app, relativeUri));
        }

        //generate car make url

        public static string ToCarMaker(string MakerId)
        {
            return BuildAbsolute(String.Format("catalog.aspx?MakeId={0}", MakerId));

        }
        //generate car model url
        public static string ToCarModel(string MakerId)
        {
            return BuildAbsolute(String.Format("CarModel.aspx?MakeID={0}", MakerId));
        }

        public static string ToCarDetail(string ModelId)
        {
            return BuildAbsolute(String.Format("CarDetail.aspx?ModelID={0}", ModelId));
        }
    }
}
