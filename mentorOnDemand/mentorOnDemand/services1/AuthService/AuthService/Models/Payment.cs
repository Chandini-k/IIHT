using System;
using System.Collections.Generic;

namespace AuthService.Models
{
    public partial class Payment
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public string PaymentMethod { get; set; }
        public long? AmountPaid { get; set; }
        public string TransactionStatus { get; set; }
    }
}
