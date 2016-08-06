using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonWarehouseStock
    {
        public int id { get; set; }
        public DateTime lastChecked { get; set; }
        public int warehouse { get; set; }
        public int product { get; set; }
    }
}
