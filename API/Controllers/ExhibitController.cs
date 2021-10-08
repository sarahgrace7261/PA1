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
    public class ExhibitController : ControllerBase
    {
        // GET: api/Exhibit
        [HttpGet]
        public List<Exhibit> Get()
        {
            ReadExhibit rd = new ReadExhibit();
            return rd.GetAll();
        }

        // GET: api/Exhibit/5
        [HttpGet("{id}", Name = "GetExhibit")]
        public Exhibit Get(int id)
        {
            ReadExhibit rd = new ReadExhibit();
            return rd.GetOne(id);
        }

        // POST: api/Exhibit
        [HttpPost]
        public void Post([FromBody] Exhibit e)
        {
            CreateExhibit ce = new CreateExhibit();
            ce.Create(e);
        }

        // PUT: api/Exhibit/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Exhibit e)
        {
            UpdateExhibit up = new UpdateExhibit();
            up.Update(e);
        }

        // DELETE: api/Exhibit/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DeleteExhibit del = new DeleteExhibit();
            del.Delete(id);
        }
    }
}
