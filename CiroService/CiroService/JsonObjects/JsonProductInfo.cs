using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class JsonProductInfo
    {
        public int id { get; set; }
        public string name { get; set; }
        public DateTime date { get; set; }
        public double price { get; set; }
        public int quantity { get; set; }
        public string url { get; set; }
        public string owner { get; set; }
    }
}