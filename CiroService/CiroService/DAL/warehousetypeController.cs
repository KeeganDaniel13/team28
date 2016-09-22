using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class warehousetypeController : IDatabaseOperator<warehousetype>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<warehousetype> addRecord(warehousetype warehousetype)
        {

            db.warehousetypes.Add(warehousetype);
            db.SaveChanges();

            return db.warehousetypes;
        }

        public IEnumerable<warehousetype> deleteRecord(int id)
        {
            warehousetype warehousetype = db.warehousetypes.Find(id);
            if (warehousetype == null)
            {
                return null;
            }

            db.warehousetypes.Remove(warehousetype);
            db.SaveChanges();

            return db.warehousetypes;
        }

        public bool exists(int id)
        {
            return db.warehousetypes.Count(e => e.warehousetype_id == id) > 0;
        }

        public warehousetype getRecord(int id)
        {
            warehousetype warehousetype = db.warehousetypes.Find(id);
            if (warehousetype == null)
            {
                return null;
            }
            return warehousetype;
        }

        public IEnumerable<warehousetype> getTable()
        {
            return db.warehousetypes;
        }

        public warehousetype updateRecord(int id, warehousetype warehousetype)
        {
            warehousetype newInvoice = warehousetype;
            if (id != newInvoice.warehousetype_id)
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