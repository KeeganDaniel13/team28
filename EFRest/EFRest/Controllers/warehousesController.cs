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
    [RoutePrefix("api/warehouse")]
    public class warehousesController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/warehouses
        [Route("")]
        public IQueryable<warehouse> Getwarehouses()
        {
            return db.warehouses;
        }

        // GET: api/warehouses/5
        [ResponseType(typeof(warehouse))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Getwarehouse(int id)
        {
            warehouse warehouse = await db.warehouses.FindAsync(id);
            if (warehouse == null)
            {
                return NotFound();
            }

            return Ok(warehouse);
        }

        // PUT: api/warehouses/5
        [ResponseType(typeof(void))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Putwarehouse(int id, warehouse warehouse)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != warehouse.warehouse_id)
            {
                return BadRequest();
            }

            db.Entry(warehouse).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!warehouseExists(id))
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

        // POST: api/warehouses
        [ResponseType(typeof(warehouse))]
        [Route("")]
        public async Task<IHttpActionResult> Postwarehouse(warehouse warehouse)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.warehouses.Add(warehouse);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = warehouse.warehouse_id }, warehouse);
        }

        // DELETE: api/warehouses/5
        [ResponseType(typeof(warehouse))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Deletewarehouse(int id)
        {
            warehouse warehouse = await db.warehouses.FindAsync(id);
            if (warehouse == null)
            {
                return NotFound();
            }

            db.warehouses.Remove(warehouse);
            await db.SaveChangesAsync();

            return Ok(warehouse);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool warehouseExists(int id)
        {
            return db.warehouses.Count(e => e.warehouse_id == id) > 0;
        }
    }
}