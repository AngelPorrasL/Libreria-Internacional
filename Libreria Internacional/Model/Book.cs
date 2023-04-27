using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Libreria_Internacional.Model
{
    public class Book
    {
        public int Id { get; set; }
        public int ISBN { get; set; }
        public string Title { get; set; }
        public string Autor { get; set; }
        public string Publication { get; set; }
        public string Photo { get; set; }
        public decimal Price { get; set; }
    }
}