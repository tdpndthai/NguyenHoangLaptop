﻿using NguyenHoangLaptop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NguyenHoangLaptop.Controllers
{
    public class SubmidListModelController : Controller
    {
        // GET: SubmidListModel
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(PhieuNhap Model, IEnumerable<ChiTietPhieuNhap> ModelList)
        {
            return View();
        }
    }
}