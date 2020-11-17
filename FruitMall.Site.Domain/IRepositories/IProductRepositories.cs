using FruitMall.Site.Domain.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace FruitMall.Site.Domain.IRepositories
{
    public interface IProductRepositories : IDependency
    {
        /// <summary>
        /// 获取 门店 商品分类
        /// </summary>
        /// <param name="franchiseId">门店唯一标识</param>
        /// <returns></returns>
        Task<IEnumerable<FranchiseCateDto>> FranchiseCates(int franchiseId);


        /// <summary>
        /// 根据分类 获取商品信息
        /// </summary>
        /// <param name="franchiseId"></param>
        /// <param name="franchiseCateId"></param>
        /// <returns></returns>
        Task<IEnumerable<FranchiseProductDto>> FranchiseProducts(int franchiseId, int franchiseCateId);
    }
}
