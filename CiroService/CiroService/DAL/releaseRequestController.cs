using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class releaseRequestController : IDatabaseOperator<releaserequest>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<releaserequest> addRecord(releaserequest releaserequest)
        {

            db.releaserequests.Add(releaserequest);
            db.SaveChanges();

            return db.releaserequests;
        }

        public IEnumerable<releaserequest> deleteRecord(int id)
        {
            releaserequest releaserequest = db.releaserequests.Find(id);
            if (releaserequest == null)
            {
                return null;
            }

            db.releaserequests.Remove(releaserequest);
            db.SaveChanges();

            return db.releaserequests;
        }

        public bool exists(int id)
        {
            return db.releaserequests.Count(e => e.releaserequest_id == id) > 0;
        }

        public releaserequest getRecord(int id)
        {
            releaserequest releaserequest = db.releaserequests.Find(id);
            if (releaserequest == null)
            {
                return null;
            }
            return releaserequest;
        }

        public IEnumerable<releaserequest> getTable()
        {
            return db.releaserequests;
        }

        public releaserequest updateRecord(int id, releaserequest releaserequest)
        {
            releaserequest newInvoice = releaserequest;
            if (id != newInvoice.releaserequest_id)
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