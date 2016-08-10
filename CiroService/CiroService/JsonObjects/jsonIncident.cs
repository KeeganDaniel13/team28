using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CiroService.JsonObjects
{
    [DataContract]
    public class jsonIncident
    {
        [DataMember]
        public string description { get; set; }
        [DataMember]
        public String image { get; set; }
        [DataMember]
        public int productID { get; set; }
        public int userID { get; set; }
        public int type { get; set; }
    }
}