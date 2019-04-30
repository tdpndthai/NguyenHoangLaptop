using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NguyenHoangLaptop.Models
{
    public class itemGioHang
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }
        public string HinhAnh { get; set; }

        //khởi tạo giỏ hàng
        public itemGioHang(int iMaSP)
        {
            using (QuanlibanhanglaptopEntities1 db = new QuanlibanhanglaptopEntities1())
            {
                MaSP = iMaSP;
                SanPham sp = db.SanPham.Single(n => n.MaSP == iMaSP);
                TenSP = sp.TenSP; //hàm tạo lấy sản phẩm
                HinhAnh = sp.HinhAnh;
                DonGia = sp.DonGia.Value;
                SoLuong = 1;
                ThanhTien = DonGia*SoLuong;

            }
        }
        public itemGioHang(int iMaSP,int sl)
        {
            using (QuanlibanhanglaptopEntities1 db = new QuanlibanhanglaptopEntities1())
            {
                MaSP = iMaSP;
                SanPham sp = db.SanPham.Single(n => n.MaSP == iMaSP);
                TenSP = sp.TenSP; //hàm tạo lấy sản phẩm
                HinhAnh = sp.HinhAnh;
                DonGia = sp.DonGia.Value;
                SoLuong = sl;
                ThanhTien = DonGia * SoLuong;

            }
        }
        public itemGioHang()
        {

        }
    }
}