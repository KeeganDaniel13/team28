using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class ownershipRequestController : IDatabaseOperator<ownershiprequest>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<ownershiprequest> addRecord(ownershiprequest ownershiprequest)
        {

            db.ownershiprequests.Add(ownershiprequest);
            db.SaveChanges();

            return db.ownershiprequests;
        }

        public IEnumerable<ownershiprequest> deleteRecord(int id)
        {
            ownershiprequest ownershiprequest = db.ownershiprequests.Find(id);
            if (ownershiprequest == null)
            {
                return null;
            }

            db.ownershiprequests.Remove(ownershiprequest);
            db.SaveChanges();

            return db.ownershiprequests;
        }

        public bool exists(int id)
        {
            return db.ownershiprequests.Count(e => e.ownershiprequest_id == id) > 0;
        }

        public ownershiprequest getRecord(int id)
        {
            ownershiprequest ownershiprequest = db.ownershiprequests.Find(id);
            if (ownershiprequest == null)
            {
                return null;
            }
            return ownershiprequest;
        }

        public IEnumerable<ownershiprequest> getTable()
        {
            return db.ownershiprequests;
        }

        public ownershiprequest updateRecord(int id, ownershiprequest ownershiprequest)
        {
            ownershiprequest newInvoice = ownershiprequest;
            if (id != newInvoice.ownershiprequest_id)
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