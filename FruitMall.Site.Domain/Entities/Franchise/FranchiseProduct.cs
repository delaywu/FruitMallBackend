using System;
using System.Collections.Generic;
using System.Text;

namespace FruitMall.Site.Domain.Entities
{
    /// <summary>
    /// 实体店 分类商品信息
    /// </summary>
    public class FranchiseProduct : EntityBase<Guid>
    {
        /// <summary>
        /// 获取或设置 实体店 唯一标识
        /// </summary>
        public int FranchiseId { get; set; }

        /// <summary>
        /// 获取或设置 产品所属分类
        /// </summary>
        public string FranchiseCates { get; set; }

        /// <summary>
        /// 获取或设置 产品 展示图片
        /// </summary>
        public string ImageURL { get; set; }

        /// <summary>
        /// 获取或设置 产品 名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 获取或设置 副标题
        /// </summary>
        public string SubTitle { get; set; }

        /// <summary>
        /// 获取或设置 价格
        /// </summary>
        public string Price { get; set; }

        /// <summary>
        /// 获取或设置 Vip  价格
        /// </summary>
        public string VipPrice { get; set; }

        /// <summary>
        /// 获取或设置 Vip  价格
        /// </summary>
        public string SkuID { get; set; }
        public string Unit { get; set; }
        public string Spec { get; set; }
        public string Level { get; set; }
        public string Quantity { get; set; } 
        public string StockNum { get; set; }
        public string Weight { get; set; }

        /// <summary>
        /// 获取 或 设置 存储方式
        /// </summary>
        public string StoreWay { get; set; }

        /// <summary>
        /// 获取 或 设置 源产地
        /// </summary>
        public string ProductionPlace { get; set; }

        public int ImageProductId { get; set; } 
        public string ImageHeadProducts { get; set; }
        public string ImageDetailProducts { get; set; }
    }
}
