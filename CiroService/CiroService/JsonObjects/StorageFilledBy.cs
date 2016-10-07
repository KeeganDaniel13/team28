using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.JsonObjects
{
    public class StorageFilledBy
    {
        public string warehouse { get; set; }
        public double DaysTilFull { get; set; }
    }
}