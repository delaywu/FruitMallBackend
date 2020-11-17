using FruitMall.Site.Domain.IRepositories;
using FruitMall.Site.Domain.Models.Dtos;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FruitMall.Site.WebApi.Controllers
{
    [ApiController]
    [Route("api/{franchiseId}/product")]
    public class ProductController : ControllerBase
    {
        public IProductRepositories ProductRepositories { get; set; }

        [HttpGet("categories", Name = nameof(GetFranchiseCates))]
        public async Task<ActionResult<IEnumerable<FranchiseCateDto>>> GetFranchiseCates(int franchiseId = 1)
        {
            var result = await ProductRepositories.FranchiseCates(franchiseId);
            return Ok(result);
        }

        [HttpGet("products", Name = nameof(GetFranchiseProducts))]
        public async Task<ActionResult<IEnumerable<FranchiseProductDto>>> GetFranchiseProducts(int franchiseId = 1, int franchiseCateId = 1)
        {
            var data = await ProductRepositories.FranchiseProducts(franchiseId, franchiseCateId);
            return Ok(data);
        }
    }
}
