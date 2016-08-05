using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonReleaseRequest
    {
        public int user_id { get; set; }
        public int product_id { get; set; }
        public string description { get; set; }
        public string verdict { get; set; }
    }
}
