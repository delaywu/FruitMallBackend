using System;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;

using FruitMall.Site.Domain.IRepositories;
using FruitMall.Site.Domain.Models.Dtos;
using FruitMall.Site.Domain.Entities;
using AutoMapper;
using FruitMall.Site.Infrastructure.DapperExtensions;

namespace FruitMall.Site.Services.Services
{
    public class ProductService : ServiceBase, IProductRepositories
    {
        public IRepositoriesBase<FranchiseCate, int> FranchiseCateRepositories { protected get; set; }
        public IRepositoriesBase<FranchiseProduct, Guid> FranchiseProductRepositories { protected get; set; }

        private readonly IMapper _mapper;

        public ProductService(IMapper mapper)
        {
            this._mapper = mapper ?? throw new ArgumentNullException(nameof(mapper));
        }

        /// <summary>
        /// 获取 门店 商品分类
        /// </summary>
        /// <param name="franchiseId">门店唯一标识</param>
        /// <returns></returns>
        public async Task<IEnumerable<FranchiseCateDto>> FranchiseCates(int franchiseId)
        {
            var sql = @"SELECT Id, FranchiseId, Name FROM FranchiseCate WHERE FranchiseId=@franchiseId"; 
            var result = await FranchiseCateRepositories.EntitiesAsync(sql, new { franchiseId });
            return _mapper.Map<IEnumerable<FranchiseCateDto>>(result);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="franchiseId"></param>
        /// <param name="franchiseCateId"></param>
        /// <returns></returns>
        public async Task<IEnumerable<FranchiseProductDto>> FranchiseProducts(int franchiseId,int franchiseCateId)
        { 
            var sql = @"SELECT C.* FROM FranchiseCate A 
                                            JOIN FranchiseCateProduct B ON A.Id = B.FranchiseCateId
                                            JOIN FranchiseProduct C ON C.Id = B.FranchiseProductId
                                            WHERE A.FranchiseId = @franchiseId AND B.FranchiseCateId = @franchiseCateId";
            var result =await FranchiseProductRepositories.EntitiesAsync(sql, new { franchiseId, franchiseCateId });
             
            return _mapper.Map<IEnumerable<FranchiseProductDto>>(result);
        }
    }
}
