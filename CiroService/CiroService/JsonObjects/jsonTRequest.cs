using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class jsonTRequest
    {
        public int userID { get; set; }
        public int endWarehouse { get; set; }
        public string description  { get; set; }
        public int productID { get; set; }

    }
}