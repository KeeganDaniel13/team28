using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class transferrequestsController : IDatabaseOperator<transferrequest>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<transferrequest> addRecord(transferrequest transferrequest)
        {

            db.transferrequests.Add(transferrequest);
            db.SaveChangesAsync();

            return db.transferrequests;
        }

        public IEnumerable<transferrequest> deleteRecord(int id)
        {
            transferrequest transferrequest = db.transferrequests.Find(id);
            if (transferrequest == null)
            {
                return null;
            }

            db.transferrequests.Remove(transferrequest);
            db.SaveChangesAsync();

            return db.transferrequests;
        }

        public bool exists(int id)
        {
            return db.transferrequests.Count(e => e.transferrequest_id == id) > 0;
        }

        public transferrequest getRecord(int id)
        {
            transferrequest transferrequest = db.transferrequests.Find(id);
            if (transferrequest == null)
            {
                return null;
            }
            return transferrequest;
        }

        public IEnumerable<transferrequest> getTable()
        {
            return db.transferrequests;
        }

        public transferrequest updateRecord(int id, transferrequest transferrequest)
        {
            transferrequest newInvoice = transferrequest;
            if (id != newInvoice.transferrequest_id)
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