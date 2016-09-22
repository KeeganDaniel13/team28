using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class producttypeController : IDatabaseOperator<producttype>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<producttype> addRecord(producttype producttype)
        {

            db.producttypes.Add(producttype);
            db.SaveChanges();

            return db.producttypes;
        }

        public IEnumerable<producttype> deleteRecord(int id)
        {
            producttype producttype = db.producttypes.Find(id);
            if (producttype == null)
            {
                return null;
            }

            db.producttypes.Remove(producttype);
            db.SaveChanges();

            return db.producttypes;
        }

        public bool exists(int id)
        {
            return db.producttypes.Count(e => e.producttype_id == id) > 0;
        }

        public producttype getRecord(int id)
        {
            producttype producttype = db.producttypes.Find(id);
            if (producttype == null)
            {
                return null;
            }
            return producttype;
        }

        public IEnumerable<producttype> getTable()
        {
            return db.producttypes;
        }

        public producttype updateRecord(int id, producttype producttype)
        {
            producttype newInvoice = producttype;
            if (id != newInvoice.producttype_id)
            {
                return null;
            }

            db.Entry(newInvoice).State = EntityState.Modified;

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

            return newInvoice;
        }
    }
}