using NguyenHoangLaptop.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NguyenHoangLaptop.Controllers
{
    [Authorize(Roles = "QuanTri,QuanLiDonHang,QuanLiSanPham,PhanQuyen")]
    public class QuanLiSanPhamController : Controller
    {
        // GET: QuanLiSanPham
        private QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();

        public ActionResult Index()
        {
            return View(db.SanPhams);
        }

        [HttpGet]
        public ActionResult TaoMoi()
        {
            //load dropdownlist nhà cung cấp,nsx,sp
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
            return View();
        }

        //[ValidateInput(false)]
        //[HttpPost]
        //public ActionResult TaoMoi(List<HttpPostedFileBase> HinhAnh, SanPham sp)
        //{
        //    load dropdownlist nhà cung cấp,nsx,sp
        //    ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
        //    ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai");
        //    ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
        //    foreach (var item in HinhAnh)
        //    {

        //        string filePath = Path.Combine(HttpContext.Server.MapPath("~/Content/trangweb/images"), Path.GetFileName(item.FileName));
        //        item.SaveAs(filePath);
        //    }
        //    sp.HinhAnh = HinhAnh[0].FileName;
        //    sp.HinhAnh1 = HinhAnh[1].FileName;
        //    sp.HinhAnh2 = HinhAnh[2].FileName;
        //    sp.HinhAnh3 = HinhAnh[3].FileName;
        //    sp.HinhAnh4 = HinhAnh[4].FileName;
        //    db.SanPhams.Add(sp);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult TaoMoi(List <HttpPostedFileBase> images, SanPham sp)
        {
            if (images != null)
            {
                //var lstImages = new List<Anh>();
                foreach (var item in images)
                {
                    //lấy tên file ảnh gốc
                    string filename = Path.GetFileName(item.FileName);
                    //gán tên file ảnh đó vào trường hình ảnh
                    sp.HinhAnh = item.FileName;
                    //string pathRoot = "~/Content/trangweb/images/";
                    //string path = Path.Combine(Server.MapPath(pathRoot),filename);
                    //string fullpath = path + filename;
                    //chuyển ảnh đó vào thư mục ảnh,cấu hình webconfig cho đường dẫn ảnh,thay vì dùng đường dẫn vào code ta dùng lại ImagePath
                    string path = @".." + ConfigurationManager.AppSettings["ImagePath"].ToString() + filename;
                    item.SaveAs(Server.MapPath(path));
                    //khởi tạo đối tượng ảnh,gán dữ liệu cho các thuộc tính của ảnh 
                    Anh anh = new Anh
                    {
                        MaSP = sp.MaSP,
                        TenAnh = filename,
                        UrlAnh = ConfigurationManager.AppSettings["ImagePath"].ToString()  // " / Content/trangweb/images/"
                    };
                    db.Anhs.Add(anh); //cho ảnh vào db
                    //lstImages.Add(anh);
                    // =>thừa list ảnh
                }
            }
            db.SanPhams.Add(sp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult ChinhSua(int? id)
        {
            //lấy sp cần chỉnh sửa dựa vào id
            if (id == null)
            {
                Response.StatusCode = 404;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            //load dropdownlist nhà cung cấp,nsx,sp
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", sp.MaNCC);
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai", sp.MaLoaiSP);
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX", sp.MaNSX);
            return View(sp);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ChinhSua(SanPham model,List<HttpPostedFile> images)
        {            
            if (ModelState.IsValid)
            {
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (images != null)
            {
                //var lstImages = new List<Anh>();
                foreach (var item in images)
                {
                    //lấy tên file ảnh gốc
                    string filename = Path.GetFileName(item.FileName);
                    //gán tên file ảnh đó vào trường hình ảnh
                    model.HinhAnh = item.FileName;
                    //string pathRoot = "~/Content/trangweb/images/";
                    //string path = Path.Combine(Server.MapPath(pathRoot),filename);
                    //string fullpath = path + filename;
                    //chuyển ảnh đó vào thư mục ảnh,cấu hình webconfig cho đường dẫn ảnh,thay vì dùng đường dẫn vào code ta dùng lại ImagePath
                    string path = @".." + ConfigurationManager.AppSettings["ImagePath"].ToString() + filename;
                    item.SaveAs(Server.MapPath(path));
                    //khởi tạo đối tượng ảnh,gán dữ liệu cho các thuộc tính của ảnh 
                    Anh anh = new Anh
                    {
                        MaSP = model.MaSP,
                        TenAnh = filename,
                        UrlAnh = ConfigurationManager.AppSettings["ImagePath"].ToString()  // " / Content/trangweb/images/"
                    };
                    db.Anhs.Add(anh); //cho ảnh vào db
                    //lstImages.Add(anh);
                    // =>thừa list ảnh
                }
            }
            db.SanPhams.Add(model);
            db.SaveChanges();
            return View(model);
        }

        [HttpGet]
        public ActionResult Xoa(int? id)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            db.SanPhams.Remove(sp);
            db.SaveChanges();
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