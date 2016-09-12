using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonMessage
    {
        public int id { get; set; }
        public int convo_id { get; set; }
        public string to { get; set; }
        public string from { get; set; }
        public string message { get; set; }
        public DateTime stamp { get; set; }
        public string subject { get; set; }
    }
}
