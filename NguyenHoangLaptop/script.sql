USE [Quanlibanhanglaptop]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[NoiDungBL] [nvarchar](max) NULL,
	[MaThanhVien] [int] NULL,
	[MaSP] [int] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaDDH] [int] NULL,
	[MaSP] [int] NULL,
	[TenSP] [nvarchar](150) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaChiTietPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[DonGiaNhap] [decimal](18, 0) NULL,
	[SoLuongNhap] [int] NULL,
	[MaPhieuNhap] [int] NULL,
	[MaSP] [int] NULL,
 CONSTRAINT [PK_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaChiTietPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[NgayGiao] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[UuDai] [int] NULL,
	[MaKH] [int] NULL,
	[DaHuy] [bit] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Email] [char](150) NULL,
	[SoDienThoai] [int] NULL,
	[MaThanhVien] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](150) NULL,
	[Icon] [nchar](150) NULL,
	[BiDanh] [nvarchar](150) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiThanhVien]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThanhVien](
	[MaLoaiTV] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[UuDai] [int] NULL,
 CONSTRAINT [PK_LoaiThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[Email] [varchar](150) NULL,
	[SoDienThoai] [int] NULL,
	[Fax] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](100) NULL,
	[ThongTin] [nvarchar](250) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[DaXoa] [bit] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [nvarchar](50) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen_LoaiTV]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen_LoaiTV](
	[MaLoaiTV] [int] NOT NULL,
	[MaQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiTV] ASC,
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](150) NULL,
	[DonGia] [decimal](18, 0) NULL,
	[NgayCapNhat] [datetime] NULL,
	[CauHinh] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnh] [nchar](100) NULL,
	[HinhAnh1] [nchar](100) NULL,
	[HinhAnh2] [nchar](100) NULL,
	[HinhAnh3] [nchar](100) NULL,
	[HinhAnh4] [nchar](100) NULL,
	[SoLuongTon] [int] NULL,
	[Moi] [int] NULL,
	[DaXoa] [bit] NULL,
	[MaNSX] [int] NULL,
	[MaLoaiSP] [int] NULL,
	[MaNCC] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaThanhVien] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](150) NULL,
	[NhapLaiMatKhau] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[HoTen] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Email] [char](150) NULL,
	[SoDienThoai] [int] NULL,
	[CauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[MaLoaiTV] [int] NULL,
 CONSTRAINT [PK_ThanhVien] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ChiTietSanPham]    Script Date: 5/16/2019 9:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ChiTietSanPham]
AS
SELECT        dbo.SanPham.MaSP, dbo.SanPham.TenSP, dbo.SanPham.DonGia, dbo.SanPham.CauHinh, dbo.SanPham.HinhAnh, dbo.SanPham.HinhAnh1, dbo.SanPham.HinhAnh2, dbo.SanPham.HinhAnh3, dbo.SanPham.HinhAnh4, 
                         dbo.LoaiSanPham.MaLoaiSP, dbo.LoaiSanPham.TenLoai, dbo.NhaCungCap.TenNCC, dbo.NhaSanXuat.TenNSX, dbo.SanPham.SoLuongTon, dbo.SanPham.Moi
FROM            dbo.SanPham LEFT OUTER JOIN
                         dbo.NhaCungCap ON dbo.SanPham.MaNCC = dbo.NhaCungCap.MaNCC INNER JOIN
                         dbo.NhaSanXuat ON dbo.SanPham.MaNSX = dbo.NhaSanXuat.MaNSX LEFT OUTER JOIN
                         dbo.LoaiSanPham ON dbo.SanPham.MaLoaiSP = dbo.LoaiSanPham.MaLoaiSP

GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] ON 

INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1012, 1016, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1013, 1017, 13, N'HP Elitebook 840 G1', 1, CAST(6200000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1014, 1018, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1015, 1019, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1016, 1020, 13, N'HP Elitebook 840 G1', 1, CAST(6200000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1017, 1021, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1018, 1022, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1019, 1023, 6, N'Dell Precision M4600', 1, CAST(9200000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1020, 1024, 4, N'Dell Latitude E7480', 1, CAST(13990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1021, 1025, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1022, 1025, 2, N'Dell Latitude E7250', 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1023, 1025, 4, N'Dell Latitude E7480', 1, CAST(13990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1024, 1026, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1025, 1027, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1026, 1027, 3, N'Dell Latitude E7740', 1, CAST(6900000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1027, 1027, 2, N'Dell Latitude E7250', 1, CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1028, 1028, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDDH], [MaDDH], [MaSP], [TenSP], [SoLuong], [DonGia]) VALUES (1029, 1029, 1, N'Dell Latitude E5440', 1, CAST(5590000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] OFF
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1016, CAST(N'2019-05-01 16:53:24.557' AS DateTime), 0, NULL, 0, 0, 11, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1017, CAST(N'2019-05-01 17:02:20.580' AS DateTime), 0, NULL, 0, 0, 12, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1018, CAST(N'2019-05-01 17:04:51.483' AS DateTime), 0, NULL, 0, 0, 13, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1019, CAST(N'2019-05-01 17:07:19.520' AS DateTime), 0, NULL, 0, 0, 14, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1020, CAST(N'2019-05-01 17:10:48.523' AS DateTime), 0, NULL, 0, 0, 15, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1021, CAST(N'2019-05-01 17:12:41.097' AS DateTime), 0, NULL, 0, 0, 16, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1022, CAST(N'2019-05-01 17:16:13.657' AS DateTime), 0, NULL, 0, 0, 17, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1023, CAST(N'2019-05-01 17:20:34.140' AS DateTime), 0, NULL, 0, 0, 18, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1024, CAST(N'2019-05-01 18:14:58.163' AS DateTime), 0, NULL, 0, 0, 19, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1025, CAST(N'2019-05-02 08:55:29.210' AS DateTime), 0, NULL, 0, 0, 20, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1026, CAST(N'2019-05-02 13:22:29.100' AS DateTime), 0, NULL, 0, 0, 21, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1027, CAST(N'2019-05-02 14:23:17.293' AS DateTime), 0, NULL, 0, 0, 22, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1028, CAST(N'2019-05-02 14:25:11.937' AS DateTime), 0, NULL, 0, 0, 23, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [TinhTrangGiaoHang], [NgayGiao], [DaThanhToan], [UuDai], [MaKH], [DaHuy]) VALUES (1029, CAST(N'2019-05-02 14:26:35.647' AS DateTime), 0, NULL, 0, 0, 24, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (7, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (8, NULL, NULL, NULL, 123456789, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (13, N'nguyễn văn a', N'hòa bình', N'nguyenvana@gmail.com                                                                                                                                  ', 123456789, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (16, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (17, N'Nguyễn Danh Thái', NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (18, N'Nguyễn Danh Thái', NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (19, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (20, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (21, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (22, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (23, N'co Hương', N'139 Cầu Giấy', N'abc@gmail.com                                                                                                                                         ', 123456789, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [Email], [SoDienThoai], [MaThanhVien]) VALUES (24, N'Nguyễn Danh Thái', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (1, N'Laptop Dell', NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [Icon], [BiDanh]) VALUES (2, N'Laptop HP', NULL, NULL)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] ON 

INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (1, N'Admin', 100)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (2, N'Member', 50)
INSERT [dbo].[LoaiThanhVien] ([MaLoaiTV], [TenLoai], [UuDai]) VALUES (3, N'Customer', 20)
SET IDENTITY_INSERT [dbo].[LoaiThanhVien] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (1, N'Dell', NULL, NULL, NULL, NULL)
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [Email], [SoDienThoai], [Fax]) VALUES (2, N'HP', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhaSanXuat] ON 

INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (1, N'Dell Latitude', N'dell', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (2, N'Dell Precision', N'dell', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (3, N'Dell Inspiron', N'dell', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (5, N'HP Elitebook', N'hp', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (6, N'HP Probook', N'hp', NULL)
INSERT [dbo].[NhaSanXuat] ([MaNSX], [TenNSX], [ThongTin], [Logo]) VALUES (7, N'HP Zbook', N'hp', NULL)
SET IDENTITY_INSERT [dbo].[NhaSanXuat] OFF
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'DangKy', N'Đăng Ký')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'PhanQuyen', N'Phân Quyền')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLyDonHang', N'Quản lí đơn hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanLySanPham', N'Quản lí sản phẩm\')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen]) VALUES (N'QuanTri', N'Quản Trị')
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'DangKy', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'PhanQuyen', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLyDonHang', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanLySanPham', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (1, N'QuanTri', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'DangKy', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (2, N'QuanLyDonHang', NULL)
INSERT [dbo].[Quyen_LoaiTV] ([MaLoaiTV], [MaQuyen], [GhiChu]) VALUES (3, N'DangKy', NULL)
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (1, N'Dell Latitude E5440', CAST(5590000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Latitude E5440 |i5-4310U | Ram 4GB | HDD 250GB | 14″ HD | Card On', NULL, N'dell-latitude-E5440.jpg                                                                             ', N'dell-latitude-E5440.jpg                                                                             ', N'dell-latitude-E5440.jpg                                                                             ', N'dell-latitude-E5440.jpg                                                                             ', N'dell-latitude-E5440.jpg                                                                             ', 16, 1, 1, 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (2, N'Dell Latitude E7250', CAST(9000000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Latitude E7250 | Core i7 5600U | Ram 8GB | SSD 256GB |12.5 inch HD | intel HD Graphic 5500', NULL, N'dell-latitude-E7250.jpg                                                                             ', N'dell-latitude-E7250.jpg                                                                             ', N'dell-latitude-E7250.jpg                                                                             ', N'dell-latitude-E7250.jpg                                                                             ', N'dell-latitude-E7250.jpg                                                                             ', 65, 1, 1, 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (3, N'Dell Latitude E7740', CAST(6900000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Latitude E7440 |i5-4300U | Ram 4GB | SSD 128GB |MÀN HD', NULL, N'DELL-LATITUDE-E7440.jpg                                                                             ', N'DELL-LATITUDE-E7440.jpg                                                                             ', N'DELL-LATITUDE-E7440.jpg                                                                             ', N'DELL-LATITUDE-E7440.jpg                                                                             ', N'DELL-LATITUDE-E7440.jpg                                                                             ', 136, 1, 1, 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (4, N'Dell Latitude E7480', CAST(13990000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Laptop Cũ Dell Latitude e7480/ i5*6300U/ RAM 8G/ Ổ SSD 256GB/ MÀN 14.0 Full HD/ Card On', NULL, N'Latitude-E7480.jpg                                                                                  ', N'Latitude-E7480.jpg                                                                                  ', N'Latitude-E7480.jpg                                                                                  ', N'Latitude-E7480.jpg                                                                                  ', N'Latitude-E7480.jpg                                                                                  ', 15, 1, 1, 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (5, N'Dell Precision 3510', CAST(18990000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Precision M4800 Mobile Workstation i7 4800MQ/ 4900MQ/ VGA K1100M/ K2100', NULL, N'Dell-Precision-3510.jpg                                                                             ', N'Dell-Precision-3510.jpg                                                                             ', N'Dell-Precision-3510.jpg                                                                             ', N'Dell-Precision-3510.jpg                                                                             ', N'Dell-Precision-3510.jpg                                                                             ', 56, 1, 1, 2, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (6, N'Dell Precision M4600', CAST(9200000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Precision M4600 i7* 2720QM| 2820QM |2860QM| RAM 8G | HDD 320G | 15.6” FullHD | VGA RỜI NVIDIA 1000M/2000M', NULL, N'Dell-Precision-m4600.jpg                                                                            ', N'Dell-Precision-m4600.jpg                                                                            ', N'Dell-Precision-m4600.jpg                                                                            ', N'Dell-Precision-m4600.jpg                                                                            ', N'Dell-Precision-m4600.jpg                                                                            ', 23, 1, 1, 2, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (7, N'Dell Precision M4800', CAST(13990000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Precision M4800 Mobile Workstation i7 4800MQ/ 4900MQ/ VGA K1100M/ K2100', NULL, N'Dell-Precision-M4800.jpg                                                                            ', N'Dell-Precision-M4800.jpg                                                                            ', N'Dell-Precision-M4800.jpg                                                                            ', N'Dell-Precision-M4800.jpg                                                                            ', N'Dell-Precision-M4800.jpg                                                                            ', 23, 1, 1, 2, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (8, N'Dell Insprion 3420', CAST(4800000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Inspiron 3420| i5 – 2430U | RAM 4 GB | HDD 320GB | 14” HD |Intel HD graphics 3000', NULL, N'N3420.jpg                                                                                           ', N'N3420.jpg                                                                                           ', N'N3420.jpg                                                                                           ', N'N3420.jpg                                                                                           ', N'N3420.jpg                                                                                           ', 56, 1, 1, 3, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (9, N'Dell Insprion N4050', CAST(4900000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell inspiron N4050 | Core i5-2430M | Ram 4G | Ổ 250G | Màn 14″ | HD |Intel HD Graphics 3000', NULL, N'n4050.jpg                                                                                           ', N'n4050.jpg                                                                                           ', N'n4050.jpg                                                                                           ', N'n4050.jpg                                                                                           ', N'n4050.jpg                                                                                           ', 154, 1, 1, 3, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (10, N'Dell Insprion 7537', CAST(13500000 AS Decimal(18, 0)), CAST(N'2018-04-14 00:00:00.000' AS DateTime), N'Dell Inspiron 7537 | i7 4500U | RAM 6 GB |HDD 500GB | 15.6” HD | VGA NVIDIA® GeForce® GT 750M (2gb)', NULL, N'7537.jpg                                                                                            ', N'7537.jpg                                                                                            ', N'7537.jpg                                                                                            ', N'7537.jpg                                                                                            ', N'7537.jpg                                                                                            ', 156, 1, 1, 3, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (11, N'HP Elitebook X360', CAST(23000000 AS Decimal(18, 0)), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'Hp EliteBook x360 1030 G2 i5 7300U | RAM 8GB | SSD 512GB | 14 Inches Full HD | Card on Cảm Ứng', NULL, N'Hp-EliteBook-x360.jpg                                                                               ', N'Hp-EliteBook-x360.jpg                                                                               ', N'Hp-EliteBook-x360.jpg                                                                               ', N'Hp-EliteBook-x360.jpg                                                                               ', N'Hp-EliteBook-x360.jpg                                                                               ', 131, 1, 1, 5, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (12, N'HP Elitebook Folio 1020 G1', CAST(13500000 AS Decimal(18, 0)), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'HP EliteBook Folio 1020 G1 Core M5y71 / Ram 8GB/ SSD 256GB/ Màn 12.5″ 2K card on.', NULL, N'ELITEBOOK-1040-G1.jpg                                                                               ', N'ELITEBOOK-1040-G1.jpg                                                                               ', N'ELITEBOOK-1040-G1.jpg                                                                               ', N'ELITEBOOK-1040-G1.jpg                                                                               ', N'ELITEBOOK-1040-G1.jpg                                                                               ', 252, 1, 1, 5, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (13, N'HP Elitebook 840 G1', CAST(6200000 AS Decimal(18, 0)), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'Hp Elitebook 840 G1 i5 4300U | RAM 4G | HDD 250G | 14.0” HD | On', NULL, N'hp-840-g1.jpg                                                                                       ', N'hp-840-g1.jpg                                                                                       ', N'hp-840-g1.jpg                                                                                       ', N'hp-840-g1.jpg                                                                                       ', N'hp-840-g1.jpg                                                                                       ', 546, 1, 1, 5, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (14, N'HP Probook 6570b', CAST(5600000 AS Decimal(18, 0)), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'Hp Probook 6570b i5-3230M | RAM 4GB | HDD 250GB | 15.6” HD | VGA Rời HD 7570M', NULL, N'hp-elitebook-430-g2.jpg                                                                             ', N'hp-elitebook-430-g2.jpg                                                                             ', N'hp-elitebook-430-g2.jpg                                                                             ', N'hp-elitebook-430-g2.jpg                                                                             ', N'hp-elitebook-430-g2.jpg                                                                             ', 214, 1, 1, 6, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (15, N'HP Probook 450 G2', CAST(7500000 AS Decimal(18, 0)), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'Hp Probook 450 G2 i5 4210U | RAM 4G | HDD 320G | 15.6” HD | Card on', NULL, N'hp-elitebook-8470p.jpg                                                                              ', N'hp-elitebook-8470p.jpg                                                                              ', N'hp-elitebook-8470p.jpg                                                                              ', N'hp-elitebook-8470p.jpg                                                                              ', N'hp-elitebook-8470p.jpg                                                                              ', 545, 1, 1, 6, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (16, N'HP Probook 6560b', CAST(4700000 AS Decimal(18, 0)), CAST(N'2018-04-15 00:00:00.000' AS DateTime), N'HP Probook 6560b i5 2520M | 4gb | Card on | 250 gb | 15.6″ Inch HD', NULL, N'hp-elitebook-850-g1.jpg                                                                             ', N'hp-elitebook-850-g1.jpg                                                                             ', N'hp-elitebook-850-g1.jpg                                                                             ', N'hp-elitebook-850-g1.jpg                                                                             ', N'hp-elitebook-850-g1.jpg                                                                             ', 65, 1, 1, 6, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (17, N'HP Zbook 15 G2', CAST(11800000 AS Decimal(18, 0)), CAST(N'2018-04-16 00:00:00.000' AS DateTime), N'Laptop cũ HP ZBook 15 G2 i7-4810MQ | RAM 8GB | SSD 256 GB | 15.6” FullHD | VGA NVIDIA K1100M', NULL, N'hp-zbook-15-g2.jpg                                                                                  ', N'hp-zbook-15-g2.jpg                                                                                  ', N'hp-zbook-15-g2.jpg                                                                                  ', N'hp-zbook-15-g2.jpg                                                                                  ', N'hp-zbook-15-g2.jpg                                                                                  ', 15, 1, 1, 7, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (18, N'HP Zbook 15 G3', CAST(25490000 AS Decimal(18, 0)), CAST(N'2018-04-16 00:00:00.000' AS DateTime), N'Laptop HP zbook 15 g3 Core i7 6700HQ/ RAM 8 GB/ SSD 512GB/ 15.6″ FHD/ CARD NVIDIA QUADRO M1000M', NULL, N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', 65, 1, 1, 7, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (19, N'HP Zbook 15 G1', CAST(10800000 AS Decimal(18, 0)), CAST(N'2018-04-16 00:00:00.000' AS DateTime), N'HP ZBook 15 G1 i7 4800MQ | RAM 8GB | HDD 500 GB | 15.6” FullHD | VGA NVIDIA K1100M', NULL, N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', N'Hp-Zbook-15-G3.jpg                                                                                  ', 230, 1, 1, 7, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (33, N'Dell Latitude E6520', CAST(4900000 AS Decimal(18, 0)), CAST(N'2019-05-08 00:00:00.000' AS DateTime), NULL, NULL, N'Dell-Latitude-E6520.jpg                                                                             ', N'Dell-Latitude-E6520.jpg                                                                             ', N'Dell-Latitude-E6520.jpg                                                                             ', N'Dell-Latitude-E6520.jpg                                                                             ', N'Dell-Latitude-E6520.jpg                                                                             ', 180, 1, 1, 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGia], [NgayCapNhat], [CauHinh], [MoTa], [HinhAnh], [HinhAnh1], [HinhAnh2], [HinhAnh3], [HinhAnh4], [SoLuongTon], [Moi], [DaXoa], [MaNSX], [MaLoaiSP], [MaNCC]) VALUES (57, N'Hp EliteBook x360 1030 G2', CAST(29500000 AS Decimal(18, 0)), CAST(N'2019-05-16 00:00:00.000' AS DateTime), N'i7 7600U | RAM 16GB | SSD 512GB | 14 Inches Full HD | Card on Cảm Ứng', NULL, N'Laptop-Tcc-Hp-EliteBook-1030-g2-x360.jpg                                                            ', N'Laptop-Tcc-Hp-EliteBook-1030-g2-x360-1.jpg                                                          ', N'Laptop-Tcc-Hp-EliteBook-1030-g2-x360-2.jpg                                                          ', N'Laptop-Tcc-Hp-EliteBook-1030-g2-x360-3.jpg                                                          ', N'Laptop-Tcc-Hp-EliteBook-1030-g2-x360-4.jpg                                                          ', 50, 15, 1, 5, 2, 2)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThanhVien] ON 

INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [NhapLaiMatKhau], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (0, N'ThaiNguyen', NULL, N'1605', N'Nguyễn Danh Thái', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [NhapLaiMatKhau], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (1, N'nguyenson', NULL, N'12345', N'nguyễn danh sơn', N'hà nội', N'nguyendanhson@gmail.com                                                                                                                               ', 123456789, N'your name', N'your name', 2)
INSERT [dbo].[ThanhVien] ([MaThanhVien], [TaiKhoan], [NhapLaiMatKhau], [MatKhau], [HoTen], [DiaChi], [Email], [SoDienThoai], [CauHoi], [CauTraLoi], [MaLoaiTV]) VALUES (2, N'trunghieu', NULL, N'12345', N'Hoàng Trung Hiếu', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ThanhVien] OFF
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_ThanhVien]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_ChiTietPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ThanhVien] FOREIGN KEY([MaThanhVien])
REFERENCES [dbo].[ThanhVien] ([MaThanhVien])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ThanhVien]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[Quyen_LoaiTV]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_LoaiTV_LoaiTV] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Quyen_LoaiTV] CHECK CONSTRAINT [FK_Quyen_LoaiTV_LoaiTV]
GO
ALTER TABLE [dbo].[Quyen_LoaiTV]  WITH CHECK ADD  CONSTRAINT [FK_Quyen_LoaiTV_Quyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[Quyen] ([MaQuyen])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Quyen_LoaiTV] CHECK CONSTRAINT [FK_Quyen_LoaiTV_Quyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNSX])
REFERENCES [dbo].[NhaSanXuat] ([MaNSX])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [FK_ThanhVien_LoaiThanhVien] FOREIGN KEY([MaLoaiTV])
REFERENCES [dbo].[LoaiThanhVien] ([MaLoaiTV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [FK_ThanhVien_LoaiThanhVien]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[16] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "LoaiSanPham"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NhaCungCap"
            Begin Extent = 
               Top = 49
               Left = 507
               Bottom = 179
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NhaSanXuat"
            Begin Extent = 
               Top = 138
               Left = 248
               Bottom = 268
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChiTietSanPham'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'440
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChiTietSanPham'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ChiTietSanPham'
GO
