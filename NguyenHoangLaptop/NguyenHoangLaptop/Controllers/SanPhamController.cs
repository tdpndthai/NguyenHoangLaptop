using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;
using PagedList;

namespace NguyenHoangLaptop.Controllers
{
    public class SanPhamController : Controller
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        // GET: SanPham
        public ActionResult SanPhamPartial()
        {
            return PartialView();
        }
        public ActionResult ChiTietSanPham(int? id)
        {
            //kiểm tra xem tham số truyền vào có rỗng hay không?
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //nếu ko thì truy xuất csdl lấy id sản phẩm
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id && n.DaXoa==true);
            if (sp == null)
            {
                //thông báo nếu ko có sp đó
                return HttpNotFound();
            }
            return View(sp);
        }
        //load sp theo mã loại sp và mã nsx
        public ActionResult SanPham(int? MaLoaiSP,int? MaNSX,int? page)
        {
            if (MaLoaiSP == null || MaNSX == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            // load sp theo tiêu chí mã loại sp và mã nsx
            var lstSanPham = db.SanPhams.Where(n => n.MaLoaiSP == MaLoaiSP && n.MaNSX == MaNSX);
            if (lstSanPham.Count() == 0)
            {
                //thông báo nếu ko có sp
                return HttpNotFound();
            }
            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //phân trang
            int PageSize = 9;
            //tạo biến số trang hiện tại
            int PageNumber = (page ?? 1);
            ViewBag.MaLoaiSP = MaLoaiSP;
            ViewBag.MaNSX = MaNSX;
            return View(lstSanPham.OrderBy(n=>n.MaSP).ToPagedList(PageNumber,PageSize));
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