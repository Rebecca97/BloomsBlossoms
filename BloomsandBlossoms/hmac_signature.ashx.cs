using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace BloomsandBlossoms
{
    /// <summary>
    /// Summary description for hmac_signature1
    /// </summary>
    public class hmac_signature1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string key = "87851b4fda1d3aa96edad6a7053f889d867a3c54";
            string merchantId = context.Request.QueryString["merchantId"]; 
            string orderAmount = context.Request.QueryString["orderAmount"];
            string merchantTxnId = context.Request.QueryString["merchantTxnId"];
            string currency = context.Request.QueryString["currency"];

            string data = merchantId + orderAmount + merchantTxnId + currency;
            try
            {
                System.Security.Cryptography.HMACSHA1 myhmacsha1 = new System.Security.Cryptography.HMACSHA1(Encoding.ASCII.GetBytes(key));
                System.IO.MemoryStream stream = new System.IO.MemoryStream(Encoding.ASCII.GetBytes(data));

                context.Response.Write(BitConverter.ToString(myhmacsha1.ComputeHash(stream)).Replace("-", "").ToLower()); 

        
    }
            catch (Exception e)
            {

            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}