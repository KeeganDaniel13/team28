using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroWebsite
{
    public  class CiroSingleton
    {
        
        private static CiroService.Service1Client serverCalls = null;
        private static CiroSingleton instance = null;
        private CiroSingleton(){ serverCalls = new CiroService.Service1Client(); }

        public static CiroService.Service1Client   ServerCalls
        {
            get
            {
                if(serverCalls ==null)
                {
                    instance  = new CiroSingleton ();
                }
                return serverCalls;
            }

        }
    }
}