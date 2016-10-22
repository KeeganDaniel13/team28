using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class WarehouseStorageRate
    {
        public string month {get; set;}
        public int incoming {get; set;}
        public int outgoing { get; set; }

    }
}