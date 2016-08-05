using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonOwnershipReq
    {
        public int id { get; set; }
        public int prevOwner { get; set; }
        public int newOwner { get; set; }
        public string acceptance { get; set; }

        public int product { get; set; }
    }
}
