﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CiroService.JsonObjects
{
    public class JsonProducts
    {
        public int id { get; set; }
        public string name { get; set; }
        public double price { get; set; }
        public int quantity { get; set; }
        public int producttype { get; set; }
        public int userid { get; set; }
        public string location { get; set; }
        public DateTime arrivalDate { get; set; }
        public string destination { get; set; }
        public string isInspected { get; set; }
        public string status { get; set; }
    }
}