﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SocialMediaQuery
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class DEV_DB_LICEntities1 : DbContext
    {
        public DEV_DB_LICEntities1()
            : base("name=DEV_DB_LICEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
    
        public virtual int usp_ImportTweetsBySearchId(Nullable<int> searchId)
        {
            var searchIdParameter = searchId.HasValue ?
                new ObjectParameter("SearchId", searchId) :
                new ObjectParameter("SearchId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("usp_ImportTweetsBySearchId", searchIdParameter);
        }
    }
}
