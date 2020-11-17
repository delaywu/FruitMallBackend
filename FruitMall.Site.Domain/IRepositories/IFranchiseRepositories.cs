using FruitMall.Site.Domain.Models.Dtos;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FruitMall.Site.Domain.IRepositories
{
    public interface IFranchiseRepositories : IDependency
    {
        #region  门店基本信息维护
        /// <summary>
        ///  根据查询关键字 获取门店信息
        /// </summary>
        /// <param name="keyword"></param>
        /// <returns></returns>
        Task<IEnumerable<FranchiseDto>> Franchises(string keyword);

        /// <summary>
        ///  新增 门店基本信息
        /// </summary>
        /// <param name="franchise"></param>
        /// <returns></returns>
        Task<FranchiseDto> Insert(FranchiseDto franchise);

        /// <summary>
        /// 编辑 门店基本信息
        /// </summary>
        /// <param name="franchise"></param>
        /// <returns></returns>
        Task<FranchiseDto> Update(FranchiseDto franchise);

        /// <summary>
        /// 删除 门店基本信息
        /// </summary>
        /// <param name="franchiseId"></param>
        /// <returns></returns>
        Task<bool> Remove(int franchiseId);
        #endregion 
    }
}
