using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class ReleaseProduct
    {
        public int id { get; set; }
        public string name { get; set; }
        public string owner { get; set; }
        public string status { get; set; }
        public double  invoiceTotal { get; set; }
        public DateTime requested { get; set; }
        
    }
}