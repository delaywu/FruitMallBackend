using System;

namespace FruitMall.Site.Domain.Entities
{
    /// <summary>
    /// 用户实体类
    /// </summary>
    public class User : EntityBase<int>
    { 
        /// <summary>
        /// 获取或设置 手机号
        /// </summary>
        public string Mobile { get; set; }

        /// <summary>
        /// 获取或设置 微信唯一标识
        /// </summary>
        public string OpenId { get; set; }

        /// <summary>
        ///获取或设置  推荐人
        /// </summary>
        public int? Recommender { get; set; }

        /// <summary>
        /// 获取或设置 积分
        /// </summary>
        public int Integral { get; set; }

        /// <summary>
        /// 获取或设置 账户余额
        /// </summary>
        public int Balance { get; set; }

        /// <summary>
        /// 获取或设置 用户账号等级
        /// </summary>
        public int Level { get; set; }
    }
}
