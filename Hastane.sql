USE [Hastane]
GO
/****** Object:  Table [dbo].[tbl_Hasta]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Hasta](
	[Hasta_id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Cinsiyet] [char](1) NOT NULL,
	[Tc] [nvarchar](11) NOT NULL,
	[Doğum_Tarihi] [date] NOT NULL,
	[Telefon] [nvarchar](14) NOT NULL,
	[Ssk_Durum] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Hasta] PRIMARY KEY CLUSTERED 
(
	[Hasta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kasa]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Kasa](
	[Kasa_id] [int] IDENTITY(1,1) NOT NULL,
	[total] [float] NOT NULL,
	[P_id_Muhasebe] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Kasa] PRIMARY KEY CLUSTERED 
(
	[Kasa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Maas]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Maas](
	[Maas_id] [int] IDENTITY(1,1) NOT NULL,
	[Personel_id] [int] NOT NULL,
	[Maas] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Maas] PRIMARY KEY CLUSTERED 
(
	[Maas_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Malzemeler]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Malzemeler](
	[M_id] [int] IDENTITY(1,1) NOT NULL,
	[Tedarik_id] [int] NOT NULL,
	[Pers_id] [int] NOT NULL,
	[Adı] [nvarchar](max) NOT NULL,
	[Stok] [int] NOT NULL,
	[Ucret] [float] NOT NULL,
	[Detay] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Malzemeler] PRIMARY KEY CLUSTERED 
(
	[M_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Personel]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Personel](
	[Personel_id] [int] IDENTITY(1,1) NOT NULL,
	[P_Ad] [nvarchar](50) NOT NULL,
	[P_Soyad] [nvarchar](50) NOT NULL,
	[P_Dogum_Tarihi] [date] NOT NULL,
	[P_TC] [nchar](11) NOT NULL,
	[P_Görev] [nvarchar](50) NOT NULL,
	[Yetki] [int] NOT NULL,
	[P_Telefon] [nvarchar](14) NOT NULL,
	[P_Adres] [nvarchar](max) NOT NULL,
	[P_Not] [nvarchar](max) NULL,
	[sifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Personel] PRIMARY KEY CLUSTERED 
(
	[Personel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Randevular]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Randevular](
	[Randevu_id] [int] IDENTITY(1,1) NOT NULL,
	[Hasta_id] [int] NOT NULL,
	[Doktor_id] [int] NOT NULL,
	[R_Zamanı] [datetime] NOT NULL,
	[Sikayet] [nvarchar](50) NOT NULL,
	[Ucret] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Randevular] PRIMARY KEY CLUSTERED 
(
	[Randevu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Receteler]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Receteler](
	[Recete_id] [int] IDENTITY(1,1) NOT NULL,
	[Randevu_id] [int] NOT NULL,
	[Acıklama] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Receteler] PRIMARY KEY CLUSTERED 
(
	[Recete_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tedarikciler]    Script Date: 26.10.2022 21:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tedarikciler](
	[Tedarikci_id] [int] IDENTITY(1,1) NOT NULL,
	[T_Ad] [nvarchar](50) NOT NULL,
	[T_Adres] [nvarchar](max) NOT NULL,
	[T_Telefon] [nvarchar](50) NOT NULL,
	[Alacak] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Tedarikciler] PRIMARY KEY CLUSTERED 
(
	[Tedarikci_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Hasta] ON 

INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (3, N'İclal', N'Akkoyun', N'K', N'11111111110', CAST(N'1990-01-01' AS Date), N'111', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (4, N'Ali', N'Kutlu', N'E', N'11111111111', CAST(N'1995-10-10' AS Date), N'112', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (5, N'Rana', N'Altın', N'K', N'11111111112', CAST(N'1453-10-05' AS Date), N'113', N'Pasif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (6, N'Halim', N'Aral', N'E', N'11111111113', CAST(N'1990-01-10' AS Date), N'114', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (7, N'Fatih', N'Köle', N'E', N'11111111114', CAST(N'1955-07-09' AS Date), N'115', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (8, N'Ebubekir', N'Sezer', N'E', N'11111111115', CAST(N'1989-05-25' AS Date), N'116', N'Pasif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (9, N'Elif', N'Sezer', N'K', N'11111111116', CAST(N'1978-05-17' AS Date), N'117', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (10, N'Tuğba', N'Fındık', N'K', N'11111111117', CAST(N'1975-11-15' AS Date), N'118', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (11, N'Furkan', N'Kutlu', N'E', N'11111111118', CAST(N'2001-03-14' AS Date), N'119', N'Aktif     ')
INSERT [dbo].[tbl_Hasta] ([Hasta_id], [Ad], [Soyad], [Cinsiyet], [Tc], [Doğum_Tarihi], [Telefon], [Ssk_Durum]) VALUES (12, N'Ali', N'Yüce', N'E', N'11111111119', CAST(N'2000-10-14' AS Date), N'120', N'Aktif     ')
SET IDENTITY_INSERT [dbo].[tbl_Hasta] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Kasa] ON 

INSERT [dbo].[tbl_Kasa] ([Kasa_id], [total], [P_id_Muhasebe]) VALUES (1, 40000000, 11)
SET IDENTITY_INSERT [dbo].[tbl_Kasa] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Maas] ON 

INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (1, 1, 10000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (2, 4, 15000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (3, 5, 25000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (4, 6, 40000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (7, 7, 7500)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (9, 9, 7400)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (10, 10, 9050)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (11, 11, 12500)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (12, 12, 6000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (13, 13, 5500)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (15, 14, 4250)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (16, 15, 5500)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (17, 16, 17500)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (18, 17, 15000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (19, 18, 15000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (20, 19, 15000)
INSERT [dbo].[tbl_Maas] ([Maas_id], [Personel_id], [Maas]) VALUES (21, 20, 16000)
SET IDENTITY_INSERT [dbo].[tbl_Maas] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Malzemeler] ON 

INSERT [dbo].[tbl_Malzemeler] ([M_id], [Tedarik_id], [Pers_id], [Adı], [Stok], [Ucret], [Detay]) VALUES (1, 1, 11, N'Temizlik', 50, 5000, NULL)
INSERT [dbo].[tbl_Malzemeler] ([M_id], [Tedarik_id], [Pers_id], [Adı], [Stok], [Ucret], [Detay]) VALUES (2, 2, 11, N'Önlük', 50, 2000, NULL)
INSERT [dbo].[tbl_Malzemeler] ([M_id], [Tedarik_id], [Pers_id], [Adı], [Stok], [Ucret], [Detay]) VALUES (3, 2, 11, N'Ayakkabı', 50, 1000, NULL)
INSERT [dbo].[tbl_Malzemeler] ([M_id], [Tedarik_id], [Pers_id], [Adı], [Stok], [Ucret], [Detay]) VALUES (4, 1, 11, N'Maske', 500, 1000, NULL)
INSERT [dbo].[tbl_Malzemeler] ([M_id], [Tedarik_id], [Pers_id], [Adı], [Stok], [Ucret], [Detay]) VALUES (5, 3, 11, N'Ameliyat malzemeleri ', 50, 8000, NULL)
INSERT [dbo].[tbl_Malzemeler] ([M_id], [Tedarik_id], [Pers_id], [Adı], [Stok], [Ucret], [Detay]) VALUES (6, 3, 11, N'Çarşaf', 100, 1000, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Malzemeler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Personel] ON 

INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (1, N'Burak', N'Karaküçük', CAST(N'1996-05-05' AS Date), N'12365478911', N'Kalp ve Damar', 1, N'1453', N'Çankaya', NULL, N'123')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (4, N'Cihat ', N'Toparlak', CAST(N'1998-01-01' AS Date), N'12345789321', N'Üroloji', 1, N'3654', N'Beykoz', NULL, N'456')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (5, N'Mert', N'Kutlu', CAST(N'1998-05-05' AS Date), N'44505063985', N'Başhekim Yard.', 3, N'6987', N'Pendik', NULL, N'789')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (6, N'Mehmet', N'Akkuş', CAST(N'1985-10-10' AS Date), N'45698714785', N'Başhekim', 3, N'7896', N'Adana', NULL, N'101')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (7, N'Neval', N'Türk', CAST(N'1998-05-05' AS Date), N'14789632587', N'Sekreter', 1, N'78965', N'Üsküdar', NULL, N'121')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (9, N'Mısra', N'Mısır', CAST(N'1980-10-11' AS Date), N'14785231458', N'Sekreter', 1, N'14752', N'Sultanbeyli', NULL, N'141')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (10, N'Devrim', N'Pattaban', CAST(N'1985-10-15' AS Date), N'14785963257', N'IT', 3, N'1478', N'Kastamonu', NULL, N'161')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (11, N'Büşra', N'Söyünmez', CAST(N'1995-12-15' AS Date), N'14789541789', N'Muhasebe', 2, N'1474', N'Mecidiyeköy', NULL, N'181')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (12, N'Sena', N'Ekincioğlu', CAST(N'1996-11-25' AS Date), N'14589674122', N'Hemşire', 1, N'1245', N'Beşiktaş', NULL, N'202')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (13, N'Muhammet', N'Bedir', CAST(N'1995-07-14' AS Date), N'12345688711', N'Hemşire', 1, N'1998', N'Şişli', NULL, N'222')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (14, N'Burak', N'Alkan', CAST(N'1968-07-25' AS Date), N'12030054787', N'Temizlik', 0, N'14733', N'Erzincan', NULL, N'--')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (15, N'Murat', N'Fındık', CAST(N'1995-05-04' AS Date), N'12589674125', N'ATT Çalışanı', 0, N'1258', N'Çankırı', NULL, N'')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (16, N'İbrahim', N'Kutlu', CAST(N'1947-05-08' AS Date), N'12547896322', N'Dahiliye', 1, N'5589', N'Erizncan', NULL, N'232')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (17, N'Mehmet Mert', N'Tutunmaz', CAST(N'1453-07-08' AS Date), N'12547852410', N'Dahiliye', 1, N'2200', N'Beyliküdüzü', NULL, N'252')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (18, N'İlker', N'Yüce', CAST(N'1997-05-12' AS Date), N'12563241025', N'Çocuk', 1, N'1112', N'Gaziosmanpaşa', NULL, N'272')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (19, N'Berkcan', N'Araz', CAST(N'1687-08-08' AS Date), N'12365897411', N'Çocuk', 1, N'1002', N'Yalova', NULL, N'293')
INSERT [dbo].[tbl_Personel] ([Personel_id], [P_Ad], [P_Soyad], [P_Dogum_Tarihi], [P_TC], [P_Görev], [Yetki], [P_Telefon], [P_Adres], [P_Not], [sifre]) VALUES (20, N'Erhan', N'Sessiz', CAST(N'1978-08-09' AS Date), N'14523652411', N'Kalp ve Damar', 1, N'1199', N'Tuzla', NULL, N'313')
SET IDENTITY_INSERT [dbo].[tbl_Personel] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Randevular] ON 

INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (6, 3, 1, CAST(N'2022-10-27T08:00:00.000' AS DateTime), N'Kalp Krizi', 500)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (8, 4, 1, CAST(N'2022-10-27T09:00:00.000' AS DateTime), N'Kalp Krizi', 500)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (9, 5, 4, CAST(N'2022-10-27T10:00:00.000' AS DateTime), N'İdrar Kaçağı', 800)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (13, 6, 16, CAST(N'2022-10-27T11:00:00.000' AS DateTime), N'Karın Ağrısı', 300)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (16, 7, 18, CAST(N'2022-10-27T12:00:00.000' AS DateTime), N'Ateş', 150)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (17, 8, 17, CAST(N'2022-10-27T14:00:00.000' AS DateTime), N'İnce Hastalık', 200)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (18, 9, 20, CAST(N'2022-10-27T15:00:00.000' AS DateTime), N'Kalp Sıkışması', 350)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (19, 10, 19, CAST(N'2022-10-27T15:00:00.000' AS DateTime), N'Kızamık', 150)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (21, 11, 19, CAST(N'2022-10-27T16:00:00.000' AS DateTime), N'Ateş', 250)
INSERT [dbo].[tbl_Randevular] ([Randevu_id], [Hasta_id], [Doktor_id], [R_Zamanı], [Sikayet], [Ucret]) VALUES (22, 12, 4, CAST(N'2022-10-28T08:00:00.000' AS DateTime), N'Testis Taraması', 500)
SET IDENTITY_INSERT [dbo].[tbl_Randevular] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Receteler] ON 

INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (1, 6, N'Dolarjin -ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (2, 8, N'Azarga -ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (3, 9, N'Certican-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (4, 13, N'Ciloxan-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (5, 17, N'Desferal-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (6, 16, N'Dıovan-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (7, 18, N'Exelon-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (8, 19, N'Femara-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (9, 21, N'Galvus-ilaç')
INSERT [dbo].[tbl_Receteler] ([Recete_id], [Randevu_id], [Acıklama]) VALUES (10, 22, N'ILarıs-ilaç')
SET IDENTITY_INSERT [dbo].[tbl_Receteler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Tedarikciler] ON 

INSERT [dbo].[tbl_Tedarikciler] ([Tedarikci_id], [T_Ad], [T_Adres], [T_Telefon], [Alacak]) VALUES (1, N'Fulla', N'ankara', N'1245', 8000)
INSERT [dbo].[tbl_Tedarikciler] ([Tedarikci_id], [T_Ad], [T_Adres], [T_Telefon], [Alacak]) VALUES (2, N'Seyhan ltd', N'adana', N'7895', 1000)
INSERT [dbo].[tbl_Tedarikciler] ([Tedarikci_id], [T_Ad], [T_Adres], [T_Telefon], [Alacak]) VALUES (3, N'Koç holding', N'İstanbul', N'7854', 1540)
SET IDENTITY_INSERT [dbo].[tbl_Tedarikciler] OFF
GO
ALTER TABLE [dbo].[tbl_Kasa]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Kasa_tbl_Personel] FOREIGN KEY([P_id_Muhasebe])
REFERENCES [dbo].[tbl_Personel] ([Personel_id])
GO
ALTER TABLE [dbo].[tbl_Kasa] CHECK CONSTRAINT [FK_tbl_Kasa_tbl_Personel]
GO
ALTER TABLE [dbo].[tbl_Maas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Maas_tbl_Personel] FOREIGN KEY([Personel_id])
REFERENCES [dbo].[tbl_Personel] ([Personel_id])
GO
ALTER TABLE [dbo].[tbl_Maas] CHECK CONSTRAINT [FK_tbl_Maas_tbl_Personel]
GO
ALTER TABLE [dbo].[tbl_Malzemeler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Malzemeler_tbl_Personel] FOREIGN KEY([Pers_id])
REFERENCES [dbo].[tbl_Personel] ([Personel_id])
GO
ALTER TABLE [dbo].[tbl_Malzemeler] CHECK CONSTRAINT [FK_tbl_Malzemeler_tbl_Personel]
GO
ALTER TABLE [dbo].[tbl_Malzemeler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Malzemeler_tbl_Tedarikciler] FOREIGN KEY([Tedarik_id])
REFERENCES [dbo].[tbl_Tedarikciler] ([Tedarikci_id])
GO
ALTER TABLE [dbo].[tbl_Malzemeler] CHECK CONSTRAINT [FK_tbl_Malzemeler_tbl_Tedarikciler]
GO
ALTER TABLE [dbo].[tbl_Randevular]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Randevular_tbl_Hasta] FOREIGN KEY([Hasta_id])
REFERENCES [dbo].[tbl_Hasta] ([Hasta_id])
GO
ALTER TABLE [dbo].[tbl_Randevular] CHECK CONSTRAINT [FK_tbl_Randevular_tbl_Hasta]
GO
ALTER TABLE [dbo].[tbl_Randevular]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Randevular_tbl_Personel] FOREIGN KEY([Doktor_id])
REFERENCES [dbo].[tbl_Personel] ([Personel_id])
GO
ALTER TABLE [dbo].[tbl_Randevular] CHECK CONSTRAINT [FK_tbl_Randevular_tbl_Personel]
GO
ALTER TABLE [dbo].[tbl_Receteler]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Receteler_tbl_Randevular] FOREIGN KEY([Randevu_id])
REFERENCES [dbo].[tbl_Randevular] ([Randevu_id])
GO
ALTER TABLE [dbo].[tbl_Receteler] CHECK CONSTRAINT [FK_tbl_Receteler_tbl_Randevular]
GO
