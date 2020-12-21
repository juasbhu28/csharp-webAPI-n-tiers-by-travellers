using System.Collections.Generic;
using  System.Web.Http;
using Microsoft.AspNetCore.Mvc;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace PruebaLibreria.WebApi.Controllers
{
    public class AuthorController : ApiController
    {        
        [HttpGet]
        [Route("api/traerAutores")]
        public IEnumerable<Entities.AuthorsView> GetAuthors()
        {
            return Business.Author.GetAuthors();
        }

        [HttpGet]
        [Route("api/traerAutoresPorEditorial/{editorialId}")]
        public IEnumerable<Entities.AuthorsByEditorialView> GetAuthorsByEditorial([FromRoute] int editorialId)
        {
            return Business.Author.GetAuthorsByEditorial(editorialId);
        }
    }
}
