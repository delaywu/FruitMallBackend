using System;
using System.Collections.Generic;
using System.Text;

namespace FruitMall.Site.Domain.Entities
{
    /// <summary>
    /// 加盟 实体店 数据表
    /// </summary>
    public class Franchise : EntityBase<int>
    {
        /// <summary>
        /// 获取或设置 实体店名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 获取或设置 负责人姓名
        /// </summary>
        public string Uname { get; set; }

        /// <summary>
        ///获取或设置 负责人联系电话
        /// </summary>
        public string Mobile { get; set; }

        /// <summary>
        /// 获取或设置 店面地址
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// 获取或设置 经度
        /// </summary>
        public double Longitude { get; set; }

        /// <summary>
        /// 获取或设置 纬度
        /// </summary>
        public double Latitude { get; set; }
    }
}
