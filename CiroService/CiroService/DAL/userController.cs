﻿using CiroService.EFDatabase;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace CiroService.DAL
{
    public class userController : IDatabaseOperator<user>
    {
        custommandbEntities1 db = new custommandbEntities1();

        public IEnumerable<user> addUser(user user)
        {

            db.users.Add(user);
            db.SaveChangesAsync();

            return db.users;
        }

        public IEnumerable<user> deleteRecord(int id)
        {
            user user = db.users.Find(id);
            if (user == null)
            {
                return null;
            }

            db.users.Remove(user);
            db.SaveChangesAsync();

            return db.users;
        }

        public bool exists(int id)
        {
            return db.users.Count(e => e.user_id == id) > 0;
        }

        public user getRecord(int id)
        {
            user user = db.users.Find(id);
            if (user == null)
            {
                return null;
            }
            return user;
        }

        public IEnumerable<user> getTable()
        {
            return db.users;
        }

        public user updateRecord(int id, user user)
        {
            user newInvoice = user;
            if (id != newInvoice.user_id)
            {
                return null;
            }

            db.Entry(newInvoice).State = EntityState.Modified;

            try
            {
                db.SaveChangesAsync();
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