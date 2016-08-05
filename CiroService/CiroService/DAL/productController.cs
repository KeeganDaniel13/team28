using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class productController: IDatabaseOperator<product>
    {

        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<product> addRecord(product product)
        {

            db.products.Add(product);

            db.SaveChanges();
            return db.products;
        }

        public IEnumerable<product> deleteRecord(int id)
        {
            product product = db.products.Find(id);
            if (product == null)
            {
                return null;
            }

            db.products.Remove(product);
            db.SaveChanges();


            return db.products;
        }

        public bool exists(int id)
        {
            return db.products.Count(e => e.product_id == id) > 0;
        }

        public product getRecord(int id)
        {
            product product = db.products.Find(id);
            if (product == null)
            {
                return null;
            }
            return product;
        }

        public IEnumerable<product> getTable()
        {
            return db.products;
        }

        public product updateRecord(int id, product product)
        {
            product newInvoice = product;
            if (id != newInvoice.product_id)
            {
                return null;
            }

            db.Entry(newInvoice).State = EntityState.Modified;

            try
            {

                db.SaveChanges();
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