using Auth.Repository.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Auth.Repository.Repository
{
    public interface IRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAll();
        Task<T> GetByID(long Id);
        Task<dynamic> Add(T entity);
        Task<dynamic> Update(T entity);
        //Task<dynamic> Accept(T entity);
        //Task<dynamic> Decline(T entity);
        //Task<dynamic> Delete(long Id);
        //Task<dynamic> Delete(T entity);
        Task<IEnumerable<T>> FindBy(Expression<Func<T, bool>> predicate);
        IQueryable<T> GetByCompanyID(Expression<Func<T, bool>> predicate);
        Task<T> FirstOrDefault(Expression<Func<T, bool>> predicate);
    }
}
