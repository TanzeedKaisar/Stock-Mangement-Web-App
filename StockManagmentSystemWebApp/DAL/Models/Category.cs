using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagmentSystemWebApp.DAL.Models
{
    public class Category
    {
        public int Id { get; set; }
        public int SL { get; set; }
        public string Name { get; set; }
        public DateTime Date { get; set; }
    }
}