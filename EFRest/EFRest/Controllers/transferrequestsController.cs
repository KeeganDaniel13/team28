using EFRest.Models;
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

namespace EFRest.Controllers
{
    [RoutePrefix("api/transferrequest")]
    public class transferrequestsController : ApiController
    {
        private custommandbEntities db = new custommandbEntities();

        // GET: api/transferrequests
        [Route("")]
        public IQueryable<transferrequest> Gettransferrequests()
        {
            return db.transferrequests;
        }

        // GET: api/transferrequests/5
        [ResponseType(typeof(transferrequest))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Gettransferrequest(int id)
        {
            transferrequest transferrequest = await db.transferrequests.FindAsync(id);
            if (transferrequest == null)
            {
                return NotFound();
            }

            return Ok(transferrequest);
        }

        // PUT: api/transferrequests/5
        [ResponseType(typeof(void))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Puttransferrequest(int id, transferrequest transferrequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != transferrequest.transferrequest_id)
            {
                return BadRequest();
            }

            db.Entry(transferrequest).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!transferrequestExists(id))
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

        // POST: api/transferrequests
        [ResponseType(typeof(transferrequest))]
        [Route("")]
        public async Task<IHttpActionResult> Posttransferrequest(transferrequest transferrequest)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.transferrequests.Add(transferrequest);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = transferrequest.transferrequest_id }, transferrequest);
        }

        // DELETE: api/transferrequests/5
        [ResponseType(typeof(transferrequest))]
        [Route("{id:int}")]
        public async Task<IHttpActionResult> Deletetransferrequest(int id)
        {
            transferrequest transferrequest = await db.transferrequests.FindAsync(id);
            if (transferrequest == null)
            {
                return NotFound();
            }

            db.transferrequests.Remove(transferrequest);
            await db.SaveChangesAsync();

            return Ok(transferrequest);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool transferrequestExists(int id)
        {
            return db.transferrequests.Count(e => e.transferrequest_id == id) > 0;
        }
    }
}