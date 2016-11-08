using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class WareTrans
    {
        public int ID { get; set; }
        public string currentLocation { get; set; }
        public string destination { get; set; }
        public string productName { get; set;}
    }
}