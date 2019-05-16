using NguyenHoangLaptop.Models;
using System;
using System.Collections.Generic;
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
        //public ActionResult TaoMoi(SanPham sp, HttpPostedFileBase[] HinhAnh)
        //{
        //    //load dropdownlist nhà cung cấp,nsx,sp
        //    ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
        //    ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai");
        //    ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
        //    int loi = 0;
        //    for (int i = 0; i < HinhAnh.Count(); i++)
        //    {
        //        if (HinhAnh[i] != null)
        //        {
        //            //Kiểm tra nội dung hình ảnh
        //            if (HinhAnh[i].ContentLength > 0)
        //            {
        //                //Kiểm tra định dạng hình ảnh
        //                if (HinhAnh[i].ContentType != "image/jpeg" && HinhAnh[i].ContentType != "image/png" && HinhAnh[i].ContentType != "image/gif" && HinhAnh[i].ContentType != "image/jpg")
        //                {
        //                    ViewBag.upload += "Hình ảnh" + i + " không hợp lệ <br />";
        //                    loi++;
        //                }
        //                else
        //                {
        //                    //Kiểm tra hình ảnh tồn tại

        //                    //Lấy tên hình ảnh
        //                    string fileName = Path.GetFileName(HinhAnh[0].FileName);
        //                    //Lấy hình ảnh chuyển vào thư mục hình ảnh
        //                    string path = Path.Combine(Server.MapPath("~/Content/trangweb/images"), fileName);
        //                    //Nếu thư mục chứa hình ảnh đó rồi thì xuất ra thông báo
        //                    if (System.IO.File.Exists(path))
        //                    {
        //                        ViewBag.upload1 = "Hình " + i + "đã tồn tại <br />";
        //                        loi++;

        //                    }
        //                }
        //            }
        //        }

        //    }
        //    if (loi > 0)
        //    {
        //        return View(sp);
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
        public ActionResult TaoMoi(List<HttpPostedFileBase> HinhAnh,SanPham sp)
        {
            //load dropdownlist nhà cung cấp,nsx,sp
            ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC");
            ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
            foreach (var item in HinhAnh)
            {

                string filePath = Path.Combine(HttpContext.Server.MapPath("~/Content/trangweb/images"),
                                               Path.GetFileName(item.FileName));
                item.SaveAs(filePath);
            }
            sp.HinhAnh = HinhAnh[0].FileName;
            sp.HinhAnh1 = HinhAnh[1].FileName;
            sp.HinhAnh2 = HinhAnh[2].FileName;
            sp.HinhAnh3 = HinhAnh[3].FileName;
            sp.HinhAnh4 = HinhAnh[4].FileName;
            db.SanPhams.Add(sp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

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
        public ActionResult ChinhSua(SanPham model)
        {
            if (ModelState.IsValid)
            {
                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Xoa(int? id)
        {
            ////lấy sp cần chỉnh sửa dựa vào id
            //if (id == null)
            //{
            //    Response.StatusCode = 404;
            //}
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            //if (sp == null)
            //{
            //    return HttpNotFound();
            //}
            ////load dropdownlist nhà cung cấp,nsx,sp
            //ViewBag.MaNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", sp.MaNCC);
            //ViewBag.MaLoaiSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai", sp.MaLoaiSP);
            //ViewBag.MaNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX", sp.MaNSX);
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