using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class invoiceController : IDatabaseOperator<invoice>
    {
        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<invoice> addRecord(invoice invoice)
        {

            db.invoices.Add(invoice);
            db.SaveChangesAsync();

            return db.invoices;
        }

        public IEnumerable<invoice> deleteRecord(int id)
        {
            invoice invoice = db.invoices.Find(id);
            if (invoice == null)
            {
                return null;
            }

            db.invoices.Remove(invoice);
            db.SaveChangesAsync();

            return db.invoices;
        }

        public bool exists(int id)
        {
            return db.invoices.Count(e => e.invoice_id == id) > 0;
        }

        public invoice getRecord(int id)
        {

            invoice nuser = null;
            if (exists(id))
            {
                nuser = db.invoices.Find(id);
            }
            if (nuser == null)
            {
                return null;
            }
            return nuser;

        }

        public IEnumerable<invoice> getTable()
        {
            return db.invoices;
        }

        public invoice updateRecord(int id, invoice invoice)
        {
            invoice newInvoice = invoice;
            if (id != newInvoice.invoice_id)
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