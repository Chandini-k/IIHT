using System;
using System.Collections.Generic;

namespace MentoService1.Models
{
    public partial class Wallet
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long Balance { get; set; }
    }
}
