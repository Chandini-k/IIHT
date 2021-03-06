using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Userservice1.Models;

namespace Userservice1.Controllers
{
    [EnableCors("MODPolicy")]
    [Route("api/[controller]")]
    [ApiController]
    public class UserTwoController : ControllerBase
    {
        IIHT_modDBContext modcontext = new IIHT_modDBContext();
        [Route("completeTraining/{id}/{progress}")]
        [HttpPut("{id}/{progress}")]
        public IActionResult CompleteTraining(long id, int progress)
        {
            var training = modcontext.Training.Where(t => t.Id == id).FirstOrDefault();
            var wallet = modcontext.Wallet.Where(w => w.UserId == training.MentorId).FirstOrDefault();
            if (training.PartOne == false && progress == 25)
            {
                training.PartOne = true;
                training.Progress = progress;
                wallet.Balance = wallet.Balance + ((25 / 100) * training.Fees);
            }
            if (training.PartOne == true && training.PartTwo == false && progress == 50)
            {
                training.PartTwo = true;
                training.Progress = progress;
                wallet.Balance = wallet.Balance + ((25 / 100) * training.Fees);
            }
            if (training.PartOne == true && training.PartTwo == true && training.PartThree == false && progress == 75)
            {
                training.PartThree = true;
                training.Progress = progress;
                wallet.Balance = wallet.Balance + ((25 / 100) * training.Fees);
            }
            if (training.PartOne == true && training.PartTwo == true && training.PartThree == true && training.PartFour == false && progress == 100)
            {
                training.PartFour = true;
                training.Progress = progress;
                training.Completed = true;
                wallet.Balance = wallet.Balance + ((25 / 100) * training.Fees);
            }
            modcontext.Training.Update(training);
            modcontext.Wallet.Update(wallet);
            modcontext.SaveChanges();
            return Ok(new { status = "Training Completion Updated", training = training });
        }
    }

}