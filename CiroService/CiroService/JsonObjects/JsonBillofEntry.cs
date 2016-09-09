using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonBillofEntry
    {
        public int id { get; set; }
        public int user { get; set; }
        public string billCode { get; set; }
        public int product { get; set; }
        public string origin { get; set; }
        public string productName { get; set; }
        public string ownerEmail { get; set; }
        public int invoice { get; set; }
    }
}
