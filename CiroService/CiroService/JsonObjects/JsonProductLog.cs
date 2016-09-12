using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonProductLog
    {
        public int id { get; set; }
        public int product_id { get; set; }
        public string description { get; set; }
        public DateTime date { get; set; }
        public int userID { get; set; }
        public int logtype { get; set; }
        public string logtypename { get; set; }
    }
}
