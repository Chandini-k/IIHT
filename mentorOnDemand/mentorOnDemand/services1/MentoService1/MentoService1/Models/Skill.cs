using System;
using System.Collections.Generic;

namespace MentoService1.Models
{
    public partial class Skill
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Toc { get; set; }
        public string Prerequistes { get; set; }
    }
}
