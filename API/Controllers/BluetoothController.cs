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
    public class BluetoothController : ControllerBase
    {
        // GET: api/Bluetooth
        [HttpGet]
        public List<Bluetooth> Get()
        {
            ReadBeacon rd = new ReadBeacon();
            return rd.GetAll();
        }

        // GET: api/Bluetooth/5
        [HttpGet("{id}", Name = "GetBeacon")]
        public Bluetooth Get(int id)
        {
            ReadBeacon rd = new ReadBeacon();
            return rd.GetOne(id);
        }

        // POST: api/Bluetooth
        [HttpPost]
        public void Post([FromBody] Bluetooth b)
        {
            CreateBeacon cd = new CreateBeacon();
            cd.Create(b);
        }

        // PUT: api/Bluetooth/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Bluetooth b)
        {
            UpdateBeacon up = new UpdateBeacon();
            up.Update(b);
        }

        // DELETE: api/Bluetooth/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DeleteBeacon del = new DeleteBeacon();
            del.Delete(id);
        }
    }
}
