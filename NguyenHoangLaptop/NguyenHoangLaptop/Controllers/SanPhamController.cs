using NguyenHoangLaptop.Models;
using PagedList;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace NguyenHoangLaptop.Controllers
{
    public class SanPhamController : Controller
    {
        private QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();

        // GET: SanPham
        [ChildActionOnly]
        public ActionResult SanPhamPartial()
        {
            return PartialView();
        }

        public ActionResult ChiTietSanPham(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //nếu ko thì truy xuất csdl lấy id sản phẩm
            //db.SanPhams.Where(n => n.MaLoaiSP == 1 && n.MaNSX == 1);
            //SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == id);
            //ViewBag.sp = sp;
            ChiTietSanPham sp = db.ChiTietSanPhams.SingleOrDefault(n => n.MaSP == id);
            //lấy mã sp trong ảnh sp trùng với id truyền vào
            var lstAnhSp = db.Anhs.Where(n => n.SanPham.MaSP == id);
            ViewBag.AnhSanPham = lstAnhSp;
            if (sp == null)
            {
                //thông báo nếu ko có sp đó
                return HttpNotFound();
            }
            return View(sp);
        }

        //load sp theo mã loại sp và mã nsx
        public ActionResult SanPham(int? MaLoaiSP, int? MaNSX, int? page)
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
            return View(lstSanPham.OrderBy(n => n.MaSP).ToPagedList(PageNumber, PageSize));
        }
        [ChildActionOnly]
        public ActionResult DanhMucSanPhamPartial()
        {
            //load tất cả sp
            System.Data.Entity.DbSet<SanPham> lstsp = db.SanPhams;
            return PartialView(lstsp);
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