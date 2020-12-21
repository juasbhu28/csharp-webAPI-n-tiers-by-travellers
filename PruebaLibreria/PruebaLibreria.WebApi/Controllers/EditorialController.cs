using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using  System.Web.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PruebaLibreria.Entities;
using PruebaLibreria.WebApi.Contracts.Request;
using PruebaLibreria.WebApi.Contracts.Responses;
using FromBodyAttribute = System.Web.Http.FromBodyAttribute;
using HttpGetAttribute = System.Web.Http.HttpGetAttribute;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace PruebaLibreria.WebApi.Controllers
{
    public class EditorialController : ApiController
    {        
        [HttpGet]
        [Route("api/traerEditoriales")]
        public HttpResponseMessage GetEditorials()
        {
            var editorials = Business.Editorial.GetEditorials();
            var result = from edit in editorials
                         select new EditorialResponse { Id = edit.Id, Name = edit.Name, Location = edit.Location };

            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, result);
            return response;
        }

        [HttpPost]
        [Route("api/guardarEditorial")]
        public IHttpActionResult PostEditorial([FromBody] EditorialRequest editorial)
        {

            if (editorial == null)
            {
                return BadRequest("A non-empty request body is required, body is not valid");
            }

            var newEditorial = new Editorial()
            {
                Name = editorial.Name,
                Location = editorial.Location 
            };

            var result = Business.Editorial.PostEditorial(newEditorial);           
            return Ok(new EditorialResponse { Id = result.Id, Name = result.Name, Location = result.Location });
        }
    }
}
