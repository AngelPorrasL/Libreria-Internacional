using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Permissions;
using System.Web;
using System.Web.UI.WebControls;

namespace Libreria_Internacional.Model
{
    public class BuyBook : Book
    {
        public int BuyBookId { get; set; }
        public LoginResponsePayload Session { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Country { get; set; }
        public string State { get; set; }
        public int Zip { get; set; }
        public int ccNumber { get; set; }
        public string ccExpiration { get; set; }
        public int SecurityCode { get; set; }
        public decimal Cost { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }

        public bool isReady = false;

        public decimal GetCost()
        {
            return this.Price;
        }

        public decimal GetTax()
        {
            return 10;
        }

        public decimal GetTotal()
        {
            return GetCost() + GetTax();
        }
    }
}