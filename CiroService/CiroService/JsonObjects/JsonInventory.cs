using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonInventory
    {
        public int warehouseID { get; set; }
        public int productID { get; set; }
        public DateTime lastChecked { get; set; }
        public int size { get; set; }
        public int quantity { get; set; }
        public DateTime arrivalDate { get; set; }
        public int productType { get; set; }
        public int owner { get; set; }
    }
}
