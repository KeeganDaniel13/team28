using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class transferStock
    {
        public string productName { get; set; }
        public string status { get; set; } //ingoing or outgoing
        public int size { get; set; }
        public decimal value { get; set; }
        public string  location { get; set; }
    }
}