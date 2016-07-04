using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using EFRest;
using EFRest.Models;
namespace EFRest.Controllers
{
    public class invoicesController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/invoices
        public IQueryable<invoice> Getinvoices()
        {
            return db.invoices;
        }

        // GET: api/invoices/5
        [ResponseType(typeof(invoice))]
        public IHttpActionResult Getinvoice(int id)
        {
            invoice invoice = db.invoices.Find(id);
            if (invoice == null)
            {
                return NotFound();
            }

            return Ok(invoice);
        }

        // PUT: api/invoices/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putinvoice(int id, invoice invoice)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != invoice.invoice_id)
            {
                return BadRequest();
            }

            db.Entry(invoice).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!invoiceExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/invoices
        [ResponseType(typeof(invoice))]
        public IHttpActionResult Postinvoice(invoice invoice)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.invoices.Add(invoice);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = invoice.invoice_id }, invoice);
        }

        // DELETE: api/invoices/5
        [ResponseType(typeof(invoice))]
        public IHttpActionResult Deleteinvoice(int id)
        {
            invoice invoice = db.invoices.Find(id);
            if (invoice == null)
            {
                return NotFound();
            }

            db.invoices.Remove(invoice);
            db.SaveChanges();

            return Ok(invoice);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool invoiceExists(int id)
        {
            return db.invoices.Count(e => e.invoice_id == id) > 0;
        }
    }
}