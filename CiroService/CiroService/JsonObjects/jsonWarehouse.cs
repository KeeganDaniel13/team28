using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CiroService.JsonObjects
{
    [DataContract]
    public class jsonWarehouse
    {
        [DataMember]
        public string name { get; set; }
        [DataMember]
        public int id { get; set; }
        [DataMember]
        public string location { get; set; }
        [DataMember]
        public int size { get; set; }
        [DataMember]
        public string type { get; set; }
    }
}