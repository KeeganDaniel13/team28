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
    public class producttypesController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/producttypes
        public IQueryable<producttype> Getproducttypes()
        {
            return db.producttypes;
        }

        // GET: api/producttypes/5
        [ResponseType(typeof(producttype))]
        public async Task<IHttpActionResult> Getproducttype(int id)
        {
            producttype producttype = await db.producttypes.FindAsync(id);
            if (producttype == null)
            {
                return NotFound();
            }

            return Ok(producttype);
        }

        // PUT: api/producttypes/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putproducttype(int id, producttype producttype)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != producttype.producttype_id)
            {
                return BadRequest();
            }

            db.Entry(producttype).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!producttypeExists(id))
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

        // POST: api/producttypes
        [ResponseType(typeof(producttype))]
        public async Task<IHttpActionResult> Postproducttype(producttype producttype)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.producttypes.Add(producttype);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = producttype.producttype_id }, producttype);
        }

        // DELETE: api/producttypes/5
        [ResponseType(typeof(producttype))]
        public async Task<IHttpActionResult> Deleteproducttype(int id)
        {
            producttype producttype = await db.producttypes.FindAsync(id);
            if (producttype == null)
            {
                return NotFound();
            }

            db.producttypes.Remove(producttype);
            await db.SaveChangesAsync();

            return Ok(producttype);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool producttypeExists(int id)
        {
            return db.producttypes.Count(e => e.producttype_id == id) > 0;
        }
    }
}