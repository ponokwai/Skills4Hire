//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Skills4Hire
{
    using System;
    using System.Collections.Generic;
    
    public partial class jobprofile
    {
        public int idJobProfile { get; set; }
        public Nullable<int> JobStatusId { get; set; }
        public Nullable<int> StartTimeId { get; set; }
        public Nullable<int> JobLocationStateId { get; set; }
        public Nullable<int> JobLocationLGId { get; set; }
        public string JobLocationTown { get; set; }
        public string JobTitle { get; set; }
        public string JobDescription { get; set; }
        public Nullable<int> SkillId { get; set; }
        public string SpecificSkill { get; set; }
        public Nullable<int> BudgetId { get; set; }
        public string ContactFullName { get; set; }
        public string ContactNumber { get; set; }
        public string ContactEmail { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<System.DateTime> LastModified { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public string LastModifiedBy { get; set; }
        public Nullable<bool> Publicise { get; set; }
    
        public virtual budget budget { get; set; }
        public virtual jobstatu jobstatu { get; set; }
        public virtual localgovtofresidence localgovtofresidence { get; set; }
        public virtual skill skill { get; set; }
        public virtual starttime starttime { get; set; }
        public virtual stateofresidence stateofresidence { get; set; }
    }
}
