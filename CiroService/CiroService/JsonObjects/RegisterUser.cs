using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class RegisterUser
    {
        public string fname { get; set; } 
        public int lname { get; set; }
        public int usertype { get; }
        public string email { get; set; }
        public string password { get; set; }

        public RegisterUser()
        {
            usertype = 2;
        }
    }
}