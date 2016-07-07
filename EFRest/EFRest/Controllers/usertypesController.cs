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
    [RoutePrefix("api/usertype")]
    public class usertypesController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/usertypes
        [Route("")]
        public IQueryable<usertype> Getusertypes()
        {
            return db.usertypes;
        }

        // GET: api/usertypes/5
        [ResponseType(typeof(usertype))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Getusertype(int id)
        {
            usertype usertype = await db.usertypes.FindAsync(id);
            if (usertype == null)
            {
                return NotFound();
            }

            return Ok(usertype);
        }

        // PUT: api/usertypes/5
        [ResponseType(typeof(void))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Putusertype(int id, usertype usertype)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usertype.usertype_id)
            {
                return BadRequest();
            }

            db.Entry(usertype).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!usertypeExists(id))
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

        // POST: api/usertypes
        [ResponseType(typeof(usertype))]
        [Route("")]
        public async Task<IHttpActionResult> Postusertype(usertype usertype)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.usertypes.Add(usertype);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = usertype.usertype_id }, usertype);
        }

        // DELETE: api/usertypes/5
        [ResponseType(typeof(usertype))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Deleteusertype(int id)
        {
            usertype usertype = await db.usertypes.FindAsync(id);
            if (usertype == null)
            {
                return NotFound();
            }

            db.usertypes.Remove(usertype);
            await db.SaveChangesAsync();

            return Ok(usertype);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool usertypeExists(int id)
        {
            return db.usertypes.Count(e => e.usertype_id == id) > 0;
        }
    }
}