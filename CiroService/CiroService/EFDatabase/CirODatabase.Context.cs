﻿

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
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class custommandbEntities1 : DbContext
{
    public custommandbEntities1()
        : base("name=custommandbEntities1")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<product> products { get; set; }

    public virtual DbSet<productlog> productlogs { get; set; }

    public virtual DbSet<producttype> producttypes { get; set; }

    public virtual DbSet<releaserequest> releaserequests { get; set; }

    public virtual DbSet<transferlist> transferlists { get; set; }

    public virtual DbSet<transferrequest> transferrequests { get; set; }

    public virtual DbSet<user> users { get; set; }

    public virtual DbSet<usertype> usertypes { get; set; }

    public virtual DbSet<warehouse> warehouses { get; set; }

    public virtual DbSet<warehousetype> warehousetypes { get; set; }

    public virtual DbSet<warehousestock> warehousestocks { get; set; }

    public virtual DbSet<billofentry> billofentries { get; set; }

    public virtual DbSet<countryrelation> countryrelations { get; set; }

    public virtual DbSet<hscode> hscodes { get; set; }

    public virtual DbSet<message> messages { get; set; }

    public virtual DbSet<productlogtype> productlogtypes { get; set; }

}

}

