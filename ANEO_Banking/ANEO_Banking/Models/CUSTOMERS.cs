//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ANEO_Banking.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CUSTOMERS
    {
        public CUSTOMERS()
        {
            this.CUSTOMER_CREDIT_CARDS = new HashSet<CUSTOMER_CREDIT_CARDS>();
        }
    
        public decimal ID { get; set; }
        public string NUME { get; set; }
        public string PRENUME { get; set; }
        public Nullable<System.DateTime> CREATED_AT { get; set; }
        public Nullable<System.DateTime> UPDATED_AT { get; set; }
    
        public virtual ICollection<CUSTOMER_CREDIT_CARDS> CUSTOMER_CREDIT_CARDS { get; set; }
    }
}
