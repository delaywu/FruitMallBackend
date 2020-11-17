using Dapper;
using FruitMall.Site.Domain.IRepositories;
using FruitMall.Site.Infrastructure.DapperExtensions;
using FruitMall.Site.Infrastructure.Entity;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace FruitMall.Site.Services
{
    public class RepositoriesBase<TEntity, TKey> : IRepositoriesBase<TEntity, TKey> where TEntity : IEntity<TKey>
    {
        public int Count(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return DB.Read().ExecuteScalar<int>(sql, param, commandType: commandType);
        }

        public async Task<int> CountAsync(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return await DB.Read().ExecuteScalarAsync<int>(sql,param, commandType: commandType);
        }

        public IEnumerable<TEntity> Entities(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return DB.Read().Query<TEntity>(sql,param, commandType: commandType);
        }

        public Task<IEnumerable<TEntity>> EntitiesAsync(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return DB.Read().QueryAsync<TEntity>(sql, param, commandType: commandType);
        }

        public T Insert<T>(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return DB.Write().ExecuteScalar<T>(sql, param, commandType: commandType);
        }

        public async Task<T> InsertAsync<T>(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return await DB.Write().ExecuteScalarAsync<T>(sql, param, commandType: commandType);
        }

        public bool Execute(string sql, object param, CommandType commandType = CommandType.Text)
        { 
            return DB.Write().Execute(sql, param, commandType: commandType) > 0;
        }

        public async Task<bool> ExecuteAsync(string sql, object param, CommandType commandType = CommandType.Text)
        {
            return await DB.Write().ExecuteAsync(sql, param, commandType: commandType) > 0;
        } 
    }
}
