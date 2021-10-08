using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GT_admin_API.Database.Create;
using GT_admin_API.Database.Delete;
using GT_admin_API.Database.Read;
using GT_admin_API.Database.Update;
using GT_admin_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace GT_admin_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MuseumController : ControllerBase
    {
        // GET: api/Museum
        [HttpGet]
        public List<Museum> Get()
        {
            ReadMuseum rd = new ReadMuseum();
            return rd.GetAll();
        }

        // GET: api/Museum/5
        [HttpGet("{id}", Name = "GetMuseum")]
        public Museum Get(int id)
        {
            ReadMuseum rd = new ReadMuseum();
            return rd.GetOne(id);
        }

        // POST: api/Museum
        [HttpPost]
        public void Post([FromBody] Museum m)
        {
            CreateMuseum cr = new CreateMuseum();
            cr.Create(m);
        }

        // PUT: api/Museum/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Museum m)
        {
            UpdateMuseum up = new UpdateMuseum();
            up.Update(m);
        }

        // DELETE: api/Museum/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DeleteMuseum del = new DeleteMuseum();
            del.Delete(id);
        }
    }
}
