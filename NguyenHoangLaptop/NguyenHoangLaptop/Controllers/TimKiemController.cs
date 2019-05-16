using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NguyenHoangLaptop.Models;
using PagedList;

namespace NguyenHoangLaptop.Controllers
{
    //[Authorize(Roles = "QuanTri,QuanLyDonHang,QuanLySanPham,DangKy")]
    public class TimKiemController : Controller
    {
        QuanlibanhanglaptopEntities db = new QuanlibanhanglaptopEntities();
        // GET: TimKiem
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult KQTimKiem(string stukhoa,int? page)
        {
            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //phân trang
            int PageSize = 9;
            //tạo biến số trang hiện tại
            int PageNumber = page ?? 1;
            //tìm theo tên sp
            var lstSP = db.SanPhams.Where(n => n.TenSP.Contains(stukhoa) && n.DonGia<=10000000 &&n.DonGia >=1000000);
            
            ViewBag.TuKhoa = stukhoa;
            return View(lstSP.OrderBy(n => n.TenSP).ToPagedList(PageNumber, PageSize));
        }
        [HttpPost]
        public ActionResult TimKiem(string stukhoa)
        {
            //gọi về hàm get tìm kiếm
            return RedirectToAction("KQTimKiem", "TimKiem",new { stukhoa });
        }
        public ActionResult TinKiemPartial(string stukhoa)
        {
            var lstSP = db.SanPhams.Where(n => n.TenSP.Contains(stukhoa));
            ViewBag.TuKhoa = stukhoa;
            return PartialView(lstSP.OrderBy(n=>n.DonGia));
        }

    }
}