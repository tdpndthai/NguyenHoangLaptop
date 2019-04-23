using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;

namespace NguyenHoangLaptop.Controllers
{
    public class SanPhamController : Controller
    {
        QuanlibanhanglaptopEntities1 db = new QuanlibanhanglaptopEntities1();
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
            SanPham sp = db.SanPham.SingleOrDefault(n => n.MaSP == id && n.DaXoa==true);
            if (sp == null)
            {
                //thông báo nếu ko có sp đó
                return HttpNotFound();
            }
            return View(sp);
        }
        //load sp theo mã loại sp và mã nsx
        public ActionResult SanPham(int? MaLoaiSP,int? MaNSX)
        {
            if (MaLoaiSP == null || MaNSX == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            // load sp theo tiêu chí mã loại sp và mã nsx
            var lstSanPham = db.SanPham.Where(n => n.MaLoaiSP == MaLoaiSP && n.MaNSX == MaNSX);
            if (lstSanPham.Count() == 0)
            {
                //thông báo nếu ko có sp
                return HttpNotFound();
            }
            return View(lstSanPham);
        }
    }
}