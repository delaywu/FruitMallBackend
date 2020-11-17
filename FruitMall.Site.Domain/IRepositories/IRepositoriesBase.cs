using FruitMall.Site.Domain.Entities;
using FruitMall.Site.Infrastructure.Entity;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace FruitMall.Site.Domain.IRepositories
{
    public interface IRepositoriesBase<TEntity,TKey> : IDependency where TEntity : IEntity<TKey>
    {
        #region 01 查询 实体集合
        /// <summary>
        /// 查询 实体基本信息 （同步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>实体集合</returns>
        IEnumerable<TEntity> Entities(string sql, object param, CommandType commandType = CommandType.Text);

        /// <summary>
        /// 查询 实体基本信息 （异步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>实体集合</returns>
        Task<IEnumerable<TEntity>> EntitiesAsync(string sql, object param, CommandType commandType = CommandType.Text);

        #endregion

        #region 02 添加 实体
        /// <summary>
        /// 添加 实体基本信息 （同步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>是否执行成功</returns>
        T Insert<T>(string sql, object param, CommandType commandType = CommandType.Text);

        /// <summary>
        /// 添加 实体基本信息 （异步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>是否执行成功</returns>
        Task<T> InsertAsync<T>(string sql, object param, CommandType commandType = CommandType.Text);
        #endregion

        #region 03 编辑 删除 实体
        /// <summary>
        /// 编辑 实体基本信息 （同步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>是否执行成功</returns>
        bool Execute(string sql, object param, CommandType commandType = CommandType.Text);

        /// <summary>
        /// 编辑 实体基本信息 （异步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>是否执行成功</returns>
        Task<bool> ExecuteAsync(string sql, object param, CommandType commandType = CommandType.Text);
        #endregion 

        #region 05 数量 实体
        /// <summary>
        /// 数量 实体基本信息 （同步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>是否执行成功</returns>
        int Count(string sql, object param, CommandType commandType = CommandType.Text);

        /// <summary>
        /// 数量 实体基本信息 （异步）
        /// </summary>
        /// <param name="sql">SQL 语句</param>
        /// <param name="param">SQL 参数化</param>
        /// <param name="commandType">执行命令类型</param>
        /// <returns>是否执行成功</returns>
        Task<int> CountAsync(string sql, object param, CommandType commandType = CommandType.Text);
        #endregion 
    }
}
