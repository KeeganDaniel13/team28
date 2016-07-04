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
    public class productlogsController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/productlogs
        public IQueryable<productlog> Getproductlogs()
        {
            return db.productlogs;
        }

        // GET: api/productlogs/5
        [ResponseType(typeof(productlog))]
        public async Task<IHttpActionResult> Getproductlog(int id)
        {
            productlog productlog = await db.productlogs.FindAsync(id);
            if (productlog == null)
            {
                return NotFound();
            }

            return Ok(productlog);
        }

        // PUT: api/productlogs/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putproductlog(int id, productlog productlog)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != productlog.productlog_id)
            {
                return BadRequest();
            }

            db.Entry(productlog).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!productlogExists(id))
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

        // POST: api/productlogs
        [ResponseType(typeof(productlog))]
        public async Task<IHttpActionResult> Postproductlog(productlog productlog)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.productlogs.Add(productlog);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = productlog.productlog_id }, productlog);
        }

        // DELETE: api/productlogs/5
        [ResponseType(typeof(productlog))]
        public async Task<IHttpActionResult> Deleteproductlog(int id)
        {
            productlog productlog = await db.productlogs.FindAsync(id);
            if (productlog == null)
            {
                return NotFound();
            }

            db.productlogs.Remove(productlog);
            await db.SaveChangesAsync();

            return Ok(productlog);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool productlogExists(int id)
        {
            return db.productlogs.Count(e => e.productlog_id == id) > 0;
        }
    }
}