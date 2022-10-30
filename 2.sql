USE [MCI_Hospital]
GO
/****** Object:  Table [dbo].[tbl_Hasta]    Script Date: 30.10.2022 15:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Hasta](
	[Hasta_id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Soyad] [nvarchar](50) NOT NULL,
	[Cinsiyet] [nvarchar](50) NOT NULL,
	[Tc] [nvarchar](11) NOT NULL,
	[Doğum_Tarihi] [nvarchar](10) NOT NULL,
	[Telefon] [nvarchar](18) NOT NULL,
	[Ssk_Durum] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Hasta] PRIMARY KEY CLUSTERED 
(
	[Hasta_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Kasa]    Script Date: 30.10.2022 15:37:05 ******/
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
/****** Object:  Table [dbo].[tbl_Maas]    Script Date: 30.10.2022 15:37:05 ******/
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
/****** Object:  Table [dbo].[tbl_Malzemeler]    Script Date: 30.10.2022 15:37:05 ******/
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
/****** Object:  Table [dbo].[tbl_Personel]    Script Date: 30.10.2022 15:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Personel](
	[Personel_id] [int] IDENTITY(1,1) NOT NULL,
	[P_Ad] [nvarchar](50) NOT NULL,
	[P_Soyad] [nvarchar](50) NOT NULL,
	[P_Dogum_Tarihi] [nvarchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[tbl_Randevular]    Script Date: 30.10.2022 15:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Randevular](
	[Randevu_id] [int] IDENTITY(1,1) NOT NULL,
	[Hasta_id] [int] NOT NULL,
	[Doktor_id] [int] NOT NULL,
	[R_Saat] [nvarchar](5) NOT NULL,
	[R_Gun] [nvarchar](10) NOT NULL,
	[Sikayet] [nvarchar](50) NOT NULL,
	[Ucret] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Randevular] PRIMARY KEY CLUSTERED 
(
	[Randevu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Receteler]    Script Date: 30.10.2022 15:37:05 ******/
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
/****** Object:  Table [dbo].[tbl_Tedarikciler]    Script Date: 30.10.2022 15:37:05 ******/
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
