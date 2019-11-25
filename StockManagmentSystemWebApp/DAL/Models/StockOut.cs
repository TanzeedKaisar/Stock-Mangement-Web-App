﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagmentSystemWebApp.DAL.Models
{
    public class StockOut
    {
        public int Id { get; set; }
        public int ItemId { get; set; }
        public int Quantity { get; set; }
        public DateTime Date { get; set; }
        public string Method { get; set; }
    }
}