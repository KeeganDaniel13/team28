using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class warehouseemployeeController : IDatabaseOperator<warehouseemployee>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<warehouseemployee> addRecord(warehouseemployee warehouseemployee)
        {

            db.warehouseemployees.Add(warehouseemployee);
            db.SaveChangesAsync();

            return db.warehouseemployees;
        }

        public IEnumerable<warehouseemployee> deleteRecord(int id)
        {
            warehouseemployee warehouseemployee = db.warehouseemployees.Find(id);
            if (warehouseemployee == null)
            {
                return null;
            }

            db.warehouseemployees.Remove(warehouseemployee);
            db.SaveChangesAsync();

            return db.warehouseemployees;
        }

        public bool exists(int id)
        {
            return db.warehouseemployees.Count(e => e.warehouseemployee_id == id) > 0;
        }

        public warehouseemployee getRecord(int id)
        {
            warehouseemployee warehouseemployee = db.warehouseemployees.Find(id);
            if (warehouseemployee == null)
            {
                return null;
            }
            return warehouseemployee;
        }

        public IEnumerable<warehouseemployee> getTable()
        {
            return db.warehouseemployees;
        }

        public warehouseemployee updateRecord(int id, warehouseemployee warehouseemployee)
        {
            warehouseemployee newBill = warehouseemployee;
            if (id != newBill.warehouseemployee_id)
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