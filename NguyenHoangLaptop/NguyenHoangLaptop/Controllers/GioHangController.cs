using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    public class GioHangController : Controller
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        //Lấy giỏ hàng
        public List<itemGioHang> LayGioHang()
        {
            //giỏ hàng đã tồn tại
            List<itemGioHang> lstGioHang = Session["GioHang"] as List<itemGioHang>;
            if (lstGioHang == null)
            {
                //nếu session giỏ hàng chưa tồn tại thì khởi tạo giỏ hàng
                lstGioHang = new List<itemGioHang>(); 
                Session["GioHang"] = lstGioHang;//lấy giỏ hàng từ session,nếu session không tồn tại thì lấy nó từ giỏ hàng khởi tạo
                return lstGioHang;
            }
            return lstGioHang;
        }
        //thêm giỏ hàng
        public ActionResult ThemGioHang(int MaSP,string strUrl)
        {
            //kiểm tra xem sp có trong csdl hay không
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //lấy giỏ hàng
            List<itemGioHang> lstGioHang = LayGioHang();
            //sp đã tồn tại trong giỏ hàng
            itemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP);
            if (spCheck != null)
            {
                //kiểm tra trước khi cho kh đặt hàng,số lượng tồn nhỏ hơn số lượng đặt hàng thì lỗi
                if (sp.SoLuongTon < spCheck.SoLuong)
                {
                    return View("ThongBao");
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.DonGia * spCheck.SoLuong;
                return Redirect(strUrl);
            }
            itemGioHang itemGH = new itemGioHang(MaSP);
            if (sp.SoLuongTon < itemGH.SoLuong)
            {
                return View("ThongBao");
            }
            lstGioHang.Add(itemGH);
            return Redirect(strUrl);
        }

        //tính tổng số lượng
        public double TinhTongSoLuong()
        {
            //lấy giỏ hàng
            List<itemGioHang> lstGioHang = Session["GioHang"] as List<itemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.SoLuong);
        }
        //tính tổng tiền
        public decimal TinhTongTien()
        {
            List<itemGioHang> lstGioHang = Session["GioHang"] as List<itemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.ThanhTien);
        }


        // GET: GioHang
        public ActionResult XemGioHang()
        {
            List<itemGioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        public ActionResult GioHangPartial()
        {
            if (TinhTongSoLuong() == 0)
            {
                ViewBag.TongSoLuong = 0;
                ViewBag.TongSoTien = 0;
                return PartialView();
            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongSoTien = TinhTongTien();
            return PartialView();
        }
        [HttpGet]
        //chỉnh sửa giỏ hàng 
        public ActionResult SuaGioHang(int MaSP)
        {
            //kiểm tra session giỏ hàng tồn tại chưa
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //kiểm tra sp có trong csdl không
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //lấy giỏ hàng từ session
            List<itemGioHang> lstGioHang = LayGioHang();
            //kiểm tra sp đó có tồn tại trong giỏ hàng hay không
            itemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //lấy list giỏ hàng tạo giao diện
            ViewBag.GioHang = lstGioHang;
            return View(spCheck);
        }
        //xử lí cập nhật giỏ hàng
        [HttpPost]
        public ActionResult CapNhatGioHang(itemGioHang itemGH)
        {
            //kiểm tra số lượng tồn
            SanPham spCheck = db.SanPhams.SingleOrDefault(n => n.MaSP == itemGH.MaSP);
            if (spCheck.SoLuongTon < itemGH.SoLuong)
            {
                return View("ThongBao");
            }
            //cập nhật số lượng trong session giỏ hàng
            //lấy giỏ hàng từ session
            List<itemGioHang> lstGH = LayGioHang();
            //lấy sp cần cập nhật từ list sp trong giỏ hàng
            itemGioHang itemGHUpdate = lstGH.Find(n => n.MaSP == itemGH.MaSP);
            //cập nhật lại số lượng cùng thành tiền
            itemGHUpdate.SoLuong = itemGH.SoLuong;
            itemGHUpdate.ThanhTien = itemGHUpdate.SoLuong * itemGHUpdate.DonGia;
            return RedirectToAction("XemGioHang");
        }
        public ActionResult XoaGioHang(int MaSP)
        {
            //kiểm tra session giỏ hàng tồn tại chưa
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //kiểm tra sp có trong csdl không
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //lấy giỏ hàng từ session
            List<itemGioHang> lstGioHang = LayGioHang();
            //kiểm tra sp đó có tồn tại trong giỏ hàng hay không
            itemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //xóa item giỏ hàng
            lstGioHang.Remove(spCheck);
            return RedirectToAction("XemGioHang");
        }
        //xây dựng chức năng đặt hàng
        public ActionResult DatHang(KhachHang kh)
        {
            //kiểm tra session giỏ hàng tồn tại chưa
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            KhachHang khachhang = new KhachHang();
            if (Session["TaiKhoan"] == null)
            {
                //thêm kh vào bảng khách hàng với kh chưa có tài khoản
                khachhang = kh;
                db.KhachHangs.Add(khachhang);
                db.SaveChanges();
            }
            else
            {
                //xử lí đối với kh là thành viên
                ThanhVien tv = Session["TaiKhoan"] as ThanhVien;
                khachhang.TenKH = tv.HoTen;
                khachhang.DiaChi = tv.DiaChi;
                khachhang.Email = tv.Email;
                khachhang.SoDienThoai = tv.SoDienThoai;
                khachhang.MaThanhVien = tv.MaLoaiTV;
                db.KhachHangs.Add(khachhang);
                db.SaveChanges();
            }
            //thêm đơn hàng
            DonDatHang ddh = new DonDatHang
            {
                MaKH = khachhang.MaKH,
                NgayDat = DateTime.Now,
                TinhTrangGiaoHang = false,
                DaThanhToan = false,
                UuDai = 0,
                DaHuy = false
            };
            db.DonDatHangs.Add(ddh);
            db.SaveChanges();
            //thêm chi tiết đơn đặt hàng
            List<itemGioHang> lstGH = LayGioHang();
            foreach(var item in lstGH)
            {
                ChiTietDonDatHang ctddh = new ChiTietDonDatHang
                {
                    MaDDH = ddh.MaDDH,
                    MaSP = item.MaSP,
                    TenSP = item.TenSP,
                    SoLuong = item.SoLuong,
                    DonGia = item.DonGia
                };
                db.ChiTietDonDatHangs.Add(ctddh);
            }
            db.SaveChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XemGioHang");
        }
    }
}