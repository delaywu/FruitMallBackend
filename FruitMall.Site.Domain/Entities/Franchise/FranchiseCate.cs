using System;
using System.Collections.Generic;
using System.Text;

namespace FruitMall.Site.Domain.Entities
{
    /// <summary>
    /// 加盟 实体店 对应商品分类 数据表
    /// </summary>
    public class FranchiseCate : EntityBase<int>
    {
        /// <summary>
        /// 获取或设置 实体店 唯一标识
        /// </summary>
        public int FranchiseId { get; set; }

        /// <summary>
        /// 获取或设置 实体店 对应的某项产品分类
        /// </summary>
        public int CategoryId { get; set; } 

        /// <summary>
        /// 获取或设置  分类名称
        /// </summary>
        public string Name { get; set; }
    }
}
