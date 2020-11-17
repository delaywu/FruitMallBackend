using FruitMall.Site.Domain.Entities;
using FruitMall.Site.Domain.IRepositories;
using FruitMall.Site.Domain.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace FruitMall.Site.Services.Services
{
    public class FranchiseService : ServiceBase, IFranchiseRepositories
    {
        public IRepositoriesBase<Franchise, int> FranchiseRepositories { protected get; set; }

        public async Task<IEnumerable<FranchiseDto>> Franchises(string keyword)
        {
            var sql = "SELECT * FROM Franchise ";

        }

        public Task<FranchiseDto> Insert(FranchiseDto franchise)
        {
            throw new NotImplementedException();
        }

        public Task<bool> Remove(int franchiseId)
        {
            throw new NotImplementedException();
        }

        public Task<FranchiseDto> Update(FranchiseDto franchise)
        {
            throw new NotImplementedException();
        }
    }
}
