using System.Collections.Generic;
using System.Threading.Tasks;
using FruitMall.Site.Domain.Dtos;

namespace FruitMall.Site.Domain.IRepositories
{
    public interface IUserRepositories : IDependency
    {
        IEnumerable<UserDto> Entities(string sql, object param);
        Task<IEnumerable<UserDto>> EntitiesAsync(string sql, object param);
    }
}
