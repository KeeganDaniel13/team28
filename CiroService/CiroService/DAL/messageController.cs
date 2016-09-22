using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class messageController : IDatabaseOperator<message>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<message> addRecord(message message)
        {

            db.messages.Add(message);
            db.SaveChanges();

            return db.messages;
        }

        public IEnumerable<message> deleteRecord(int id)
        {
            message message = db.messages.Find(id);
            if (message == null)
            {
                return null;
            }

            db.messages.Remove(message);
            db.SaveChanges();

            return db.messages;
        }

        public bool exists(int id)
        {
            return db.messages.Count(e => e.message_id == id) > 0;
        }

        public message getRecord(int id)
        {
            message message = db.messages.Find(id);
            if (message == null)
            {
                return null;
            }
            return message;
        }

        public IEnumerable<message> getTable()
        {
            return db.messages;
        }

        public message updateRecord(int id, message message)
        {
            message newInvoice = message;
            if (id != newInvoice.message_id)
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