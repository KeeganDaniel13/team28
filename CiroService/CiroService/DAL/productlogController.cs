﻿using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class productlogController : IDatabaseOperator<productlog>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<productlog> addRecord(productlog productlog)
        {

            db.productlogs.Add(productlog);
            db.SaveChanges();

            return db.productlogs;
        }

        public IEnumerable<productlog> deleteRecord(int id)
        {
            productlog productlog = db.productlogs.Find(id);
            if (productlog == null)
            {
                return null;
            }

            db.productlogs.Remove(productlog);
            db.SaveChanges();

            return db.productlogs;
        }

        public bool exists(int id)
        {
            return db.productlogs.Count(e => e.productlog_id == id) > 0;
        }

        public productlog getRecord(int id)
        {
            productlog productlog = db.productlogs.Find(id);
            if (productlog == null)
            {
                return null;
            }
            return productlog;
        }

        public IEnumerable<productlog> getTable()
        {
            return db.productlogs;
        }

        public productlog updateRecord(int id, productlog productlog)
        {

            productlog newproductlog = productlog;
            if (id != newproductlog.productlog_id)

            {
                return null;
            }

            db.Entry(newproductlog).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!exists(id))
                {
                    return null;
                }
                else
                {
                    throw;
                }
            }

            return newproductlog;

        }
    }
}