using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class hscodeController : IDatabaseOperator<hscode>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<hscode> addRecord(hscode hscode)
        {

            db.hscodes.Add(hscode);
            db.SaveChanges();

            return db.hscodes;
        }

        public IEnumerable<hscode> deleteRecord(int id)
        {
            hscode hscode = db.hscodes.Find(id);
            if (hscode == null)
            {
                return null;
            }

            db.hscodes.Remove(hscode);
            db.SaveChanges();

            return db.hscodes;
        }

        public bool exists(int id)
        {
            return db.hscodes.Count(e => e.hscode_id == id) > 0;
        }

        public hscode getRecord(int id)
        {
            hscode hscode = db.hscodes.Find(id);
            if (hscode == null)
            {
                return null;
            }
            return hscode;
        }

        public IEnumerable<hscode> getTable()
        {
            return db.hscodes;
        }

        public hscode updateRecord(int id, hscode hscode)
        {
            hscode newInvoice = hscode;
            if (id != newInvoice.hscode_id)
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