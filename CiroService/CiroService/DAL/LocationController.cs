using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{

    public class LocationController : IDatabaseOperator<location>
    {
        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<location> addRecord(location location)
        {

            db.locations.Add(location);

            db.SaveChanges();
            return db.locations;
        }

        public IEnumerable<location> deleteRecord(int id)
        {
            location location = db.locations.Find(id);
            if (location == null)
            {
                return null;
            }

            db.locations.Remove(location);
            db.SaveChanges();


            return db.locations;
        }

        public bool exists(int id)
        {
            return db.locations.Count(e => e.location_id == id) > 0;
        }

        public location getRecord(int id)
        {
            location location = db.locations.Find(id);
            if (location == null)
            {
                return null;
            }
            return location;
        }

        public IEnumerable<location> getTable()
        {
            return db.locations;
        }

        public location updateRecord(int id, location location)
        {
            location newInvoice = location;
            if (id != newInvoice.location_id)
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