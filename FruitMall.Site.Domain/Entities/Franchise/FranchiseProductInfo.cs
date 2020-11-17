using System;
using System.Collections.Generic;
using System.Text;

namespace FruitMall.Site.Domain.Entities
{
    /// <summary>
    /// 供应商 产品明细
    /// </summary>
    public class FranchiseProductInfo : EntityBase<Guid>
    {
        /// <summary>
        /// 获取 或 设置 供应商产品Id
        /// </summary>
        public Guid FranchiseProductId { get; set; }

        /// <summary>
        /// 获取 或 设置 存储方式
        /// </summary>
        public string StoreWay { get; set; }

        /// <summary>
        /// 获取 或 设置 源产地
        /// </summary>
        public string ProductionPlace { get; set; }
    }
}
