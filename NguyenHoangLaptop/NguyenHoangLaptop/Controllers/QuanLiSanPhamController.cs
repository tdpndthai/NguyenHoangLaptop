using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    public class QuanLiSanPhamController : Controller
    {
        // GET: QuanLiSanPham
        QuanlibanhanglaptopEntities db=new QuanlibanhanglaptopEntities();
        public ActionResult Index()
        {
            return View(db.SanPhams.Where(n => n.DaXoa == true));
        }
        [HttpGet]
        public ActionResult TaoMoi()
        {
            //load dropdownlist nhà cung cấp,nsx,sp
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n=>n.TenNCC),"MaNCC","TenNCC");
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n=>n.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n=>n.MaNSX), "MaNSX", "TenNSX");
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult TaoMoi(SanPham sp,HttpPostedFileBase HinhAnh,HttpPostedFile HinhAnh1, HttpPostedFile HinhAnh2, HttpPostedFile HinhAnh3, HttpPostedFile HinhAnh4)
        {
            //load dropdownlist nhà cung cấp,nsx,sp
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
            //kiểm tra xem ảnh có trong csdl chưa
            if (HinhAnh.ContentLength > 0)
            {
                //lấy tên hình ảnh
                var fileName = Path.GetFileName(HinhAnh.FileName);
                //lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/Content/trangweb/images"), fileName);
                //nếu thư mục chứa hình ảnh đó rồi thì thông báo
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                }
                //ngược lại lấy hình ảnh đưa vào thư mục
                else
                {
                    HinhAnh.SaveAs(path);
                    HinhAnh1.SaveAs(path);
                    HinhAnh2.SaveAs(path);
                    HinhAnh3.SaveAs(path);
                    HinhAnh4.SaveAs(path);
                    sp.HinhAnh = fileName;
                    sp.HinhAnh1 = fileName;
                    sp.HinhAnh2 = fileName;
                    sp.HinhAnh3 = fileName;
                    sp.HinhAnh4 = fileName;
                }
            }
            db.SanPhams.Add(sp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}