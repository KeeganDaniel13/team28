using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroWebsite
{
    public class TransferForm
    {
        public string container { get; set; }
        public string origin { get; set; }
        public string transport { get; set; }
        public double mass { get; set; }
        public DateTime date { get; set; }
        public string description { get; set; }
        public string transferReason {get;set;}

           
    }
}