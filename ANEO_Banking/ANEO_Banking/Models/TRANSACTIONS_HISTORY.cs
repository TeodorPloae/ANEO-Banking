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
    
    public partial class TRANSACTIONS_HISTORY
    {
        public decimal ID_TRANSACTION { get; set; }
        public Nullable<decimal> AMOUNT { get; set; }
        public Nullable<System.DateTime> CREATED_AT { get; set; }
        public Nullable<System.DateTime> UPDATED_AT { get; set; }
    
        public virtual TRANSACTIONS TRANSACTIONS { get; set; }
    }
}
