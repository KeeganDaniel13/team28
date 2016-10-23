using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class warehousetaskController : IDatabaseOperator<warehousetask>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<warehousetask> addRecord(warehousetask warehousetask)
        {

            db.warehousetasks.Add(warehousetask);
            db.SaveChangesAsync();

            return db.warehousetasks;
        }

        public IEnumerable<warehousetask> deleteRecord(int id)
        {
            warehousetask warehousetask = db.warehousetasks.Find(id);
            if (warehousetask == null)
            {
                return null;
            }

            db.warehousetasks.Remove(warehousetask);
            db.SaveChangesAsync();

            return db.warehousetasks;
        }

        public bool exists(int id)
        {
            return db.warehousetasks.Count(e => e.warehousetask_id == id) > 0;
        }

        public warehousetask getRecord(int id)
        {
            warehousetask warehousetask = db.warehousetasks.Find(id);
            if (warehousetask == null)
            {
                return null;
            }
            return warehousetask;
        }

        public IEnumerable<warehousetask> getTable()
        {
            return db.warehousetasks;
        }

        public warehousetask updateRecord(int id, warehousetask warehousetask)
        {
            warehousetask newBill = warehousetask;
            if (id != newBill.warehousetask_id)
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