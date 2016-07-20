using CiroService.DAL;
using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class warehousestockController : IDatabaseOperator<warehousestock>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<warehousestock> addRecord(warehousestock warehousestock)
        {

            db.warehousestocks.Add(warehousestock);
            db.SaveChangesAsync();

            return db.warehousestocks;
        }

        public IEnumerable<warehousestock> deleteRecord(int id)
        {
            warehousestock warehousestock = db.warehousestocks.Find(id);
            if (warehousestock == null)
            {
                return null;
            }

            db.warehousestocks.Remove(warehousestock);
            db.SaveChangesAsync();

            return db.warehousestocks;
        }

        public bool exists(int id)
        {
            return db.warehousestocks.Count(e => e.warehousestock_id == id) > 0;
        }

        public warehousestock getRecord(int id)
        {
            warehousestock warehousestock = db.warehousestocks.Find(id);
            if (warehousestock == null)
            {
                return null;
            }
            return warehousestock;
        }

        public IEnumerable<warehousestock> getTable()
        {
            return db.warehousestocks;
        }

        public warehousestock updateRecord(int id, warehousestock warehousestock)
        {
            warehousestock newInvoice = warehousestock;
            if (id != newInvoice.warehousestock_id)
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
