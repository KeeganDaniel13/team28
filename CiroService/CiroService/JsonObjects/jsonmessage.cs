using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class JsonMessage
    {
        public int convo_id { get; set; }
        public string from { get; set; }
        public string to { get; set; }
        public string message { get; set; }
        public DateTime stamp { get; set; }
    }
}