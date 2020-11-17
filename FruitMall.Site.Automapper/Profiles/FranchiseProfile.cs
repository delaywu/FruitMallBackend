using AutoMapper;
using FruitMall.Site.Domain.Entities;
using FruitMall.Site.Domain.Models.Dtos;

namespace FruitMall.Site.Automapper.Profiles
{
    public class FranchiseProfile : Profile
    {
        public FranchiseProfile()
        {
            this.CreateMap<Franchise, FranchiseDto>();
            this.CreateMap<FranchiseDto, Franchise>();

            this.CreateMap<FranchiseCate, FranchiseCateDto>();
            this.CreateMap<FranchiseProduct, FranchiseProductDto>(); 
        }
    }
}
