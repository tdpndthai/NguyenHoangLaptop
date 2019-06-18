using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CaptchaMvc.HtmlHelpers;
using CaptchaMvc;
using NguyenHoangLaptop.Models;
using System.Web.Security;

namespace NguyenHoangLaptop.Controllers
{
    public class HomeController : BaseController
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        // GET: Home
        public ActionResult Index()
        {
            var lstLaptopDell = db.SanPhams.Where(n => n.MaLoaiSP == 1);
            ViewBag.ListDell = lstLaptopDell;
            var lstLaptopHP = db.SanPhams.Where(n => n.MaLoaiSP == 2);
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
            string taikhoan = f["txtTenDangNhap"].ToString();
            string matkhau = f["txtMatKhau"].ToString();
            //Truy vấn kiểm tra đăng nhập lấy thông tin thành viên
            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == taikhoan && n.MatKhau == matkhau);
            if (tv != null)
            {
                //Lấy ra list quyền của thành viên tương ứng với loại thành viên
                var lstQuyen = db.Quyen_LoaiTV.Where(n => n.MaLoaiTV == tv.MaLoaiTV);
                //Duyệt list quyền
                string Quyen = "";
                if (lstQuyen.Count() != 0)
                {
                    foreach (var item in lstQuyen)
                    {
                        Quyen += item.Quyen.MaQuyen + ",";
                    }
                    Quyen = Quyen.Substring(0, Quyen.Length - 1); //Cắt dấu ","
                    PhanQuyen(tv.TaiKhoan.ToString(), Quyen);
                    Session["TaiKhoan"] = tv;
                    return Content("<script>window.location.reload();</script>");
                }
            }
            return Content("Tài khoản hoặc mật khẩu không đúng!");
        }
        public void PhanQuyen(string TaiKhoan, string Quyen)
        {
            FormsAuthentication.Initialize();
            var ticket = new FormsAuthenticationTicket(1, 
                                                       TaiKhoan, //user 
                                                       DateTime.Now, //begin 
                                                       DateTime.Now.AddHours(3), //timeout 
                                                       false, //remember? 
                                                       Quyen, // permission.. "admin"" 
                                                       FormsAuthentication.FormsCookiePath);
            var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
            Response.Cookies.Add(cookie);
        }


        //action đăng xuất
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index","Home");
        }
        //tạo trang ngăn truy cập 
        public ActionResult NganTruyCap()
        {
            return View();
        }

        public ActionResult ChangeLanguage(string lang)
        {
            new LanguageMang().SetLanguage(lang);
            return RedirectToAction("DangKy", "Home");
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