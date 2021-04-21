using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MentoService1.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MentoService1.Controllers
{
    [EnableCors("MODPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class TrainingController : ControllerBase
    {

        IIHT_modDBContext modcontext = new IIHT_modDBContext();

        [Route("updateTrainingStatus/{id}/{status}")]
        [HttpPut("{id}/{status}")]
        public IActionResult UpdateTrainingStatus(long id, bool status)
        {
            var training = modcontext.Training.Where(t => t.Id == id).FirstOrDefault();
            if (status == true)
            {
                training.Approved = true;
                modcontext.Training.Update(training);
                modcontext.SaveChanges();
                return Ok(new { status = "Approved" });
            }
            else
            {
                training.Rejected = true;
                modcontext.Training.Update(training);
                modcontext.SaveChanges();
                return Ok(new { status = "Rejected" });
            }
        }
    }
}