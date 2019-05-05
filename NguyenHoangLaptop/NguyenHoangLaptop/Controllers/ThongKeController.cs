using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    public class ThongKeController : Controller
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        // GET: ThongKe
        public ActionResult Index()
        {
            ViewBag.SoNguoiTruyCap = HttpContext.Application["SoNguoiTruyCap"].ToString(); //lấy số lượng người truy cập từ application được tạo
            ViewBag.SoNguoiOnline = HttpContext.Application["SoNguoiOnline"].ToString();
            ViewBag.ThongKeDoanhThu = ThongKeDoanhThu();
            ViewBag.ThanhVien = ThongKeThanhVien();
            ViewBag.DonHang = ThongKeDonHang();
            return View();
        }
        public decimal ThongKeDoanhThu()
        {
            //thống kê teo tất cả doanh thu của cửa hàng
            decimal TongDoanhThu = db.ChiTietDonDatHangs.Sum(n => n.SoLuong * n.DonGia).Value;
            return TongDoanhThu;
        }
        public decimal ThongKeDoanhThuTheoThang(int month,int year)
        {
            //list những đơn hàng có tháng,năm tương ứng
            var lstDDH = db.DonDatHangs.Where(n => n.NgayDat.Value.Month == month && n.NgayDat.Value.Year==year);
            decimal TongTien = 0;
            foreach(var item in lstDDH)
            {
                TongTien += decimal.Parse(item.ChiTietDonDatHangs.Sum(n => n.SoLuong * n.DonGia).Value.ToString());
            }
            return TongTien;
        }
        public double ThongKeDonHang()
        {
            double ddh = db.DonDatHangs.Count();
            return ddh;
        }
        public double ThongKeThanhVien()
        {
            double tv = db.ThanhViens.Count();
            return tv;
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