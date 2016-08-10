using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class JsonUser
    {
        public int id { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }
        public int usertype { get; set; }
        public string usertypename { get; set; }
        public string email { get; set; }
        public string password { get; set; }

    }
}