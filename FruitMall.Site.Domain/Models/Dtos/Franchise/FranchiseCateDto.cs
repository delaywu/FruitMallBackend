using FruitMall.Site.Infrastructure.Entity;

namespace FruitMall.Site.Domain.Models.Dtos
{
    public class FranchiseCateDto : IEntity<int>
    {
        public int Id { get; set; }

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
