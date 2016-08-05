using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CiroService.JsonObjects
{
    [DataContract]
    public class stockTakeInfo
    {
        [DataMember]
        public int id { get; set; }
        [DataMember]
        public string location { get; set; }
    }
}