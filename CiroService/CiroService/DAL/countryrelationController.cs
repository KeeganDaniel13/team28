using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class countryRelationController : IDatabaseOperator<countryrelation>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<countryrelation> addRecord(countryrelation countryrelation)
        {

            db.countryrelations.Add(countryrelation);
            db.SaveChangesAsync();

            return db.countryrelations;
        }

        public IEnumerable<countryrelation> deleteRecord(int id)
        {
            countryrelation countryrelation = db.countryrelations.Find(id);
            if (countryrelation == null)
            {
                return null;
            }

            db.countryrelations.Remove(countryrelation);
            db.SaveChangesAsync();

            return db.countryrelations;
        }

        public bool exists(int id)
        {
            return db.countryrelations.Count(e => e.countryrelation_id == id) > 0;
        }

        public countryrelation getRecord(int id)
        {
            countryrelation countryrelation = db.countryrelations.Find(id);
            if (countryrelation == null)
            {
                return null;
            }
            return countryrelation;
        }

        public IEnumerable<countryrelation> getTable()
        {
            return db.countryrelations;
        }

        public countryrelation updateRecord(int id, countryrelation countryrelation)
        {
            countryrelation newBill = countryrelation;
            if (id != newBill.countryrelation_id)
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