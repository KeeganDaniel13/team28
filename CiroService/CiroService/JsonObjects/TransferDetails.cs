using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CiroService.JsonObjects
{
    
    public class TransferDetails
    {
        
        public string currentLocation { get; set; }
        
        public int id { get; set; }
        
        public DateTime dateIssued { get; set; }
        
        public string destination { get; set; }
        
        public string productName{ get; set; }
        
        public string transferName { get; set; }
        
        public int productid { get; set; }
        
    }
}