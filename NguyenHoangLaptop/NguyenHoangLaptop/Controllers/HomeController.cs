using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    public class HomeController : Controller
    {
        QuanlibanhanglaptopEntities1 db = new QuanlibanhanglaptopEntities1();
        // GET: Home
        public ActionResult Index()
        {
            var lstLaptopDell = db.SanPham.Where(n => n.MaLoaiSP == 1 && n.Moi == 1);
            ViewBag.ListDell = lstLaptopDell;
            var lstLaptopHP = db.SanPham.Where(n => n.MaLoaiSP == 2 && n.Moi == 1);
            ViewBag.ListHP = lstLaptopHP;
            return View();
        }
        public ActionResult MenuPartial()
        {
            var lstSP = db.SanPham;
            return PartialView(lstSP);
        }
    }
}