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
    [RoutePrefix("api/warehousetype")]
    public class warehousetypesController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/warehousetypes
        [Route("")]
        public IQueryable<warehousetype> Getwarehousetypes()
        {
            return db.warehousetypes;
        }

        // GET: api/warehousetypes/5
        [ResponseType(typeof(warehousetype))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Getwarehousetype(int id)
        {
            warehousetype warehousetype = await db.warehousetypes.FindAsync(id);
            if (warehousetype == null)
            {
                return NotFound();
            }

            return Ok(warehousetype);
        }

        // PUT: api/warehousetypes/5
        [ResponseType(typeof(void))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Putwarehousetype(int id, warehousetype warehousetype)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != warehousetype.warehousetype_id)
            {
                return BadRequest();
            }

            db.Entry(warehousetype).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!warehousetypeExists(id))
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

        // POST: api/warehousetypes
        [ResponseType(typeof(warehousetype))]
        [Route("")]
        public async Task<IHttpActionResult> Postwarehousetype(warehousetype warehousetype)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.warehousetypes.Add(warehousetype);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = warehousetype.warehousetype_id }, warehousetype);
        }

        // DELETE: api/warehousetypes/5
        [ResponseType(typeof(warehousetype))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Deletewarehousetype(int id)
        {
            warehousetype warehousetype = await db.warehousetypes.FindAsync(id);
            if (warehousetype == null)
            {
                return NotFound();
            }

            db.warehousetypes.Remove(warehousetype);
            await db.SaveChangesAsync();

            return Ok(warehousetype);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool warehousetypeExists(int id)
        {
            return db.warehousetypes.Count(e => e.warehousetype_id == id) > 0;
        }
    }
}