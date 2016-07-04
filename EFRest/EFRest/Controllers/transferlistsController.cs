using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using EFRest;
using EFRest.Models;
namespace EFRest.Controllers
{
    public class transferlistsController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/transferlists
        public IQueryable<transferlist> Gettransferlists()
        {
            return db.transferlists;
        }

        // GET: api/transferlists/5
        [ResponseType(typeof(transferlist))]
        public async Task<IHttpActionResult> Gettransferlist(int id)
        {
            transferlist transferlist = await db.transferlists.FindAsync(id);
            if (transferlist == null)
            {
                return NotFound();
            }

            return Ok(transferlist);
        }

        // PUT: api/transferlists/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Puttransferlist(int id, transferlist transferlist)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != transferlist.transferlist_id)
            {
                return BadRequest();
            }

            db.Entry(transferlist).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!transferlistExists(id))
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

        // POST: api/transferlists
        [ResponseType(typeof(transferlist))]
        public async Task<IHttpActionResult> Posttransferlist(transferlist transferlist)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.transferlists.Add(transferlist);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = transferlist.transferlist_id }, transferlist);
        }

        // DELETE: api/transferlists/5
        [ResponseType(typeof(transferlist))]
        public async Task<IHttpActionResult> Deletetransferlist(int id)
        {
            transferlist transferlist = await db.transferlists.FindAsync(id);
            if (transferlist == null)
            {
                return NotFound();
            }

            db.transferlists.Remove(transferlist);
            await db.SaveChangesAsync();

            return Ok(transferlist);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool transferlistExists(int id)
        {
            return db.transferlists.Count(e => e.transferlist_id == id) > 0;
        }
    }
}