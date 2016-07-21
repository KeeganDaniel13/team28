using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class incidentController : IDatabaseOperator<productincident>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<productincident> addRecord(productincident productincident)
        {

            db.productincidents.Add(productincident);
            db.SaveChangesAsync();

            return db.productincidents;
        }

        public IEnumerable<productincident> deleteRecord(int id)
        {
            productincident productincident = db.productincidents.Find(id);
            if (productincident == null)
            {
                return null;
            }

            db.productincidents.Remove(productincident);
            db.SaveChangesAsync();

            return db.productincidents;
        }

        public bool exists(int id)
        {
            return db.productincidents.Count(e => e.productincident_id == id) > 0;
        }

        public productincident getRecord(int id)
        {
            productincident productincident = db.productincidents.Find(id);
            if (productincident == null)
            {
                return null;
            }
            return productincident;
        }

        public IEnumerable<productincident> getTable()
        {
            return db.productincidents;
        }

        public productincident updateRecord(int id, productincident productincident)
        {
            productincident newInvoice = productincident;
            if (id != newInvoice.productincident_id)
            {
                return null;
            }

            db.Entry(newInvoice).State = EntityState.Modified;

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

            return newInvoice;
        }
    }
}
