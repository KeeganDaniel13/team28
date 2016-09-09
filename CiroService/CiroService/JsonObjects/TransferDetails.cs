using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CiroService.JsonObjects
{
    [DataContract]
    public class TransferDetails
    {
        [DataMember]
        public string currentLocation { get; set; }
        [DataMember]
        public string destination { get; set; }
        [DataMember]
        public string productName{ get; set; }
        public string transferName { get; set; }
        public int productid { get; set; }
        
    }
}