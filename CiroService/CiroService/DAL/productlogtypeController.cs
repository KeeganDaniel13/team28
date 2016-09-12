using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;


namespace CiroService.DAL
{
    public class productlogtypeController : IDatabaseOperator<productlogtype>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<productlogtype> addRecord(productlogtype productlogtype)
        {

            db.productlogtypes.Add(productlogtype);
            db.SaveChangesAsync();

            return db.productlogtypes;
        }

        public IEnumerable<productlogtype> deleteRecord(int id)
        {
            productlogtype productlogtype = db.productlogtypes.Find(id);
            if (productlogtype == null)
            {
                return null;
            }

            db.productlogtypes.Remove(productlogtype);
            db.SaveChangesAsync();

            return db.productlogtypes;
        }

        public bool exists(int id)
        {
            return db.productlogtypes.Count(e => e.productlogtype_id == id) > 0;
        }

        public productlogtype getRecord(int id)
        {
            productlogtype productlogtype = db.productlogtypes.Find(id);
            if (productlogtype == null)
            {
                return null;
            }
            return productlogtype;
        }

        public IEnumerable<productlogtype> getTable()
        {
            return db.productlogtypes;
        }

        public productlogtype updateRecord(int id, productlogtype productlogtype)
        {
            productlogtype newBill = productlogtype;
            if (id != newBill.productlogtype_id)
            {
                return null;
            }

            db.Entry(newBill).State = EntityState.Modified;

            try
            {
                db.SaveChangesAsync();
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
            return newBill;

        }
    }
}