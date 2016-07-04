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
    public class releaserequestsController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/releaserequests
        public IQueryable<releaserequest> Getreleaserequests()
        {
            return db.releaserequests;
        }

        // GET: api/releaserequests/5
        [ResponseType(typeof(releaserequest))]
        public async Task<IHttpActionResult> Getreleaserequest(int id)
        {
            releaserequest releaserequest = await db.releaserequests.FindAsync(id);
            if (releaserequest == null)
            {
                return NotFound();
            }

            return Ok(releaserequest);
        }

        // PUT: api/releaserequests/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putreleaserequest(int id, releaserequest releaserequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != releaserequest.releaserequest_id)
            {
                return BadRequest();
            }

            db.Entry(releaserequest).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!releaserequestExists(id))
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

        // POST: api/releaserequests
        [ResponseType(typeof(releaserequest))]
        public async Task<IHttpActionResult> Postreleaserequest(releaserequest releaserequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.releaserequests.Add(releaserequest);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = releaserequest.releaserequest_id }, releaserequest);
        }

        // DELETE: api/releaserequests/5
        [ResponseType(typeof(releaserequest))]
        public async Task<IHttpActionResult> Deletereleaserequest(int id)
        {
            releaserequest releaserequest = await db.releaserequests.FindAsync(id);
            if (releaserequest == null)
            {
                return NotFound();
            }

            db.releaserequests.Remove(releaserequest);
            await db.SaveChangesAsync();

            return Ok(releaserequest);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool releaserequestExists(int id)
        {
            return db.releaserequests.Count(e => e.releaserequest_id == id) > 0;
        }
    }
}