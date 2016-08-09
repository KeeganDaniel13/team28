using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Ciro.Clients
{
    public class User
    {
        public string fname { get; set; }
        public string lname { get; set; }
        public int usertype { get; }
        public string email { get; set; }
        public string password { get; set; }
    }
}