using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NguyenHoangLaptop.Models.Metadata
{
    [MetadataTypeAttribute(typeof(SanPhamMetadata))]
    public partial class SanPham
	{
        internal sealed class SanPhamMetadata
        {
            public int MaSP { get; set; }
            public string TenSP { get; set; }
            public Nullable<decimal> DonGia { get; set; }
            public Nullable<System.DateTime> NgayCapNhat { get; set; }
            public string CauHinh { get; set; }
            public string MoTa { get; set; }
            public string HinhAnh { get; set; }
            public string HinhAnh1 { get; set; }
            public string HinhAnh2 { get; set; }
            public string HinhAnh3 { get; set; }
            public string HinhAnh4 { get; set; }
            public int? SoLuongTon { get; set; }
            public Nullable<int> Moi { get; set; }
            public Nullable<bool> DaXoa { get; set; }
            public Nullable<int> MaNSX { get; set; }
            public Nullable<int> MaLoaiSP { get; set; }
            public Nullable<int> MaNCC { get; set; }
        }
    }
}