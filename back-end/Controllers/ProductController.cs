﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using WebCoffe.Dto;
using WebCoffe.Dto.Request;
using WebCoffe.Dto.Response;
using WebCoffe.Models;

namespace WebCoffe.Controllers;

[Route("api/[controller]")]
public class ProductController : ControllerBase
{
    private readonly WebCoffeeNhatContext _context;
    private readonly ILogger<ProductController> _logger;

    public ProductController(WebCoffeeNhatContext context, ILogger<ProductController> logger)
    {
        _context = context;
        _logger = logger;
    }

    [HttpGet("GetTotalPage")]
    public IActionResult GetTotalPage([FromBody] GetTotalPageRequest request)
    {
        try
        {
            int totalProducts = _context.Products
                .Where(product =>
                    (request.SearchString.IsNullOrEmpty()
                        ? true
                        : product.ProductName.ToLower().Contains(request.SearchString.ToLower())) &&
                    (request.MinPrice != null ? product.ProductPrice >= request.MinPrice : true)
                    && (request.MaxPrice != null ? product.ProductPrice <= request.MaxPrice : true)).Count();
            
            return Ok(new BaseResponse<GetTotalPageResponse>
            {
                code = "200",
                message = "Thanh cong",
                data = new GetTotalPageResponse
                {
                    TotalPage = (int) Math.Ceiling((double) totalProducts / request.PageSize)
                }
            });
        }
        catch (Exception ex)
        {
            return Conflict(new BaseResponse<GetTotalPageResponse>
            {
                code = "409",
                message = "Co loi xay ra"
            });
        }
        
    }

    [HttpGet("GetAll")]
    public IActionResult GetAllProducts([FromBody] GetAllProductRequest request)
    {
        try
        {
            _logger.LogInformation($"GET ALL PRODUCT REQUEST: {request} >>> SUCCESS");
            return Ok(new BaseResponse<List<ProductDto>>
            {
                code = "200",
                message = "Success",
                data = _context.Products
                    .Where(product =>
                        (request.SearchString.IsNullOrEmpty()
                            ? true
                            : product.ProductName.ToLower().Contains(request.SearchString.ToLower())) &&
                        (request.MinPrice != null ? product.ProductPrice >= request.MinPrice : true)
                        && (request.MaxPrice != null ? product.ProductPrice <= request.MaxPrice : true))
                    .Skip(request.PageSize * (request.PageNumber - 1)).Take(request.PageSize)
                    .Select(product => new ProductDto
                    {
                        Id = product.Id,
                        ProductName = product.ProductName,
                        ProductDescription = product.ProductDescription,
                        ProductPrice = product.ProductPrice,
                        Image = product.Image,
                        Quantity = product.Quantity,
                    }).ToList()
            });
        }
        catch (Exception ex)
        {
            _logger.LogError($"GET ALL PRODUCT {request} >>> ERROR: {ex.Message}");
            return Conflict(new BaseResponse<object>
            {
                code = "409",
                message = "Co loi xay ra vui long thu lai sau"
            });
        }
    }
}