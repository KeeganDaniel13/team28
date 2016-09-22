using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonWarehouse
    {
        public int id { get; set; }
        public string name { get; set; }
        public string location { get; set; }
        public int size { get; set; }
        public int warehousetype { get; set; }
        public int user { get; set; }
        public double available { get; set; }
        public string descrption { get; set; }
    }
}
