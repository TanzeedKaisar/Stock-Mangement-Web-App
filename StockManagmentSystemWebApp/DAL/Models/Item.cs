using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagmentSystemWebApp.DAL.Models
{
    public class Item
    {
        public int Id { get; set; }
        public int CompanyId { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public int ReorderLevel { get; set; }
        public DateTime Date { get; set; }
    }
}