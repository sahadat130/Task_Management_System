using Auth.Repository.Model.Entity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Auth.Repository.Repository
{
    public class GenericRepository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        internal AuthDBContext context;
        internal DbSet<TEntity> dbSet;

        public GenericRepository(AuthDBContext context)
        {
            this.context = context;
            this.dbSet = context.Set<TEntity>();
        }
        public virtual async Task<TEntity> FirstOrDefault(Expression<Func<TEntity, bool>> predicate)
        {
            try
            {
                TEntity query = dbSet.FirstOrDefault(predicate);
                return await Task.FromResult(query);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public virtual async Task<IEnumerable<TEntity>> GetAll()
        {
            try
            {
                IEnumerable<TEntity> query = dbSet;
                return await Task.FromResult(query.ToList());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public virtual async Task<TEntity> GetByID(long Id)
        {
            try
            {
                return await Task.FromResult(dbSet.Find(Id));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public virtual async Task<IEnumerable<TEntity>> FindBy(Expression<Func<TEntity, bool>> predicate)
        {
            try
            {
                dynamic query = dbSet.Where(predicate);
                return await Task.FromResult(query);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public virtual async Task<dynamic> Add(TEntity entity)
        {
            try
            {
                dbSet.Add(entity);
                return await Save(1);
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            return 0;
        }
        public virtual async Task<dynamic> Update(TEntity entityToUpdate)
        {
            try
            {
                dbSet.Attach(entityToUpdate);
                context.Entry(entityToUpdate).State = EntityState.Modified;
                return await Save(2);
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            return 0;
        }
        //public virtual async Task<dynamic> Accept(TEntity entityToAccept)
        //{
        //    try
        //    {
        //        dbSet.Attach(entityToAccept);
        //        context.Entry(entityToAccept).State = EntityState.Modified;
        //        return await Save(3);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public virtual async Task<dynamic> Decline(TEntity entityToDecline)
        //{
        //    try
        //    {
        //        dbSet.Attach(entityToDecline);
        //        context.Entry(entityToDecline).State = EntityState.Modified;
        //        return await Save(4);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public virtual async Task<dynamic> Delete(TEntity entityToDelete)
        //{
        //    try
        //    {
        //        if (context.Entry(entityToDelete).State == EntityState.Detached)
        //        {
        //            dbSet.Attach(entityToDelete);
        //        }
        //        dbSet.Remove(entityToDelete);
        //        return await Save(5);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public virtual async Task<dynamic> Delete(long Id)
        //{
        //    try
        //    {
        //        TEntity entity = dbSet.Find(Id);
        //        dbSet.Attach(entity);
        //        context.Entry(entity).State = EntityState.Deleted;
        //        return await Save(5);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        public async Task<int> GetMaxID(Expression<Func<TEntity, int>> predicate)
        {
            dynamic result = dbSet.Max(predicate) + 1;
            return await Task.FromResult(result);
        }

        public async Task<dynamic> Save(int option)
        {
            try
            {
                var res = await Task.FromResult(context.SaveChanges());
                if (res == 1 && option == 1)
                {
                    return "Data Saved Successfullly";
                }
                if (res == 1 && option == 2)
                {
                    return "Data Updated Successfully";
                }
                if (res == 1 && option == 3)
                {
                    return "Data Accepted Successfully";
                }
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Trace.TraceInformation("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
            return null;
        }
        public IQueryable<TEntity> GetByCompanyID(Expression<Func<TEntity, bool>> predicate)
        {
            IQueryable<TEntity> query = dbSet.Where(predicate);
            return query;
        }
        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
