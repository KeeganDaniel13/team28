//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CiroService.EFDatabase
{
    using System;
    using System.Collections.Generic;
    
    public partial class transferrequest
    {
        public int transferrequest_id { get; set; }
        public string transferrequest_from { get; set; }
        public string transferrequest_to { get; set; }
        public string transferrequest_description { get; set; }
        public Nullable<int> user_id_transferrequest { get; set; }
        public Nullable<int> package_id_transferrequest { get; set; }
    
        public virtual product product { get; set; }
        public virtual user user { get; set; }
    }
}