using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class JsonTask
    {
        public int id { get; set; }
        public int warehouse { get; set; }
        public int employee { get; set; }
        public string type { get; set; }
        public string description { get; set; }
        public DateTime timestamp { get; set; }
        public DateTime endtime { get; set; }
        public string section { get; set; }
    }
}