//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EFRest.Models
{
    using System;
    using System.Collections.Generic;

    [Serializable]
    public partial class warehouse
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public warehouse()
        {
            this.transferlists = new HashSet<transferlist>();
        }
    
        public int warehouse_id { get; set; }
        public string warehouse_name { get; set; }
        public string warehouse_location { get; set; }
        public Nullable<int> warehouse_size { get; set; }
        public Nullable<int> warehouse_warehousetypeid { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transferlist> transferlists { get; set; }
        public virtual warehousetype warehousetype { get; set; }
    }
}
