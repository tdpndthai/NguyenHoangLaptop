using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace NguyenHoangLaptop.Models.Metadata
{
    [MetadataTypeAttribute(typeof(ThanhVienMetadata))]
    public partial class ThanhVien //partial 1 phần của class
    {
        internal sealed class ThanhVienMetadata
        {
            [Display(Name = "Mã Thành Viên")]
            public int MaThanhVien { get; set; }
            [Required(ErrorMessage = "{0} không được để trống")]
            [Display(Name = "Tài Khoản")]
            [StringLength(20, ErrorMessage = "Không được quá 20 kí tự")]
            public string TaiKhoan { get; set; }
            [Display(Name = "Mật Khẩu")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string MatKhau { get; set; }
            [Display(Name = "Nhập Lại Mật Khẩu")]
            [Compare("MatKhau", ErrorMessage = "Mật Khẩu Không Trùng")]
            public string NhapLaiMatKhau { get; set; }
            [Display(Name = "Họ Tên")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string HoTen { get; set; }
            [Display(Name = "Địa Chỉ")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string DiaChi { get; set; }
            [Required(ErrorMessage = "{0} không được để trống")]
            [RegularExpression(@"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z09!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z09-]*[a-z0-9])?)\Z", ErrorMessage = "Email không hợp lệ!")]
            public string Email { get; set; }
            [Display(Name = "Số Điện Thoại")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public Nullable<int> SoDienThoai { get; set; }
            public string CauHoi { get; set; }
            [Display(Name = "Câu Trả Lời")]
            [Required(ErrorMessage = "{0} không được để trống")]
            public string CauTraLoi { get; set; }
            public Nullable<int> MaLoaiTV { get; set; }

        }
    }
}