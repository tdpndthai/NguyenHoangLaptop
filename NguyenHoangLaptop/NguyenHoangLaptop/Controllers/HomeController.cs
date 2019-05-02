using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    public class HomeController : Controller
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        // GET: Home
        public ActionResult Index()
        {
            var lstLaptopDell = db.SanPhams.Where(n => n.MaLoaiSP == 1 && n.Moi == 1);
            ViewBag.ListDell = lstLaptopDell;
            var lstLaptopHP = db.SanPhams.Where(n => n.MaLoaiSP == 2 && n.Moi == 1);
            ViewBag.ListHP = lstLaptopHP;
            return View();
        }
        public ActionResult MenuPartial()
        {
            var lstSP = db.SanPhams;
            return PartialView(lstSP);
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            ViewBag.CauHoi = new SelectList(LoadCauHoi());
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(ThanhVien tv,FormCollection f)
        {
            ViewBag.CauHoi = new SelectList(LoadCauHoi());
            //kiểm tra captcha hợp lệ
            if (this.IsCaptchaValid("Captcha is not valid"))
            {
                if (ModelState.IsValid)
                {
                    ViewBag.ThongBao = "Thêm thành công";
                    //thêm khách hàng vào csdl
                    db.ThanhViens.Add(tv);
                    db.SaveChanges(); //lấy từ dataset rồi chuyển vào csdl
                }
                else
                {
                    ViewBag.ThongBao = "Thêm thất bại";
                }
                return View();
            }
            ViewBag.ThongBao = "Sai mã captcha";
            return View();
        }
        //load câu hỏi bí mật
        public List<string> LoadCauHoi()
        {
            List<string> lstCauHoi = new List<string>
            {
                "your name",
                "your name",
                "your name",
                "your name"
            };
            return lstCauHoi;
        }
        //action đăng nhập
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            //kiểm tra tên đăng nhập và mật khẩu
            string sTaiKhoan = f["txtTenDangNhap"].ToString();
            string sMatKhau = f["txtMatKhau"].ToString();
            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if (tv != null)
            {
                Session["TaiKhoan"] = tv;
                return Content("<script>window.location.reload();</script>");
            }
            return Content("Tên đăng nhập hoặc mật khẩu không đúng");
        }
        //action đăng xuất
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index","Home");
        }

    }
}