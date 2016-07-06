using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class usertypeController : IDatabaseOperator<usertype>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<usertype> addRecord(usertype usertype)
        {

            db.usertypes.Add(usertype);
            db.SaveChangesAsync();

            return db.usertypes;
        }

        public IEnumerable<usertype> deleteRecord(int id)
        {
            usertype usertype = db.usertypes.Find(id);
            if (usertype == null)
            {
                return null;
            }

            db.usertypes.Remove(usertype);
            db.SaveChangesAsync();

            return db.usertypes;
        }

        public bool exists(int id)
        {
            return db.usertypes.Count(e => e.usertype_id == id) > 0;
        }

        public usertype getRecord(int id)
        {
            usertype usertype = db.usertypes.Find(id);
            if (usertype == null)
            {
                return null;
            }
            return usertype;
        }

        public IEnumerable<usertype> getTable()
        {
            return db.usertypes;
        }

        public usertype updateRecord(int id, usertype usertype)
        {
            usertype newInvoice = usertype;
            if (id != newInvoice.usertype_id)
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