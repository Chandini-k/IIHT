using System;
using System.Collections.Generic;

namespace Admin1services.Models
{
    public partial class Skill
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Toc { get; set; }
        public string Prerequistes { get; set; }
    }
}
