using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class transferlistController : IDatabaseOperator<transferlist>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<transferlist> addRecord(transferlist transferlist)
        {

            db.transferlists.Add(transferlist);
            db.SaveChanges();

            return db.transferlists;
        }

        public IEnumerable<transferlist> deleteRecord(int id)
        {
            transferlist transferlist = db.transferlists.Find(id);
            if (transferlist == null)
            {
                return null;
            }

            db.transferlists.Remove(transferlist);
            db.SaveChanges();

            return db.transferlists;
        }

        public bool exists(int id)
        {
            return db.transferlists.Count(e => e.transferlist_id == id) > 0;
        }

        public transferlist getRecord(int id)
        {
            transferlist transferlist = db.transferlists.Find(id);
            if (transferlist == null)
            {
                return null;
            }
            return transferlist;
        }

        public IEnumerable<transferlist> getTable()
        {
            return db.transferlists;
        }

        public transferlist updateRecord(int id, transferlist transferlist)
        {
            transferlist newInvoice = transferlist;
            if (id != newInvoice.transferlist_id)
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