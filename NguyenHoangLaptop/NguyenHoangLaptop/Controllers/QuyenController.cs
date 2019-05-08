﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    [Authorize(Roles = "PhanQuyen")]
    public class QuyenController : Controller
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        // GET: Quuyen
        public ActionResult Index()
        {
            return View(db.Quyens.OrderBy(n=>n.TenQuyen));
        }
        [HttpGet]
        public ActionResult ThemQuyen()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemQuyen(Quyen quyen)
        {
            if (ModelState.IsValid)
            {
                db.Quyens.Add(quyen);
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}