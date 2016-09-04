using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class jsonmessage
    {
        public string from { get; set; }
        public string to { get; set; }
        public string message { get; set; }
        public DateTime date { get; set; }
    }
}