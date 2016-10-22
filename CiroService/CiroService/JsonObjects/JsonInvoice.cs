using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonInvoice
    {
        public string id { get; set; }
        public double vat { get; set; }
        public double penalty { get; set; }
        public double paid { get; set; }
    }
}
