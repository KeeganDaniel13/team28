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
    
    public partial class product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public product()
        {
<<<<<<< HEAD
            this.billofentries = new HashSet<billofentry>();
            this.ownershiprequests = new HashSet<ownershiprequest>();
=======
>>>>>>> RestWebService
            this.productlogs = new HashSet<productlog>();
            this.releaserequests = new HashSet<releaserequest>();
            this.transferlists = new HashSet<transferlist>();
            this.transferrequests = new HashSet<transferrequest>();
<<<<<<< HEAD
            this.warehousestocks = new HashSet<warehousestock>();
=======
>>>>>>> RestWebService
        }
    
        public int product_id { get; set; }
        public string product_name { get; set; }
        public Nullable<decimal> product_price { get; set; }
        public Nullable<int> product_quantity { get; set; }
<<<<<<< HEAD
        public Nullable<int> product_size { get; set; }
        public string product_location { get; set; }
        public Nullable<System.DateTime> product_arrivalDate { get; set; }
        public Nullable<int> product_producttype { get; set; }
        public Nullable<int> product_hscode { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<billofentry> billofentries { get; set; }
        public virtual hscode hscode { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ownershiprequest> ownershiprequests { get; set; }
        public virtual producttype producttype { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
=======
        public Nullable<int> user_id { get; set; }
        public Nullable<int> producttype_id { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
>>>>>>> RestWebService
        public virtual ICollection<productlog> productlogs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<releaserequest> releaserequests { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transferlist> transferlists { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transferrequest> transferrequests { get; set; }
<<<<<<< HEAD
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<warehousestock> warehousestocks { get; set; }
=======
        public virtual producttype producttype { get; set; }
        public virtual user user { get; set; }
>>>>>>> RestWebService
    }
}
