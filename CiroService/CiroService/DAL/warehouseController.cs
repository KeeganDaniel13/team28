using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class warehouseController : IDatabaseOperator<warehouse>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<warehouse> addRecord(warehouse warehouse)
        {

            db.warehouses.Add(warehouse);
            db.SaveChangesAsync();

            return db.warehouses;
        }

        public IEnumerable<warehouse> deleteRecord(int id)
        {
            warehouse warehouse = db.warehouses.Find(id);
            if (warehouse == null)
            {
                return null;
            }

            db.warehouses.Remove(warehouse);
            db.SaveChangesAsync();

            return db.warehouses;
        }

        public bool exists(int id)
        {
            return db.warehouses.Count(e => e.warehouse_id == id) > 0;
        }

        public warehouse getRecord(int id)
        {
            warehouse warehouse = db.warehouses.Find(id);
            if (warehouse == null)
            {
                return null;
            }
            return warehouse;
        }

        public IEnumerable<warehouse> getTable()
        {
            return db.warehouses;
        }

        public warehouse updateRecord(int id, warehouse warehouse)
        {
            warehouse newInvoice = warehouse;
            if (id != newInvoice.warehouse_id)
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