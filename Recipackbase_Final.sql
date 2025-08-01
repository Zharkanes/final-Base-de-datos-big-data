USE [master]
GO
/****** Object:  Database [Recipackbase]    Script Date: 12/07/2025 21:21:30 ******/
CREATE DATABASE [Recipackbase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Recipackbase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Recipackbase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Recipackbase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Recipackbase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Recipackbase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Recipackbase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Recipackbase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Recipackbase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Recipackbase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Recipackbase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Recipackbase] SET ARITHABORT OFF 
GO
ALTER DATABASE [Recipackbase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Recipackbase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Recipackbase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Recipackbase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Recipackbase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Recipackbase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Recipackbase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Recipackbase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Recipackbase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Recipackbase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Recipackbase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Recipackbase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Recipackbase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Recipackbase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Recipackbase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Recipackbase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Recipackbase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Recipackbase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Recipackbase] SET  MULTI_USER 
GO
ALTER DATABASE [Recipackbase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Recipackbase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Recipackbase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Recipackbase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Recipackbase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Recipackbase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Recipackbase] SET QUERY_STORE = ON
GO
ALTER DATABASE [Recipackbase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Recipackbase]
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleCompraType]    Script Date: 12/07/2025 21:21:30 ******/
CREATE TYPE [dbo].[DetalleCompraType] AS TABLE(
	[ID_Tipo] [int] NOT NULL,
	[Peso] [decimal](10, 2) NOT NULL,
	[Precio_Kg] [decimal](8, 2) NOT NULL,
	[ID_Almacen] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[DetalleCompraType2]    Script Date: 12/07/2025 21:21:30 ******/
CREATE TYPE [dbo].[DetalleCompraType2] AS TABLE(
	[ID_Tipo] [int] NULL,
	[Peso] [decimal](10, 2) NULL,
	[Precio_Kg] [decimal](8, 2) NULL,
	[ID_Almacen] [int] NULL
)
GO
/****** Object:  Table [dbo].[Tipos_Material]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipos_Material](
	[ID_Tipo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Categoria] [varchar](20) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[Precio_Compra_Kg] [decimal](8, 2) NOT NULL,
	[Precio_Venta_Kg] [decimal](8, 2) NOT NULL,
	[Unidad] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[Monto_Total] [decimal](12, 2) NOT NULL,
	[Peso_Total] [decimal](10, 2) NOT NULL,
	[Estado] [varchar](20) NULL,
	[Facturado] [bit] NULL,
	[Numero_Factura] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Ventas]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Ventas](
	[ID_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[ID_Venta] [int] NOT NULL,
	[ID_Tipo] [int] NOT NULL,
	[Peso] [decimal](10, 2) NOT NULL,
	[Precio_Kg] [decimal](8, 2) NOT NULL,
	[Subtotal]  AS ([Peso]*[Precio_Kg]) PERSISTED,
	[ID_Almacen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Ventas_Expandida]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VW_Ventas_Expandida] AS
SELECT 
    v.ID_Venta,
    v.Fecha,
    dv.ID_Tipo,
    tm.Nombre AS Tipo_Material,
    dv.Peso,
    dv.Precio_Kg,
    dv.Peso * dv.Precio_Kg AS Subtotal
FROM Ventas v
JOIN Detalle_Ventas dv ON v.ID_Venta = dv.ID_Venta
JOIN Tipos_Material tm ON dv.ID_Tipo = tm.ID_Tipo;
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[ID_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[ID_Cliente] [int] NOT NULL,
	[ID_Empleado] [int] NOT NULL,
	[Monto_Total] [decimal](12, 2) NOT NULL,
	[Peso_Total] [decimal](10, 2) NOT NULL,
	[Estado] [varchar](20) NULL,
	[Observaciones] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Compras]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Compras](
	[ID_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[ID_Compra] [int] NOT NULL,
	[ID_Tipo] [int] NOT NULL,
	[Peso] [decimal](10, 2) NOT NULL,
	[Precio_Kg] [decimal](8, 2) NOT NULL,
	[Subtotal]  AS ([Peso]*[Precio_Kg]) PERSISTED,
	[ID_Almacen] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Compras_Expandida]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VW_Compras_Expandida] AS
SELECT 
    c.ID_Compra,
    c.Fecha,
    dc.ID_Tipo,
    tm.Nombre AS Tipo_Material,
    dc.Peso,
    dc.Precio_Kg,
    dc.Peso * dc.Precio_Kg AS Subtotal
FROM Compras c
JOIN Detalle_Compras dc ON c.ID_Compra = dc.ID_Compra
JOIN Tipos_Material tm ON dc.ID_Tipo = tm.ID_Tipo;
GO
/****** Object:  Table [dbo].[Ventas_Agregadas]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas_Agregadas](
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[ID_Tipo] [int] NULL,
	[Tipo_Material] [varchar](50) NULL,
	[Total_Kg] [decimal](10, 2) NULL,
	[Total_Venta] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras_Agregadas]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras_Agregadas](
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[ID_Tipo] [int] NULL,
	[Tipo_Material] [varchar](50) NULL,
	[Total_Kg] [decimal](10, 2) NULL,
	[Total_Compra] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Comparativo_Compras_Ventas]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VW_Comparativo_Compras_Ventas] AS
SELECT 
    COALESCE(v.Anio, c.Anio) AS Anio,
    COALESCE(v.Mes, c.Mes) AS Mes,
    COALESCE(v.Tipo_Material, c.Tipo_Material) AS Tipo_Material,
    
    ISNULL(c.Total_Kg, 0) AS Total_Compra_Kg,
    ISNULL(c.Total_Compra, 0) AS Total_Compra_Soles,
    
    ISNULL(v.Total_Kg, 0) AS Total_Venta_Kg,
    ISNULL(v.Total_Venta, 0) AS Total_Venta_Soles,
    
    ISNULL(v.Total_Venta, 0) - ISNULL(c.Total_Compra, 0) AS Utilidad_Soles

FROM Compras_Agregadas c
FULL JOIN Ventas_Agregadas v
  ON c.Anio = v.Anio AND c.Mes = v.Mes AND c.Tipo_Material = v.Tipo_Material;
GO
/****** Object:  View [dbo].[VW_KPI_ETL_RESUMEN]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[VW_KPI_ETL_RESUMEN] AS
SELECT 
    CONCAT(Mes, '/', Anio) AS Periodo,
    Tipo_Material,
    Total_Compra_Kg,
    Total_Compra_Soles,
    Total_Venta_Kg,
    Total_Venta_Soles,
    Utilidad_Soles
FROM VW_Comparativo_Compras_Ventas;
GO
/****** Object:  Table [dbo].[Almacenes]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacenes](
	[ID_Almacen] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Ubicacion] [varchar](200) NOT NULL,
	[Capacidad_Kg] [decimal](12, 2) NULL,
	[Responsable] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
	[Direccion] [varchar](200) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[RUC] [varchar](15) NULL,
	[Fecha_Registro] [datetime] NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Fecha]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Fecha](
	[ID_Fecha] [int] NOT NULL,
	[Fecha] [date] NULL,
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[Nombre_Mes] [varchar](20) NULL,
	[Trimestre] [int] NULL,
	[Semana] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Puesto] [varchar](20) NOT NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Fecha_Contratacion] [date] NULL,
	[Salario] [decimal](10, 2) NULL,
	[Activo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID_Registro] [int] IDENTITY(1,1) NOT NULL,
	[ID_Tipo] [int] NOT NULL,
	[ID_Almacen] [int] NOT NULL,
	[Cantidad] [decimal](10, 2) NOT NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Calidad] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 12/07/2025 21:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimientos](
	[ID_Movimiento] [int] IDENTITY(1,1) NOT NULL,
	[ID_Tipo] [int] NOT NULL,
	[Cantidad] [decimal](10, 2) NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
	[ID_Origen] [int] NULL,
	[ID_Destino] [int] NULL,
	[Fecha] [datetime] NULL,
	[ID_Usuario] [int] NOT NULL,
	[ID_Transaccion] [int] NULL,
	[Tipo_Transaccion] [varchar](20) NULL,
	[Observaciones] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Almacenes] ON 

INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (1, N'Almacén Principal', N'Zona Industrial Norte', CAST(50000.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (2, N'Almacén Metales', N'Zona Industrial Sur', CAST(30000.00 AS Decimal(12, 2)), 2)
INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (3, N'Almacén Plásticos', N'Zona Industrial Este', CAST(20000.00 AS Decimal(12, 2)), 6)
INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (4, N'Almacén Temporal', N'Planta de Clasificación', CAST(10000.00 AS Decimal(12, 2)), 5)
INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (5, N'Almacén Papel y Vidrio', N'Zona Industrial Oeste', CAST(15000.00 AS Decimal(12, 2)), 7)
INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (6, N'Almacén Electrónicos', N'Planta de Procesamiento', CAST(8000.00 AS Decimal(12, 2)), 13)
INSERT [dbo].[Almacenes] ([ID_Almacen], [Nombre], [Ubicacion], [Capacidad_Kg], [Responsable]) VALUES (8, N'Almacén Central', N'Lima Norte', NULL, 1)
SET IDENTITY_INSERT [dbo].[Almacenes] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (1, N'Taller Méndez', N'Comercio', N'Av. Industrial 123', N'5551122334', N'taller.mendez@mail.com', N'TME123456789', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (2, N'Recolectores Unidos', N'Empresa', N'Calle Reciclaje 456', N'5552233445', N'info@recolectores.com', N'RUN987654321', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (3, N'Juan Pérez', N'Particular', N'Col. Centro 789', N'5553344556', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (4, N'Constructora Díaz', N'Empresa', N'Blvd. Construcción 321', N'5554455667', N'compras@diaz.com', N'CDI456789123', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (5, N'María González', N'Particular', N'Fracc. Las Flores 654', N'5555566778', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (6, N'Chatarrería El Torito', N'Comercio', N'Carr. Vieja 987', N'5556677889', N'ventas@eltorito.com', N'CTO789123456', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (7, N'Plásticos Reciclados S.A.', N'Empresa', N'Polígono Industrial 1', N'5557788990', N'contacto@plasticosrec.com', N'PRS321654987', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (8, N'Metalurgica Industrial', N'Empresa', N'Zona Franca 222', N'5558899001', N'ventas@metalurgica.com', N'MIN222333444', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (9, N'José Rodríguez', N'Particular', N'Col. Libertad 333', N'5559900112', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (10, N'Recicladora Moderna', N'Empresa', N'Parque Industrial 444', N'5550011223', N'info@reciclamod.com', N'RMO444555666', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (11, N'Taller El Soldador', N'Comercio', N'Av. Técnicos 555', N'5551122335', N'soldador@mail.com', N'TSO555666777', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (12, N'Distribuidora de Metales', N'Empresa', N'Calle Distribución 666', N'5552233446', N'ventas@distmetales.com', N'DME666777888', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (13, N'Carlos Martínez', N'Particular', N'Fracc. Jardines 777', N'5553344557', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (14, N'Recuperaciones Ecológicas', N'Empresa', N'Blvd. Ecológico 888', N'5554455668', N'eco@recuperaciones.com', N'REC888999000', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (15, N'Ana López', N'Particular', N'Col. Primavera 999', N'5555566779', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (16, N'Chatarrería La Esperanza', N'Comercio', N'Carr. Antigua 111', N'5556677890', N'esperanza@chatarreria.com', N'CHE111222333', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (17, N'Vidrios Reciclados S.A.', N'Empresa', N'Polígono Industrial 2', N'5557789001', N'vidrios@reciclados.com', N'VRS333444555', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (18, N'Taller Automotriz Rápido', N'Comercio', N'Av. Automotriz 222', N'5558890112', N'tallerrapido@mail.com', N'TAR222333444', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (19, N'Reciclaje Total', N'Empresa', N'Zona Industrial Norte 333', N'5559901223', N'total@reciclaje.com', N'RTT333444555', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (20, N'Martha Sánchez', N'Particular', N'Col. Bosque 444', N'5550012334', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (21, N'Comercializadora de Desechos', N'Empresa', N'Parque Comercial 555', N'5551123445', N'desechos@comercial.com', N'CDE555666777', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (22, N'Taller El Herrero', N'Comercio', N'Av. Metalúrgica 666', N'5552234556', N'herrero@mail.com', N'THE666777888', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (23, N'Roberto García', N'Particular', N'Fracc. Arboledas 777', N'5553345667', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (24, N'Recicladora del Norte', N'Empresa', N'Blvd. del Norte 888', N'5554456778', N'norte@recicladora.com', N'RCN888999000', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (25, N'Chatarrería El Sur', N'Comercio', N'Carr. Sur 999', N'5555567889', N'sul@chatarreria.com', N'CHS999000111', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (26, N'Plásticos del Pacífico', N'Empresa', N'Polígono Industrial 3', N'5556678990', N'pacifico@plasticos.com', N'PLP111222333', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (27, N'Taller Mecánico Bravo', N'Comercio', N'Av. Mecánica 222', N'5557789002', N'bravo@mecanico.com', N'TMB222333444', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (28, N'Alejandro Ruiz', N'Particular', N'Col. Las Palmas 333', N'5558890113', NULL, NULL, CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (29, N'Recuperadora de Metales', N'Empresa', N'Zona Franca Este 444', N'5559901224', N'metales@recuperadora.com', N'RME444555666', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (30, N'Desechos Industriales S.A.', N'Empresa', N'Parque Industrial 4', N'5550012335', N'industriales@desechos.com', N'DIS555666777', CAST(N'2025-07-10T20:21:21.293' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (31, N'Chatarra Perú SAC', N'Empresa', N'Av. Reciclaje 123', N'987654321', N'contacto@chape.com', N'20455678901', CAST(N'2025-07-11T01:17:19.640' AS DateTime), 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Tipo], [Direccion], [Telefono], [Email], [RUC], [Fecha_Registro], [Activo]) VALUES (32, N'Reciclajes Lima', N'Empresa', N'Jr. Chatarra 456', N'944777888', N'ventas@reciclima.com', N'20112233445', CAST(N'2025-07-11T01:17:19.640' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (1, CAST(N'2023-01-10T09:15:00.000' AS DateTime), 3, 3, CAST(4275.00 AS Decimal(12, 2)), CAST(50.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (2, CAST(N'2023-01-12T11:30:00.000' AS DateTime), 1, 4, CAST(10260.00 AS Decimal(12, 2)), CAST(450.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (3, CAST(N'2023-01-15T14:45:00.000' AS DateTime), 5, 3, CAST(1560.50 AS Decimal(12, 2)), CAST(34.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (4, CAST(N'2023-01-18T16:20:00.000' AS DateTime), 2, 2, CAST(41840.00 AS Decimal(12, 2)), CAST(5230.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (5, CAST(N'2023-01-20T10:00:00.000' AS DateTime), 7, 3, CAST(21050.75 AS Decimal(12, 2)), CAST(8420.30 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (6, CAST(N'2023-02-05T08:30:00.000' AS DateTime), 9, 5, CAST(8750.00 AS Decimal(12, 2)), CAST(250.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (7, CAST(N'2023-02-10T13:15:00.000' AS DateTime), 12, 2, CAST(12600.00 AS Decimal(12, 2)), CAST(700.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (8, CAST(N'2023-02-15T10:45:00.000' AS DateTime), 4, 3, CAST(3420.00 AS Decimal(12, 2)), CAST(120.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (9, CAST(N'2023-02-20T15:30:00.000' AS DateTime), 8, 6, CAST(18900.00 AS Decimal(12, 2)), CAST(900.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (10, CAST(N'2023-02-25T11:00:00.000' AS DateTime), 15, 2, CAST(6300.00 AS Decimal(12, 2)), CAST(350.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (11, CAST(N'2023-03-03T09:20:00.000' AS DateTime), 11, 3, CAST(11250.00 AS Decimal(12, 2)), CAST(450.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (12, CAST(N'2023-03-08T14:10:00.000' AS DateTime), 6, 4, CAST(24750.00 AS Decimal(12, 2)), CAST(1650.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (13, CAST(N'2023-03-13T16:45:00.000' AS DateTime), 10, 2, CAST(8100.00 AS Decimal(12, 2)), CAST(300.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (14, CAST(N'2023-03-18T10:30:00.000' AS DateTime), 13, 3, CAST(5400.00 AS Decimal(12, 2)), CAST(200.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (15, CAST(N'2023-03-23T12:15:00.000' AS DateTime), 14, 5, CAST(13500.00 AS Decimal(12, 2)), CAST(500.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (16, CAST(N'2023-03-28T09:45:00.000' AS DateTime), 16, 2, CAST(7200.00 AS Decimal(12, 2)), CAST(400.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (17, CAST(N'2023-04-02T11:20:00.000' AS DateTime), 17, 3, CAST(9450.00 AS Decimal(12, 2)), CAST(350.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (18, CAST(N'2023-04-07T15:10:00.000' AS DateTime), 18, 6, CAST(10800.00 AS Decimal(12, 2)), CAST(600.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (19, CAST(N'2023-04-12T10:40:00.000' AS DateTime), 19, 2, CAST(16200.00 AS Decimal(12, 2)), CAST(900.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (20, CAST(N'2023-04-17T13:25:00.000' AS DateTime), 20, 3, CAST(4950.00 AS Decimal(12, 2)), CAST(150.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (21, CAST(N'2025-07-11T01:29:59.070' AS DateTime), 1, 1, CAST(300.00 AS Decimal(12, 2)), CAST(150.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (22, CAST(N'2025-07-11T17:35:00.007' AS DateTime), 2, 2, CAST(280.00 AS Decimal(12, 2)), CAST(140.00 AS Decimal(10, 2)), N'Completada', NULL)
INSERT [dbo].[Compras] ([ID_Compra], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Observaciones]) VALUES (23, CAST(N'2025-07-11T23:14:20.580' AS DateTime), 3, 5, CAST(5757.75 AS Decimal(12, 2)), CAST(170.50 AS Decimal(10, 2)), N'Completada', NULL)
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 1, 1, N'Cobre limpio', CAST(240.00 AS Decimal(10, 2)), CAST(4503.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 1, 2, N'Aluminio', CAST(450.00 AS Decimal(10, 2)), CAST(5400.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 1, 3, N'Bronce', CAST(134.00 AS Decimal(10, 2)), CAST(1610.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 1, 4, N'Acero inoxidable', CAST(5230.00 AS Decimal(10, 2)), CAST(41840.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 1, 6, N'PET', CAST(8420.30 AS Decimal(10, 2)), CAST(21050.75 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 2, 5, N'Plomo', CAST(250.00 AS Decimal(10, 2)), CAST(1375.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 2, 7, N'Vidrio transparente', CAST(700.00 AS Decimal(10, 2)), CAST(560.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 2, 8, N'Cartón', CAST(120.00 AS Decimal(10, 2)), CAST(144.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 2, 9, N'Electrónicos', CAST(900.00 AS Decimal(10, 2)), CAST(13500.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 2, 10, N'Baterías de auto', CAST(350.00 AS Decimal(10, 2)), CAST(1225.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 3, 11, N'Cobre mixto', CAST(450.00 AS Decimal(10, 2)), CAST(29250.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 3, 12, N'Aluminio perfil', CAST(1650.00 AS Decimal(10, 2)), CAST(29700.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 3, 13, N'Zinc', CAST(300.00 AS Decimal(10, 2)), CAST(1350.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 3, 14, N'HDPE', CAST(200.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 3, 15, N'Vidrio verde', CAST(500.00 AS Decimal(10, 2)), CAST(350.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 3, 16, N'Papel blanco', CAST(400.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 4, 17, N'Circuitos electrónicos', CAST(350.00 AS Decimal(10, 2)), CAST(7000.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 4, 18, N'Baterías industriales', CAST(600.00 AS Decimal(10, 2)), CAST(3000.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 4, 19, N'Latón', CAST(900.00 AS Decimal(10, 2)), CAST(34200.00 AS Decimal(12, 2)))
INSERT [dbo].[Compras_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Compra]) VALUES (2023, 4, 20, N'Acero al carbono', CAST(150.00 AS Decimal(10, 2)), CAST(900.00 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[Detalle_Compras] ON 

INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (180, 1, 1, CAST(50.00 AS Decimal(10, 2)), CAST(85.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (181, 2, 2, CAST(450.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (182, 3, 3, CAST(34.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (183, 4, 4, CAST(5230.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (184, 5, 6, CAST(8420.30 AS Decimal(10, 2)), CAST(2.50 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (185, 6, 5, CAST(250.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (186, 7, 7, CAST(700.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (187, 8, 8, CAST(120.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (188, 9, 9, CAST(900.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (189, 10, 10, CAST(350.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (190, 11, 11, CAST(450.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (191, 12, 12, CAST(1650.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (192, 13, 13, CAST(300.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (193, 14, 14, CAST(200.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (194, 15, 15, CAST(500.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (195, 16, 16, CAST(400.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (196, 17, 17, CAST(350.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (197, 18, 18, CAST(600.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (198, 19, 19, CAST(900.00 AS Decimal(10, 2)), CAST(38.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (199, 20, 20, CAST(150.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (200, 1, 1, CAST(50.00 AS Decimal(10, 2)), CAST(85.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (201, 2, 2, CAST(450.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (202, 3, 3, CAST(34.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (203, 4, 4, CAST(5230.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (204, 5, 6, CAST(8420.30 AS Decimal(10, 2)), CAST(2.50 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (205, 6, 5, CAST(250.00 AS Decimal(10, 2)), CAST(5.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (206, 7, 7, CAST(700.00 AS Decimal(10, 2)), CAST(0.80 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (207, 8, 8, CAST(120.00 AS Decimal(10, 2)), CAST(1.20 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (208, 9, 9, CAST(900.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (209, 10, 10, CAST(350.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (210, 11, 11, CAST(450.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (211, 12, 12, CAST(1650.00 AS Decimal(10, 2)), CAST(18.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (212, 13, 13, CAST(300.00 AS Decimal(10, 2)), CAST(4.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (213, 14, 14, CAST(200.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (214, 15, 15, CAST(500.00 AS Decimal(10, 2)), CAST(0.70 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (215, 16, 16, CAST(400.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (216, 17, 17, CAST(350.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (217, 18, 18, CAST(600.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (218, 19, 19, CAST(900.00 AS Decimal(10, 2)), CAST(38.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (219, 20, 20, CAST(150.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (220, 23, 1, CAST(50.50 AS Decimal(10, 2)), CAST(85.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Compras] ([ID_Detalle], [ID_Compra], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (221, 23, 2, CAST(120.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(8, 2)), 2)
SET IDENTITY_INSERT [dbo].[Detalle_Compras] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Ventas] ON 

INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (218, 1, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (219, 2, 3, CAST(450.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (220, 3, 2, CAST(506.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (221, 4, 1, CAST(1200.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (222, 4, 3, CAST(300.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (223, 5, 4, CAST(250.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (224, 6, 5, CAST(350.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (225, 7, 6, CAST(500.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (226, 8, 7, CAST(300.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (227, 9, 8, CAST(700.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (228, 10, 9, CAST(400.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (229, 11, 10, CAST(750.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (230, 12, 11, CAST(250.00 AS Decimal(10, 2)), CAST(95.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (231, 13, 12, CAST(450.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (232, 14, 13, CAST(600.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (233, 15, 14, CAST(350.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (234, 16, 15, CAST(200.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (235, 17, 16, CAST(700.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (236, 18, 17, CAST(300.00 AS Decimal(10, 2)), CAST(35.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (237, 19, 18, CAST(500.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (238, 20, 19, CAST(400.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (239, 1, 1, CAST(1000.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (240, 2, 3, CAST(450.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (241, 3, 2, CAST(506.00 AS Decimal(10, 2)), CAST(18.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (242, 4, 1, CAST(1200.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (243, 4, 3, CAST(300.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (244, 5, 4, CAST(250.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (245, 6, 5, CAST(350.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (246, 7, 6, CAST(500.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (247, 8, 7, CAST(300.00 AS Decimal(10, 2)), CAST(1.50 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (248, 9, 8, CAST(700.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (249, 10, 9, CAST(400.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (250, 11, 10, CAST(750.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (251, 12, 11, CAST(250.00 AS Decimal(10, 2)), CAST(95.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (252, 13, 12, CAST(450.00 AS Decimal(10, 2)), CAST(25.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (253, 14, 13, CAST(600.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(8, 2)), 2)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (254, 15, 14, CAST(350.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(8, 2)), 3)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (255, 16, 15, CAST(200.00 AS Decimal(10, 2)), CAST(1.30 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (256, 17, 16, CAST(700.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(8, 2)), 5)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (257, 18, 17, CAST(300.00 AS Decimal(10, 2)), CAST(35.00 AS Decimal(8, 2)), 6)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (258, 19, 18, CAST(500.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(8, 2)), 4)
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Tipo], [Peso], [Precio_Kg], [ID_Almacen]) VALUES (259, 20, 19, CAST(400.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(8, 2)), 2)
SET IDENTITY_INSERT [dbo].[Detalle_Ventas] OFF
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230101, CAST(N'2023-01-01' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230102, CAST(N'2023-01-02' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230103, CAST(N'2023-01-03' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230104, CAST(N'2023-01-04' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230105, CAST(N'2023-01-05' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230106, CAST(N'2023-01-06' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230107, CAST(N'2023-01-07' AS Date), 2023, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230108, CAST(N'2023-01-08' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230109, CAST(N'2023-01-09' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230110, CAST(N'2023-01-10' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230111, CAST(N'2023-01-11' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230112, CAST(N'2023-01-12' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230113, CAST(N'2023-01-13' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230114, CAST(N'2023-01-14' AS Date), 2023, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230115, CAST(N'2023-01-15' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230116, CAST(N'2023-01-16' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230117, CAST(N'2023-01-17' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230118, CAST(N'2023-01-18' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230119, CAST(N'2023-01-19' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230120, CAST(N'2023-01-20' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230121, CAST(N'2023-01-21' AS Date), 2023, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230122, CAST(N'2023-01-22' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230123, CAST(N'2023-01-23' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230124, CAST(N'2023-01-24' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230125, CAST(N'2023-01-25' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230126, CAST(N'2023-01-26' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230127, CAST(N'2023-01-27' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230128, CAST(N'2023-01-28' AS Date), 2023, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230129, CAST(N'2023-01-29' AS Date), 2023, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230130, CAST(N'2023-01-30' AS Date), 2023, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230131, CAST(N'2023-01-31' AS Date), 2023, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230201, CAST(N'2023-02-01' AS Date), 2023, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230202, CAST(N'2023-02-02' AS Date), 2023, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230203, CAST(N'2023-02-03' AS Date), 2023, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230204, CAST(N'2023-02-04' AS Date), 2023, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230205, CAST(N'2023-02-05' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230206, CAST(N'2023-02-06' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230207, CAST(N'2023-02-07' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230208, CAST(N'2023-02-08' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230209, CAST(N'2023-02-09' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230210, CAST(N'2023-02-10' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230211, CAST(N'2023-02-11' AS Date), 2023, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230212, CAST(N'2023-02-12' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230213, CAST(N'2023-02-13' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230214, CAST(N'2023-02-14' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230215, CAST(N'2023-02-15' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230216, CAST(N'2023-02-16' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230217, CAST(N'2023-02-17' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230218, CAST(N'2023-02-18' AS Date), 2023, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230219, CAST(N'2023-02-19' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230220, CAST(N'2023-02-20' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230221, CAST(N'2023-02-21' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230222, CAST(N'2023-02-22' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230223, CAST(N'2023-02-23' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230224, CAST(N'2023-02-24' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230225, CAST(N'2023-02-25' AS Date), 2023, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230226, CAST(N'2023-02-26' AS Date), 2023, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230227, CAST(N'2023-02-27' AS Date), 2023, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230228, CAST(N'2023-02-28' AS Date), 2023, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230301, CAST(N'2023-03-01' AS Date), 2023, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230302, CAST(N'2023-03-02' AS Date), 2023, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230303, CAST(N'2023-03-03' AS Date), 2023, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230304, CAST(N'2023-03-04' AS Date), 2023, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230305, CAST(N'2023-03-05' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230306, CAST(N'2023-03-06' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230307, CAST(N'2023-03-07' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230308, CAST(N'2023-03-08' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230309, CAST(N'2023-03-09' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230310, CAST(N'2023-03-10' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230311, CAST(N'2023-03-11' AS Date), 2023, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230312, CAST(N'2023-03-12' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230313, CAST(N'2023-03-13' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230314, CAST(N'2023-03-14' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230315, CAST(N'2023-03-15' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230316, CAST(N'2023-03-16' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230317, CAST(N'2023-03-17' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230318, CAST(N'2023-03-18' AS Date), 2023, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230319, CAST(N'2023-03-19' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230320, CAST(N'2023-03-20' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230321, CAST(N'2023-03-21' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230322, CAST(N'2023-03-22' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230323, CAST(N'2023-03-23' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230324, CAST(N'2023-03-24' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230325, CAST(N'2023-03-25' AS Date), 2023, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230326, CAST(N'2023-03-26' AS Date), 2023, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230327, CAST(N'2023-03-27' AS Date), 2023, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230328, CAST(N'2023-03-28' AS Date), 2023, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230329, CAST(N'2023-03-29' AS Date), 2023, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230330, CAST(N'2023-03-30' AS Date), 2023, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230331, CAST(N'2023-03-31' AS Date), 2023, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230401, CAST(N'2023-04-01' AS Date), 2023, 4, N'April', 2, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230402, CAST(N'2023-04-02' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230403, CAST(N'2023-04-03' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230404, CAST(N'2023-04-04' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230405, CAST(N'2023-04-05' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230406, CAST(N'2023-04-06' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230407, CAST(N'2023-04-07' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230408, CAST(N'2023-04-08' AS Date), 2023, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230409, CAST(N'2023-04-09' AS Date), 2023, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230410, CAST(N'2023-04-10' AS Date), 2023, 4, N'April', 2, 15)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230411, CAST(N'2023-04-11' AS Date), 2023, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230412, CAST(N'2023-04-12' AS Date), 2023, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230413, CAST(N'2023-04-13' AS Date), 2023, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230414, CAST(N'2023-04-14' AS Date), 2023, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230415, CAST(N'2023-04-15' AS Date), 2023, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230416, CAST(N'2023-04-16' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230417, CAST(N'2023-04-17' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230418, CAST(N'2023-04-18' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230419, CAST(N'2023-04-19' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230420, CAST(N'2023-04-20' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230421, CAST(N'2023-04-21' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230422, CAST(N'2023-04-22' AS Date), 2023, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230423, CAST(N'2023-04-23' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230424, CAST(N'2023-04-24' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230425, CAST(N'2023-04-25' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230426, CAST(N'2023-04-26' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230427, CAST(N'2023-04-27' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230428, CAST(N'2023-04-28' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230429, CAST(N'2023-04-29' AS Date), 2023, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230430, CAST(N'2023-04-30' AS Date), 2023, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230501, CAST(N'2023-05-01' AS Date), 2023, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230502, CAST(N'2023-05-02' AS Date), 2023, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230503, CAST(N'2023-05-03' AS Date), 2023, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230504, CAST(N'2023-05-04' AS Date), 2023, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230505, CAST(N'2023-05-05' AS Date), 2023, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230506, CAST(N'2023-05-06' AS Date), 2023, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230507, CAST(N'2023-05-07' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230508, CAST(N'2023-05-08' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230509, CAST(N'2023-05-09' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230510, CAST(N'2023-05-10' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230511, CAST(N'2023-05-11' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230512, CAST(N'2023-05-12' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230513, CAST(N'2023-05-13' AS Date), 2023, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230514, CAST(N'2023-05-14' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230515, CAST(N'2023-05-15' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230516, CAST(N'2023-05-16' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230517, CAST(N'2023-05-17' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230518, CAST(N'2023-05-18' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230519, CAST(N'2023-05-19' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230520, CAST(N'2023-05-20' AS Date), 2023, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230521, CAST(N'2023-05-21' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230522, CAST(N'2023-05-22' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230523, CAST(N'2023-05-23' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230524, CAST(N'2023-05-24' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230525, CAST(N'2023-05-25' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230526, CAST(N'2023-05-26' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230527, CAST(N'2023-05-27' AS Date), 2023, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230528, CAST(N'2023-05-28' AS Date), 2023, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230529, CAST(N'2023-05-29' AS Date), 2023, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230530, CAST(N'2023-05-30' AS Date), 2023, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230531, CAST(N'2023-05-31' AS Date), 2023, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230601, CAST(N'2023-06-01' AS Date), 2023, 6, N'June', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230602, CAST(N'2023-06-02' AS Date), 2023, 6, N'June', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230603, CAST(N'2023-06-03' AS Date), 2023, 6, N'June', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230604, CAST(N'2023-06-04' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230605, CAST(N'2023-06-05' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230606, CAST(N'2023-06-06' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230607, CAST(N'2023-06-07' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230608, CAST(N'2023-06-08' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230609, CAST(N'2023-06-09' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230610, CAST(N'2023-06-10' AS Date), 2023, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230611, CAST(N'2023-06-11' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230612, CAST(N'2023-06-12' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230613, CAST(N'2023-06-13' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230614, CAST(N'2023-06-14' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230615, CAST(N'2023-06-15' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230616, CAST(N'2023-06-16' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230617, CAST(N'2023-06-17' AS Date), 2023, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230618, CAST(N'2023-06-18' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230619, CAST(N'2023-06-19' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230620, CAST(N'2023-06-20' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230621, CAST(N'2023-06-21' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230622, CAST(N'2023-06-22' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230623, CAST(N'2023-06-23' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230624, CAST(N'2023-06-24' AS Date), 2023, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230625, CAST(N'2023-06-25' AS Date), 2023, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230626, CAST(N'2023-06-26' AS Date), 2023, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230627, CAST(N'2023-06-27' AS Date), 2023, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230628, CAST(N'2023-06-28' AS Date), 2023, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230629, CAST(N'2023-06-29' AS Date), 2023, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230630, CAST(N'2023-06-30' AS Date), 2023, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230701, CAST(N'2023-07-01' AS Date), 2023, 7, N'July', 3, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230702, CAST(N'2023-07-02' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230703, CAST(N'2023-07-03' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230704, CAST(N'2023-07-04' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230705, CAST(N'2023-07-05' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230706, CAST(N'2023-07-06' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230707, CAST(N'2023-07-07' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230708, CAST(N'2023-07-08' AS Date), 2023, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230709, CAST(N'2023-07-09' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230710, CAST(N'2023-07-10' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230711, CAST(N'2023-07-11' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230712, CAST(N'2023-07-12' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230713, CAST(N'2023-07-13' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230714, CAST(N'2023-07-14' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230715, CAST(N'2023-07-15' AS Date), 2023, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230716, CAST(N'2023-07-16' AS Date), 2023, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230717, CAST(N'2023-07-17' AS Date), 2023, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230718, CAST(N'2023-07-18' AS Date), 2023, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230719, CAST(N'2023-07-19' AS Date), 2023, 7, N'July', 3, 29)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230720, CAST(N'2023-07-20' AS Date), 2023, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230721, CAST(N'2023-07-21' AS Date), 2023, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230722, CAST(N'2023-07-22' AS Date), 2023, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230723, CAST(N'2023-07-23' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230724, CAST(N'2023-07-24' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230725, CAST(N'2023-07-25' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230726, CAST(N'2023-07-26' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230727, CAST(N'2023-07-27' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230728, CAST(N'2023-07-28' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230729, CAST(N'2023-07-29' AS Date), 2023, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230730, CAST(N'2023-07-30' AS Date), 2023, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230731, CAST(N'2023-07-31' AS Date), 2023, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230801, CAST(N'2023-08-01' AS Date), 2023, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230802, CAST(N'2023-08-02' AS Date), 2023, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230803, CAST(N'2023-08-03' AS Date), 2023, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230804, CAST(N'2023-08-04' AS Date), 2023, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230805, CAST(N'2023-08-05' AS Date), 2023, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230806, CAST(N'2023-08-06' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230807, CAST(N'2023-08-07' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230808, CAST(N'2023-08-08' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230809, CAST(N'2023-08-09' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230810, CAST(N'2023-08-10' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230811, CAST(N'2023-08-11' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230812, CAST(N'2023-08-12' AS Date), 2023, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230813, CAST(N'2023-08-13' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230814, CAST(N'2023-08-14' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230815, CAST(N'2023-08-15' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230816, CAST(N'2023-08-16' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230817, CAST(N'2023-08-17' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230818, CAST(N'2023-08-18' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230819, CAST(N'2023-08-19' AS Date), 2023, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230820, CAST(N'2023-08-20' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230821, CAST(N'2023-08-21' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230822, CAST(N'2023-08-22' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230823, CAST(N'2023-08-23' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230824, CAST(N'2023-08-24' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230825, CAST(N'2023-08-25' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230826, CAST(N'2023-08-26' AS Date), 2023, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230827, CAST(N'2023-08-27' AS Date), 2023, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230828, CAST(N'2023-08-28' AS Date), 2023, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230829, CAST(N'2023-08-29' AS Date), 2023, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230830, CAST(N'2023-08-30' AS Date), 2023, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230831, CAST(N'2023-08-31' AS Date), 2023, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230901, CAST(N'2023-09-01' AS Date), 2023, 9, N'September', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230902, CAST(N'2023-09-02' AS Date), 2023, 9, N'September', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230903, CAST(N'2023-09-03' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230904, CAST(N'2023-09-04' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230905, CAST(N'2023-09-05' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230906, CAST(N'2023-09-06' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230907, CAST(N'2023-09-07' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230908, CAST(N'2023-09-08' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230909, CAST(N'2023-09-09' AS Date), 2023, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230910, CAST(N'2023-09-10' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230911, CAST(N'2023-09-11' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230912, CAST(N'2023-09-12' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230913, CAST(N'2023-09-13' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230914, CAST(N'2023-09-14' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230915, CAST(N'2023-09-15' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230916, CAST(N'2023-09-16' AS Date), 2023, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230917, CAST(N'2023-09-17' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230918, CAST(N'2023-09-18' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230919, CAST(N'2023-09-19' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230920, CAST(N'2023-09-20' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230921, CAST(N'2023-09-21' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230922, CAST(N'2023-09-22' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230923, CAST(N'2023-09-23' AS Date), 2023, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230924, CAST(N'2023-09-24' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230925, CAST(N'2023-09-25' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230926, CAST(N'2023-09-26' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230927, CAST(N'2023-09-27' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230928, CAST(N'2023-09-28' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230929, CAST(N'2023-09-29' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20230930, CAST(N'2023-09-30' AS Date), 2023, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231001, CAST(N'2023-10-01' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231002, CAST(N'2023-10-02' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231003, CAST(N'2023-10-03' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231004, CAST(N'2023-10-04' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231005, CAST(N'2023-10-05' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231006, CAST(N'2023-10-06' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231007, CAST(N'2023-10-07' AS Date), 2023, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231008, CAST(N'2023-10-08' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231009, CAST(N'2023-10-09' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231010, CAST(N'2023-10-10' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231011, CAST(N'2023-10-11' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231012, CAST(N'2023-10-12' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231013, CAST(N'2023-10-13' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231014, CAST(N'2023-10-14' AS Date), 2023, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231015, CAST(N'2023-10-15' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231016, CAST(N'2023-10-16' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231017, CAST(N'2023-10-17' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231018, CAST(N'2023-10-18' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231019, CAST(N'2023-10-19' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231020, CAST(N'2023-10-20' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231021, CAST(N'2023-10-21' AS Date), 2023, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231022, CAST(N'2023-10-22' AS Date), 2023, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231023, CAST(N'2023-10-23' AS Date), 2023, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231024, CAST(N'2023-10-24' AS Date), 2023, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231025, CAST(N'2023-10-25' AS Date), 2023, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231026, CAST(N'2023-10-26' AS Date), 2023, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231027, CAST(N'2023-10-27' AS Date), 2023, 10, N'October', 4, 43)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231028, CAST(N'2023-10-28' AS Date), 2023, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231029, CAST(N'2023-10-29' AS Date), 2023, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231030, CAST(N'2023-10-30' AS Date), 2023, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231031, CAST(N'2023-10-31' AS Date), 2023, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231101, CAST(N'2023-11-01' AS Date), 2023, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231102, CAST(N'2023-11-02' AS Date), 2023, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231103, CAST(N'2023-11-03' AS Date), 2023, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231104, CAST(N'2023-11-04' AS Date), 2023, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231105, CAST(N'2023-11-05' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231106, CAST(N'2023-11-06' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231107, CAST(N'2023-11-07' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231108, CAST(N'2023-11-08' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231109, CAST(N'2023-11-09' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231110, CAST(N'2023-11-10' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231111, CAST(N'2023-11-11' AS Date), 2023, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231112, CAST(N'2023-11-12' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231113, CAST(N'2023-11-13' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231114, CAST(N'2023-11-14' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231115, CAST(N'2023-11-15' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231116, CAST(N'2023-11-16' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231117, CAST(N'2023-11-17' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231118, CAST(N'2023-11-18' AS Date), 2023, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231119, CAST(N'2023-11-19' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231120, CAST(N'2023-11-20' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231121, CAST(N'2023-11-21' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231122, CAST(N'2023-11-22' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231123, CAST(N'2023-11-23' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231124, CAST(N'2023-11-24' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231125, CAST(N'2023-11-25' AS Date), 2023, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231126, CAST(N'2023-11-26' AS Date), 2023, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231127, CAST(N'2023-11-27' AS Date), 2023, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231128, CAST(N'2023-11-28' AS Date), 2023, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231129, CAST(N'2023-11-29' AS Date), 2023, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231130, CAST(N'2023-11-30' AS Date), 2023, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231201, CAST(N'2023-12-01' AS Date), 2023, 12, N'December', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231202, CAST(N'2023-12-02' AS Date), 2023, 12, N'December', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231203, CAST(N'2023-12-03' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231204, CAST(N'2023-12-04' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231205, CAST(N'2023-12-05' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231206, CAST(N'2023-12-06' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231207, CAST(N'2023-12-07' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231208, CAST(N'2023-12-08' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231209, CAST(N'2023-12-09' AS Date), 2023, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231210, CAST(N'2023-12-10' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231211, CAST(N'2023-12-11' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231212, CAST(N'2023-12-12' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231213, CAST(N'2023-12-13' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231214, CAST(N'2023-12-14' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231215, CAST(N'2023-12-15' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231216, CAST(N'2023-12-16' AS Date), 2023, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231217, CAST(N'2023-12-17' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231218, CAST(N'2023-12-18' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231219, CAST(N'2023-12-19' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231220, CAST(N'2023-12-20' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231221, CAST(N'2023-12-21' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231222, CAST(N'2023-12-22' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231223, CAST(N'2023-12-23' AS Date), 2023, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231224, CAST(N'2023-12-24' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231225, CAST(N'2023-12-25' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231226, CAST(N'2023-12-26' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231227, CAST(N'2023-12-27' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231228, CAST(N'2023-12-28' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231229, CAST(N'2023-12-29' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231230, CAST(N'2023-12-30' AS Date), 2023, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20231231, CAST(N'2023-12-31' AS Date), 2023, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240101, CAST(N'2024-01-01' AS Date), 2024, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240102, CAST(N'2024-01-02' AS Date), 2024, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240103, CAST(N'2024-01-03' AS Date), 2024, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240104, CAST(N'2024-01-04' AS Date), 2024, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240105, CAST(N'2024-01-05' AS Date), 2024, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240106, CAST(N'2024-01-06' AS Date), 2024, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240107, CAST(N'2024-01-07' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240108, CAST(N'2024-01-08' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240109, CAST(N'2024-01-09' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240110, CAST(N'2024-01-10' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240111, CAST(N'2024-01-11' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240112, CAST(N'2024-01-12' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240113, CAST(N'2024-01-13' AS Date), 2024, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240114, CAST(N'2024-01-14' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240115, CAST(N'2024-01-15' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240116, CAST(N'2024-01-16' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240117, CAST(N'2024-01-17' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240118, CAST(N'2024-01-18' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240119, CAST(N'2024-01-19' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240120, CAST(N'2024-01-20' AS Date), 2024, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240121, CAST(N'2024-01-21' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240122, CAST(N'2024-01-22' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240123, CAST(N'2024-01-23' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240124, CAST(N'2024-01-24' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240125, CAST(N'2024-01-25' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240126, CAST(N'2024-01-26' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240127, CAST(N'2024-01-27' AS Date), 2024, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240128, CAST(N'2024-01-28' AS Date), 2024, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240129, CAST(N'2024-01-29' AS Date), 2024, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240130, CAST(N'2024-01-30' AS Date), 2024, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240131, CAST(N'2024-01-31' AS Date), 2024, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240201, CAST(N'2024-02-01' AS Date), 2024, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240202, CAST(N'2024-02-02' AS Date), 2024, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240203, CAST(N'2024-02-03' AS Date), 2024, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240204, CAST(N'2024-02-04' AS Date), 2024, 2, N'February', 1, 6)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240205, CAST(N'2024-02-05' AS Date), 2024, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240206, CAST(N'2024-02-06' AS Date), 2024, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240207, CAST(N'2024-02-07' AS Date), 2024, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240208, CAST(N'2024-02-08' AS Date), 2024, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240209, CAST(N'2024-02-09' AS Date), 2024, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240210, CAST(N'2024-02-10' AS Date), 2024, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240211, CAST(N'2024-02-11' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240212, CAST(N'2024-02-12' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240213, CAST(N'2024-02-13' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240214, CAST(N'2024-02-14' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240215, CAST(N'2024-02-15' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240216, CAST(N'2024-02-16' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240217, CAST(N'2024-02-17' AS Date), 2024, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240218, CAST(N'2024-02-18' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240219, CAST(N'2024-02-19' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240220, CAST(N'2024-02-20' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240221, CAST(N'2024-02-21' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240222, CAST(N'2024-02-22' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240223, CAST(N'2024-02-23' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240224, CAST(N'2024-02-24' AS Date), 2024, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240225, CAST(N'2024-02-25' AS Date), 2024, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240226, CAST(N'2024-02-26' AS Date), 2024, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240227, CAST(N'2024-02-27' AS Date), 2024, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240228, CAST(N'2024-02-28' AS Date), 2024, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240229, CAST(N'2024-02-29' AS Date), 2024, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240301, CAST(N'2024-03-01' AS Date), 2024, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240302, CAST(N'2024-03-02' AS Date), 2024, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240303, CAST(N'2024-03-03' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240304, CAST(N'2024-03-04' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240305, CAST(N'2024-03-05' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240306, CAST(N'2024-03-06' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240307, CAST(N'2024-03-07' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240308, CAST(N'2024-03-08' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240309, CAST(N'2024-03-09' AS Date), 2024, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240310, CAST(N'2024-03-10' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240311, CAST(N'2024-03-11' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240312, CAST(N'2024-03-12' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240313, CAST(N'2024-03-13' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240314, CAST(N'2024-03-14' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240315, CAST(N'2024-03-15' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240316, CAST(N'2024-03-16' AS Date), 2024, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240317, CAST(N'2024-03-17' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240318, CAST(N'2024-03-18' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240319, CAST(N'2024-03-19' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240320, CAST(N'2024-03-20' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240321, CAST(N'2024-03-21' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240322, CAST(N'2024-03-22' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240323, CAST(N'2024-03-23' AS Date), 2024, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240324, CAST(N'2024-03-24' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240325, CAST(N'2024-03-25' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240326, CAST(N'2024-03-26' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240327, CAST(N'2024-03-27' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240328, CAST(N'2024-03-28' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240329, CAST(N'2024-03-29' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240330, CAST(N'2024-03-30' AS Date), 2024, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240331, CAST(N'2024-03-31' AS Date), 2024, 3, N'March', 1, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240401, CAST(N'2024-04-01' AS Date), 2024, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240402, CAST(N'2024-04-02' AS Date), 2024, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240403, CAST(N'2024-04-03' AS Date), 2024, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240404, CAST(N'2024-04-04' AS Date), 2024, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240405, CAST(N'2024-04-05' AS Date), 2024, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240406, CAST(N'2024-04-06' AS Date), 2024, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240407, CAST(N'2024-04-07' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240408, CAST(N'2024-04-08' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240409, CAST(N'2024-04-09' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240410, CAST(N'2024-04-10' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240411, CAST(N'2024-04-11' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240412, CAST(N'2024-04-12' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240413, CAST(N'2024-04-13' AS Date), 2024, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240414, CAST(N'2024-04-14' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240415, CAST(N'2024-04-15' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240416, CAST(N'2024-04-16' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240417, CAST(N'2024-04-17' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240418, CAST(N'2024-04-18' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240419, CAST(N'2024-04-19' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240420, CAST(N'2024-04-20' AS Date), 2024, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240421, CAST(N'2024-04-21' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240422, CAST(N'2024-04-22' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240423, CAST(N'2024-04-23' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240424, CAST(N'2024-04-24' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240425, CAST(N'2024-04-25' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240426, CAST(N'2024-04-26' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240427, CAST(N'2024-04-27' AS Date), 2024, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240428, CAST(N'2024-04-28' AS Date), 2024, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240429, CAST(N'2024-04-29' AS Date), 2024, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240430, CAST(N'2024-04-30' AS Date), 2024, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240501, CAST(N'2024-05-01' AS Date), 2024, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240502, CAST(N'2024-05-02' AS Date), 2024, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240503, CAST(N'2024-05-03' AS Date), 2024, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240504, CAST(N'2024-05-04' AS Date), 2024, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240505, CAST(N'2024-05-05' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240506, CAST(N'2024-05-06' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240507, CAST(N'2024-05-07' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240508, CAST(N'2024-05-08' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240509, CAST(N'2024-05-09' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240510, CAST(N'2024-05-10' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240511, CAST(N'2024-05-11' AS Date), 2024, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240512, CAST(N'2024-05-12' AS Date), 2024, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240513, CAST(N'2024-05-13' AS Date), 2024, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240514, CAST(N'2024-05-14' AS Date), 2024, 5, N'May', 2, 20)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240515, CAST(N'2024-05-15' AS Date), 2024, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240516, CAST(N'2024-05-16' AS Date), 2024, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240517, CAST(N'2024-05-17' AS Date), 2024, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240518, CAST(N'2024-05-18' AS Date), 2024, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240519, CAST(N'2024-05-19' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240520, CAST(N'2024-05-20' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240521, CAST(N'2024-05-21' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240522, CAST(N'2024-05-22' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240523, CAST(N'2024-05-23' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240524, CAST(N'2024-05-24' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240525, CAST(N'2024-05-25' AS Date), 2024, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240526, CAST(N'2024-05-26' AS Date), 2024, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240527, CAST(N'2024-05-27' AS Date), 2024, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240528, CAST(N'2024-05-28' AS Date), 2024, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240529, CAST(N'2024-05-29' AS Date), 2024, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240530, CAST(N'2024-05-30' AS Date), 2024, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240531, CAST(N'2024-05-31' AS Date), 2024, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240601, CAST(N'2024-06-01' AS Date), 2024, 6, N'June', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240602, CAST(N'2024-06-02' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240603, CAST(N'2024-06-03' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240604, CAST(N'2024-06-04' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240605, CAST(N'2024-06-05' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240606, CAST(N'2024-06-06' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240607, CAST(N'2024-06-07' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240608, CAST(N'2024-06-08' AS Date), 2024, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240609, CAST(N'2024-06-09' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240610, CAST(N'2024-06-10' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240611, CAST(N'2024-06-11' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240612, CAST(N'2024-06-12' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240613, CAST(N'2024-06-13' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240614, CAST(N'2024-06-14' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240615, CAST(N'2024-06-15' AS Date), 2024, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240616, CAST(N'2024-06-16' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240617, CAST(N'2024-06-17' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240618, CAST(N'2024-06-18' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240619, CAST(N'2024-06-19' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240620, CAST(N'2024-06-20' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240621, CAST(N'2024-06-21' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240622, CAST(N'2024-06-22' AS Date), 2024, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240623, CAST(N'2024-06-23' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240624, CAST(N'2024-06-24' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240625, CAST(N'2024-06-25' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240626, CAST(N'2024-06-26' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240627, CAST(N'2024-06-27' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240628, CAST(N'2024-06-28' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240629, CAST(N'2024-06-29' AS Date), 2024, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240630, CAST(N'2024-06-30' AS Date), 2024, 6, N'June', 2, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240701, CAST(N'2024-07-01' AS Date), 2024, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240702, CAST(N'2024-07-02' AS Date), 2024, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240703, CAST(N'2024-07-03' AS Date), 2024, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240704, CAST(N'2024-07-04' AS Date), 2024, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240705, CAST(N'2024-07-05' AS Date), 2024, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240706, CAST(N'2024-07-06' AS Date), 2024, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240707, CAST(N'2024-07-07' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240708, CAST(N'2024-07-08' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240709, CAST(N'2024-07-09' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240710, CAST(N'2024-07-10' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240711, CAST(N'2024-07-11' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240712, CAST(N'2024-07-12' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240713, CAST(N'2024-07-13' AS Date), 2024, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240714, CAST(N'2024-07-14' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240715, CAST(N'2024-07-15' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240716, CAST(N'2024-07-16' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240717, CAST(N'2024-07-17' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240718, CAST(N'2024-07-18' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240719, CAST(N'2024-07-19' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240720, CAST(N'2024-07-20' AS Date), 2024, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240721, CAST(N'2024-07-21' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240722, CAST(N'2024-07-22' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240723, CAST(N'2024-07-23' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240724, CAST(N'2024-07-24' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240725, CAST(N'2024-07-25' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240726, CAST(N'2024-07-26' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240727, CAST(N'2024-07-27' AS Date), 2024, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240728, CAST(N'2024-07-28' AS Date), 2024, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240729, CAST(N'2024-07-29' AS Date), 2024, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240730, CAST(N'2024-07-30' AS Date), 2024, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240731, CAST(N'2024-07-31' AS Date), 2024, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240801, CAST(N'2024-08-01' AS Date), 2024, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240802, CAST(N'2024-08-02' AS Date), 2024, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240803, CAST(N'2024-08-03' AS Date), 2024, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240804, CAST(N'2024-08-04' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240805, CAST(N'2024-08-05' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240806, CAST(N'2024-08-06' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240807, CAST(N'2024-08-07' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240808, CAST(N'2024-08-08' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240809, CAST(N'2024-08-09' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240810, CAST(N'2024-08-10' AS Date), 2024, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240811, CAST(N'2024-08-11' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240812, CAST(N'2024-08-12' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240813, CAST(N'2024-08-13' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240814, CAST(N'2024-08-14' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240815, CAST(N'2024-08-15' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240816, CAST(N'2024-08-16' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240817, CAST(N'2024-08-17' AS Date), 2024, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240818, CAST(N'2024-08-18' AS Date), 2024, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240819, CAST(N'2024-08-19' AS Date), 2024, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240820, CAST(N'2024-08-20' AS Date), 2024, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240821, CAST(N'2024-08-21' AS Date), 2024, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240822, CAST(N'2024-08-22' AS Date), 2024, 8, N'August', 3, 34)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240823, CAST(N'2024-08-23' AS Date), 2024, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240824, CAST(N'2024-08-24' AS Date), 2024, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240825, CAST(N'2024-08-25' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240826, CAST(N'2024-08-26' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240827, CAST(N'2024-08-27' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240828, CAST(N'2024-08-28' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240829, CAST(N'2024-08-29' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240830, CAST(N'2024-08-30' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240831, CAST(N'2024-08-31' AS Date), 2024, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240901, CAST(N'2024-09-01' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240902, CAST(N'2024-09-02' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240903, CAST(N'2024-09-03' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240904, CAST(N'2024-09-04' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240905, CAST(N'2024-09-05' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240906, CAST(N'2024-09-06' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240907, CAST(N'2024-09-07' AS Date), 2024, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240908, CAST(N'2024-09-08' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240909, CAST(N'2024-09-09' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240910, CAST(N'2024-09-10' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240911, CAST(N'2024-09-11' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240912, CAST(N'2024-09-12' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240913, CAST(N'2024-09-13' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240914, CAST(N'2024-09-14' AS Date), 2024, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240915, CAST(N'2024-09-15' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240916, CAST(N'2024-09-16' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240917, CAST(N'2024-09-17' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240918, CAST(N'2024-09-18' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240919, CAST(N'2024-09-19' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240920, CAST(N'2024-09-20' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240921, CAST(N'2024-09-21' AS Date), 2024, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240922, CAST(N'2024-09-22' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240923, CAST(N'2024-09-23' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240924, CAST(N'2024-09-24' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240925, CAST(N'2024-09-25' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240926, CAST(N'2024-09-26' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240927, CAST(N'2024-09-27' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240928, CAST(N'2024-09-28' AS Date), 2024, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240929, CAST(N'2024-09-29' AS Date), 2024, 9, N'September', 3, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20240930, CAST(N'2024-09-30' AS Date), 2024, 9, N'September', 3, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241001, CAST(N'2024-10-01' AS Date), 2024, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241002, CAST(N'2024-10-02' AS Date), 2024, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241003, CAST(N'2024-10-03' AS Date), 2024, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241004, CAST(N'2024-10-04' AS Date), 2024, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241005, CAST(N'2024-10-05' AS Date), 2024, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241006, CAST(N'2024-10-06' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241007, CAST(N'2024-10-07' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241008, CAST(N'2024-10-08' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241009, CAST(N'2024-10-09' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241010, CAST(N'2024-10-10' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241011, CAST(N'2024-10-11' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241012, CAST(N'2024-10-12' AS Date), 2024, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241013, CAST(N'2024-10-13' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241014, CAST(N'2024-10-14' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241015, CAST(N'2024-10-15' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241016, CAST(N'2024-10-16' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241017, CAST(N'2024-10-17' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241018, CAST(N'2024-10-18' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241019, CAST(N'2024-10-19' AS Date), 2024, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241020, CAST(N'2024-10-20' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241021, CAST(N'2024-10-21' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241022, CAST(N'2024-10-22' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241023, CAST(N'2024-10-23' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241024, CAST(N'2024-10-24' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241025, CAST(N'2024-10-25' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241026, CAST(N'2024-10-26' AS Date), 2024, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241027, CAST(N'2024-10-27' AS Date), 2024, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241028, CAST(N'2024-10-28' AS Date), 2024, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241029, CAST(N'2024-10-29' AS Date), 2024, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241030, CAST(N'2024-10-30' AS Date), 2024, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241031, CAST(N'2024-10-31' AS Date), 2024, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241101, CAST(N'2024-11-01' AS Date), 2024, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241102, CAST(N'2024-11-02' AS Date), 2024, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241103, CAST(N'2024-11-03' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241104, CAST(N'2024-11-04' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241105, CAST(N'2024-11-05' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241106, CAST(N'2024-11-06' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241107, CAST(N'2024-11-07' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241108, CAST(N'2024-11-08' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241109, CAST(N'2024-11-09' AS Date), 2024, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241110, CAST(N'2024-11-10' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241111, CAST(N'2024-11-11' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241112, CAST(N'2024-11-12' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241113, CAST(N'2024-11-13' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241114, CAST(N'2024-11-14' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241115, CAST(N'2024-11-15' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241116, CAST(N'2024-11-16' AS Date), 2024, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241117, CAST(N'2024-11-17' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241118, CAST(N'2024-11-18' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241119, CAST(N'2024-11-19' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241120, CAST(N'2024-11-20' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241121, CAST(N'2024-11-21' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241122, CAST(N'2024-11-22' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241123, CAST(N'2024-11-23' AS Date), 2024, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241124, CAST(N'2024-11-24' AS Date), 2024, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241125, CAST(N'2024-11-25' AS Date), 2024, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241126, CAST(N'2024-11-26' AS Date), 2024, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241127, CAST(N'2024-11-27' AS Date), 2024, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241128, CAST(N'2024-11-28' AS Date), 2024, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241129, CAST(N'2024-11-29' AS Date), 2024, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241130, CAST(N'2024-11-30' AS Date), 2024, 11, N'November', 4, 48)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241201, CAST(N'2024-12-01' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241202, CAST(N'2024-12-02' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241203, CAST(N'2024-12-03' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241204, CAST(N'2024-12-04' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241205, CAST(N'2024-12-05' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241206, CAST(N'2024-12-06' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241207, CAST(N'2024-12-07' AS Date), 2024, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241208, CAST(N'2024-12-08' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241209, CAST(N'2024-12-09' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241210, CAST(N'2024-12-10' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241211, CAST(N'2024-12-11' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241212, CAST(N'2024-12-12' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241213, CAST(N'2024-12-13' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241214, CAST(N'2024-12-14' AS Date), 2024, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241215, CAST(N'2024-12-15' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241216, CAST(N'2024-12-16' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241217, CAST(N'2024-12-17' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241218, CAST(N'2024-12-18' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241219, CAST(N'2024-12-19' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241220, CAST(N'2024-12-20' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241221, CAST(N'2024-12-21' AS Date), 2024, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241222, CAST(N'2024-12-22' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241223, CAST(N'2024-12-23' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241224, CAST(N'2024-12-24' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241225, CAST(N'2024-12-25' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241226, CAST(N'2024-12-26' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241227, CAST(N'2024-12-27' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241228, CAST(N'2024-12-28' AS Date), 2024, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241229, CAST(N'2024-12-29' AS Date), 2024, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241230, CAST(N'2024-12-30' AS Date), 2024, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20241231, CAST(N'2024-12-31' AS Date), 2024, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250101, CAST(N'2025-01-01' AS Date), 2025, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250102, CAST(N'2025-01-02' AS Date), 2025, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250103, CAST(N'2025-01-03' AS Date), 2025, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250104, CAST(N'2025-01-04' AS Date), 2025, 1, N'January', 1, 1)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250105, CAST(N'2025-01-05' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250106, CAST(N'2025-01-06' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250107, CAST(N'2025-01-07' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250108, CAST(N'2025-01-08' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250109, CAST(N'2025-01-09' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250110, CAST(N'2025-01-10' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250111, CAST(N'2025-01-11' AS Date), 2025, 1, N'January', 1, 2)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250112, CAST(N'2025-01-12' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250113, CAST(N'2025-01-13' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250114, CAST(N'2025-01-14' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250115, CAST(N'2025-01-15' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250116, CAST(N'2025-01-16' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250117, CAST(N'2025-01-17' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250118, CAST(N'2025-01-18' AS Date), 2025, 1, N'January', 1, 3)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250119, CAST(N'2025-01-19' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250120, CAST(N'2025-01-20' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250121, CAST(N'2025-01-21' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250122, CAST(N'2025-01-22' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250123, CAST(N'2025-01-23' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250124, CAST(N'2025-01-24' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250125, CAST(N'2025-01-25' AS Date), 2025, 1, N'January', 1, 4)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250126, CAST(N'2025-01-26' AS Date), 2025, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250127, CAST(N'2025-01-27' AS Date), 2025, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250128, CAST(N'2025-01-28' AS Date), 2025, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250129, CAST(N'2025-01-29' AS Date), 2025, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250130, CAST(N'2025-01-30' AS Date), 2025, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250131, CAST(N'2025-01-31' AS Date), 2025, 1, N'January', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250201, CAST(N'2025-02-01' AS Date), 2025, 2, N'February', 1, 5)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250202, CAST(N'2025-02-02' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250203, CAST(N'2025-02-03' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250204, CAST(N'2025-02-04' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250205, CAST(N'2025-02-05' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250206, CAST(N'2025-02-06' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250207, CAST(N'2025-02-07' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250208, CAST(N'2025-02-08' AS Date), 2025, 2, N'February', 1, 6)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250209, CAST(N'2025-02-09' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250210, CAST(N'2025-02-10' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250211, CAST(N'2025-02-11' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250212, CAST(N'2025-02-12' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250213, CAST(N'2025-02-13' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250214, CAST(N'2025-02-14' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250215, CAST(N'2025-02-15' AS Date), 2025, 2, N'February', 1, 7)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250216, CAST(N'2025-02-16' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250217, CAST(N'2025-02-17' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250218, CAST(N'2025-02-18' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250219, CAST(N'2025-02-19' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250220, CAST(N'2025-02-20' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250221, CAST(N'2025-02-21' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250222, CAST(N'2025-02-22' AS Date), 2025, 2, N'February', 1, 8)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250223, CAST(N'2025-02-23' AS Date), 2025, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250224, CAST(N'2025-02-24' AS Date), 2025, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250225, CAST(N'2025-02-25' AS Date), 2025, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250226, CAST(N'2025-02-26' AS Date), 2025, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250227, CAST(N'2025-02-27' AS Date), 2025, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250228, CAST(N'2025-02-28' AS Date), 2025, 2, N'February', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250301, CAST(N'2025-03-01' AS Date), 2025, 3, N'March', 1, 9)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250302, CAST(N'2025-03-02' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250303, CAST(N'2025-03-03' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250304, CAST(N'2025-03-04' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250305, CAST(N'2025-03-05' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250306, CAST(N'2025-03-06' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250307, CAST(N'2025-03-07' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250308, CAST(N'2025-03-08' AS Date), 2025, 3, N'March', 1, 10)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250309, CAST(N'2025-03-09' AS Date), 2025, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250310, CAST(N'2025-03-10' AS Date), 2025, 3, N'March', 1, 11)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250311, CAST(N'2025-03-11' AS Date), 2025, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250312, CAST(N'2025-03-12' AS Date), 2025, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250313, CAST(N'2025-03-13' AS Date), 2025, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250314, CAST(N'2025-03-14' AS Date), 2025, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250315, CAST(N'2025-03-15' AS Date), 2025, 3, N'March', 1, 11)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250316, CAST(N'2025-03-16' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250317, CAST(N'2025-03-17' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250318, CAST(N'2025-03-18' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250319, CAST(N'2025-03-19' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250320, CAST(N'2025-03-20' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250321, CAST(N'2025-03-21' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250322, CAST(N'2025-03-22' AS Date), 2025, 3, N'March', 1, 12)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250323, CAST(N'2025-03-23' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250324, CAST(N'2025-03-24' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250325, CAST(N'2025-03-25' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250326, CAST(N'2025-03-26' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250327, CAST(N'2025-03-27' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250328, CAST(N'2025-03-28' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250329, CAST(N'2025-03-29' AS Date), 2025, 3, N'March', 1, 13)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250330, CAST(N'2025-03-30' AS Date), 2025, 3, N'March', 1, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250331, CAST(N'2025-03-31' AS Date), 2025, 3, N'March', 1, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250401, CAST(N'2025-04-01' AS Date), 2025, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250402, CAST(N'2025-04-02' AS Date), 2025, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250403, CAST(N'2025-04-03' AS Date), 2025, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250404, CAST(N'2025-04-04' AS Date), 2025, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250405, CAST(N'2025-04-05' AS Date), 2025, 4, N'April', 2, 14)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250406, CAST(N'2025-04-06' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250407, CAST(N'2025-04-07' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250408, CAST(N'2025-04-08' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250409, CAST(N'2025-04-09' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250410, CAST(N'2025-04-10' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250411, CAST(N'2025-04-11' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250412, CAST(N'2025-04-12' AS Date), 2025, 4, N'April', 2, 15)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250413, CAST(N'2025-04-13' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250414, CAST(N'2025-04-14' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250415, CAST(N'2025-04-15' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250416, CAST(N'2025-04-16' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250417, CAST(N'2025-04-17' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250418, CAST(N'2025-04-18' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250419, CAST(N'2025-04-19' AS Date), 2025, 4, N'April', 2, 16)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250420, CAST(N'2025-04-20' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250421, CAST(N'2025-04-21' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250422, CAST(N'2025-04-22' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250423, CAST(N'2025-04-23' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250424, CAST(N'2025-04-24' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250425, CAST(N'2025-04-25' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250426, CAST(N'2025-04-26' AS Date), 2025, 4, N'April', 2, 17)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250427, CAST(N'2025-04-27' AS Date), 2025, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250428, CAST(N'2025-04-28' AS Date), 2025, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250429, CAST(N'2025-04-29' AS Date), 2025, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250430, CAST(N'2025-04-30' AS Date), 2025, 4, N'April', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250501, CAST(N'2025-05-01' AS Date), 2025, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250502, CAST(N'2025-05-02' AS Date), 2025, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250503, CAST(N'2025-05-03' AS Date), 2025, 5, N'May', 2, 18)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250504, CAST(N'2025-05-04' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250505, CAST(N'2025-05-05' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250506, CAST(N'2025-05-06' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250507, CAST(N'2025-05-07' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250508, CAST(N'2025-05-08' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250509, CAST(N'2025-05-09' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250510, CAST(N'2025-05-10' AS Date), 2025, 5, N'May', 2, 19)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250511, CAST(N'2025-05-11' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250512, CAST(N'2025-05-12' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250513, CAST(N'2025-05-13' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250514, CAST(N'2025-05-14' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250515, CAST(N'2025-05-15' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250516, CAST(N'2025-05-16' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250517, CAST(N'2025-05-17' AS Date), 2025, 5, N'May', 2, 20)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250518, CAST(N'2025-05-18' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250519, CAST(N'2025-05-19' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250520, CAST(N'2025-05-20' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250521, CAST(N'2025-05-21' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250522, CAST(N'2025-05-22' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250523, CAST(N'2025-05-23' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250524, CAST(N'2025-05-24' AS Date), 2025, 5, N'May', 2, 21)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250525, CAST(N'2025-05-25' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250526, CAST(N'2025-05-26' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250527, CAST(N'2025-05-27' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250528, CAST(N'2025-05-28' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250529, CAST(N'2025-05-29' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250530, CAST(N'2025-05-30' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250531, CAST(N'2025-05-31' AS Date), 2025, 5, N'May', 2, 22)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250601, CAST(N'2025-06-01' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250602, CAST(N'2025-06-02' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250603, CAST(N'2025-06-03' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250604, CAST(N'2025-06-04' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250605, CAST(N'2025-06-05' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250606, CAST(N'2025-06-06' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250607, CAST(N'2025-06-07' AS Date), 2025, 6, N'June', 2, 23)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250608, CAST(N'2025-06-08' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250609, CAST(N'2025-06-09' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250610, CAST(N'2025-06-10' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250611, CAST(N'2025-06-11' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250612, CAST(N'2025-06-12' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250613, CAST(N'2025-06-13' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250614, CAST(N'2025-06-14' AS Date), 2025, 6, N'June', 2, 24)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250615, CAST(N'2025-06-15' AS Date), 2025, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250616, CAST(N'2025-06-16' AS Date), 2025, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250617, CAST(N'2025-06-17' AS Date), 2025, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250618, CAST(N'2025-06-18' AS Date), 2025, 6, N'June', 2, 25)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250619, CAST(N'2025-06-19' AS Date), 2025, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250620, CAST(N'2025-06-20' AS Date), 2025, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250621, CAST(N'2025-06-21' AS Date), 2025, 6, N'June', 2, 25)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250622, CAST(N'2025-06-22' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250623, CAST(N'2025-06-23' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250624, CAST(N'2025-06-24' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250625, CAST(N'2025-06-25' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250626, CAST(N'2025-06-26' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250627, CAST(N'2025-06-27' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250628, CAST(N'2025-06-28' AS Date), 2025, 6, N'June', 2, 26)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250629, CAST(N'2025-06-29' AS Date), 2025, 6, N'June', 2, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250630, CAST(N'2025-06-30' AS Date), 2025, 6, N'June', 2, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250701, CAST(N'2025-07-01' AS Date), 2025, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250702, CAST(N'2025-07-02' AS Date), 2025, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250703, CAST(N'2025-07-03' AS Date), 2025, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250704, CAST(N'2025-07-04' AS Date), 2025, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250705, CAST(N'2025-07-05' AS Date), 2025, 7, N'July', 3, 27)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250706, CAST(N'2025-07-06' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250707, CAST(N'2025-07-07' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250708, CAST(N'2025-07-08' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250709, CAST(N'2025-07-09' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250710, CAST(N'2025-07-10' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250711, CAST(N'2025-07-11' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250712, CAST(N'2025-07-12' AS Date), 2025, 7, N'July', 3, 28)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250713, CAST(N'2025-07-13' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250714, CAST(N'2025-07-14' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250715, CAST(N'2025-07-15' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250716, CAST(N'2025-07-16' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250717, CAST(N'2025-07-17' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250718, CAST(N'2025-07-18' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250719, CAST(N'2025-07-19' AS Date), 2025, 7, N'July', 3, 29)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250720, CAST(N'2025-07-20' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250721, CAST(N'2025-07-21' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250722, CAST(N'2025-07-22' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250723, CAST(N'2025-07-23' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250724, CAST(N'2025-07-24' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250725, CAST(N'2025-07-25' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250726, CAST(N'2025-07-26' AS Date), 2025, 7, N'July', 3, 30)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250727, CAST(N'2025-07-27' AS Date), 2025, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250728, CAST(N'2025-07-28' AS Date), 2025, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250729, CAST(N'2025-07-29' AS Date), 2025, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250730, CAST(N'2025-07-30' AS Date), 2025, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250731, CAST(N'2025-07-31' AS Date), 2025, 7, N'July', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250801, CAST(N'2025-08-01' AS Date), 2025, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250802, CAST(N'2025-08-02' AS Date), 2025, 8, N'August', 3, 31)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250803, CAST(N'2025-08-03' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250804, CAST(N'2025-08-04' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250805, CAST(N'2025-08-05' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250806, CAST(N'2025-08-06' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250807, CAST(N'2025-08-07' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250808, CAST(N'2025-08-08' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250809, CAST(N'2025-08-09' AS Date), 2025, 8, N'August', 3, 32)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250810, CAST(N'2025-08-10' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250811, CAST(N'2025-08-11' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250812, CAST(N'2025-08-12' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250813, CAST(N'2025-08-13' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250814, CAST(N'2025-08-14' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250815, CAST(N'2025-08-15' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250816, CAST(N'2025-08-16' AS Date), 2025, 8, N'August', 3, 33)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250817, CAST(N'2025-08-17' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250818, CAST(N'2025-08-18' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250819, CAST(N'2025-08-19' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250820, CAST(N'2025-08-20' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250821, CAST(N'2025-08-21' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250822, CAST(N'2025-08-22' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250823, CAST(N'2025-08-23' AS Date), 2025, 8, N'August', 3, 34)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250824, CAST(N'2025-08-24' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250825, CAST(N'2025-08-25' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250826, CAST(N'2025-08-26' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250827, CAST(N'2025-08-27' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250828, CAST(N'2025-08-28' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250829, CAST(N'2025-08-29' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250830, CAST(N'2025-08-30' AS Date), 2025, 8, N'August', 3, 35)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250831, CAST(N'2025-08-31' AS Date), 2025, 8, N'August', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250901, CAST(N'2025-09-01' AS Date), 2025, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250902, CAST(N'2025-09-02' AS Date), 2025, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250903, CAST(N'2025-09-03' AS Date), 2025, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250904, CAST(N'2025-09-04' AS Date), 2025, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250905, CAST(N'2025-09-05' AS Date), 2025, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250906, CAST(N'2025-09-06' AS Date), 2025, 9, N'September', 3, 36)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250907, CAST(N'2025-09-07' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250908, CAST(N'2025-09-08' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250909, CAST(N'2025-09-09' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250910, CAST(N'2025-09-10' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250911, CAST(N'2025-09-11' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250912, CAST(N'2025-09-12' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250913, CAST(N'2025-09-13' AS Date), 2025, 9, N'September', 3, 37)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250914, CAST(N'2025-09-14' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250915, CAST(N'2025-09-15' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250916, CAST(N'2025-09-16' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250917, CAST(N'2025-09-17' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250918, CAST(N'2025-09-18' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250919, CAST(N'2025-09-19' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250920, CAST(N'2025-09-20' AS Date), 2025, 9, N'September', 3, 38)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250921, CAST(N'2025-09-21' AS Date), 2025, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250922, CAST(N'2025-09-22' AS Date), 2025, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250923, CAST(N'2025-09-23' AS Date), 2025, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250924, CAST(N'2025-09-24' AS Date), 2025, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250925, CAST(N'2025-09-25' AS Date), 2025, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250926, CAST(N'2025-09-26' AS Date), 2025, 9, N'September', 3, 39)
GO
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250927, CAST(N'2025-09-27' AS Date), 2025, 9, N'September', 3, 39)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250928, CAST(N'2025-09-28' AS Date), 2025, 9, N'September', 3, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250929, CAST(N'2025-09-29' AS Date), 2025, 9, N'September', 3, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20250930, CAST(N'2025-09-30' AS Date), 2025, 9, N'September', 3, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251001, CAST(N'2025-10-01' AS Date), 2025, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251002, CAST(N'2025-10-02' AS Date), 2025, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251003, CAST(N'2025-10-03' AS Date), 2025, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251004, CAST(N'2025-10-04' AS Date), 2025, 10, N'October', 4, 40)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251005, CAST(N'2025-10-05' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251006, CAST(N'2025-10-06' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251007, CAST(N'2025-10-07' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251008, CAST(N'2025-10-08' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251009, CAST(N'2025-10-09' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251010, CAST(N'2025-10-10' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251011, CAST(N'2025-10-11' AS Date), 2025, 10, N'October', 4, 41)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251012, CAST(N'2025-10-12' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251013, CAST(N'2025-10-13' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251014, CAST(N'2025-10-14' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251015, CAST(N'2025-10-15' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251016, CAST(N'2025-10-16' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251017, CAST(N'2025-10-17' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251018, CAST(N'2025-10-18' AS Date), 2025, 10, N'October', 4, 42)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251019, CAST(N'2025-10-19' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251020, CAST(N'2025-10-20' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251021, CAST(N'2025-10-21' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251022, CAST(N'2025-10-22' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251023, CAST(N'2025-10-23' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251024, CAST(N'2025-10-24' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251025, CAST(N'2025-10-25' AS Date), 2025, 10, N'October', 4, 43)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251026, CAST(N'2025-10-26' AS Date), 2025, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251027, CAST(N'2025-10-27' AS Date), 2025, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251028, CAST(N'2025-10-28' AS Date), 2025, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251029, CAST(N'2025-10-29' AS Date), 2025, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251030, CAST(N'2025-10-30' AS Date), 2025, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251031, CAST(N'2025-10-31' AS Date), 2025, 10, N'October', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251101, CAST(N'2025-11-01' AS Date), 2025, 11, N'November', 4, 44)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251102, CAST(N'2025-11-02' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251103, CAST(N'2025-11-03' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251104, CAST(N'2025-11-04' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251105, CAST(N'2025-11-05' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251106, CAST(N'2025-11-06' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251107, CAST(N'2025-11-07' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251108, CAST(N'2025-11-08' AS Date), 2025, 11, N'November', 4, 45)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251109, CAST(N'2025-11-09' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251110, CAST(N'2025-11-10' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251111, CAST(N'2025-11-11' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251112, CAST(N'2025-11-12' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251113, CAST(N'2025-11-13' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251114, CAST(N'2025-11-14' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251115, CAST(N'2025-11-15' AS Date), 2025, 11, N'November', 4, 46)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251116, CAST(N'2025-11-16' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251117, CAST(N'2025-11-17' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251118, CAST(N'2025-11-18' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251119, CAST(N'2025-11-19' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251120, CAST(N'2025-11-20' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251121, CAST(N'2025-11-21' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251122, CAST(N'2025-11-22' AS Date), 2025, 11, N'November', 4, 47)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251123, CAST(N'2025-11-23' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251124, CAST(N'2025-11-24' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251125, CAST(N'2025-11-25' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251126, CAST(N'2025-11-26' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251127, CAST(N'2025-11-27' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251128, CAST(N'2025-11-28' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251129, CAST(N'2025-11-29' AS Date), 2025, 11, N'November', 4, 48)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251130, CAST(N'2025-11-30' AS Date), 2025, 11, N'November', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251201, CAST(N'2025-12-01' AS Date), 2025, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251202, CAST(N'2025-12-02' AS Date), 2025, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251203, CAST(N'2025-12-03' AS Date), 2025, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251204, CAST(N'2025-12-04' AS Date), 2025, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251205, CAST(N'2025-12-05' AS Date), 2025, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251206, CAST(N'2025-12-06' AS Date), 2025, 12, N'December', 4, 49)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251207, CAST(N'2025-12-07' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251208, CAST(N'2025-12-08' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251209, CAST(N'2025-12-09' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251210, CAST(N'2025-12-10' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251211, CAST(N'2025-12-11' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251212, CAST(N'2025-12-12' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251213, CAST(N'2025-12-13' AS Date), 2025, 12, N'December', 4, 50)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251214, CAST(N'2025-12-14' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251215, CAST(N'2025-12-15' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251216, CAST(N'2025-12-16' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251217, CAST(N'2025-12-17' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251218, CAST(N'2025-12-18' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251219, CAST(N'2025-12-19' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251220, CAST(N'2025-12-20' AS Date), 2025, 12, N'December', 4, 51)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251221, CAST(N'2025-12-21' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251222, CAST(N'2025-12-22' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251223, CAST(N'2025-12-23' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251224, CAST(N'2025-12-24' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251225, CAST(N'2025-12-25' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251226, CAST(N'2025-12-26' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251227, CAST(N'2025-12-27' AS Date), 2025, 12, N'December', 4, 52)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251228, CAST(N'2025-12-28' AS Date), 2025, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251229, CAST(N'2025-12-29' AS Date), 2025, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251230, CAST(N'2025-12-30' AS Date), 2025, 12, N'December', 4, 53)
INSERT [dbo].[Dim_Fecha] ([ID_Fecha], [Fecha], [Anio], [Mes], [Nombre_Mes], [Trimestre], [Semana]) VALUES (20251231, CAST(N'2025-12-31' AS Date), 2025, 12, N'December', 4, 53)
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (1, N'Roberto Mendez', N'Gerente', N'roberto.mendez@recipack.com', N'5551987654', CAST(N'2020-05-10' AS Date), CAST(25000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (2, N'Carlos Jiménez', N'Operario', N'carlos.jimenez@recipack.com', N'5552876543', CAST(N'2021-02-15' AS Date), CAST(12000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (3, N'Luisa Fernández', N'Comercial', N'luisa.fernandez@recipack.com', N'5553765432', CAST(N'2021-03-20' AS Date), CAST(15000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (4, N'Jorge Ramírez', N'Conductor', N'jorge.ramirez@recipack.com', N'5554654321', CAST(N'2021-06-05' AS Date), CAST(11000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (5, N'María López', N'Administrativo', N'maria.lopez@recipack.com', N'5555543210', CAST(N'2022-01-10' AS Date), CAST(13000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (6, N'Pedro Sánchez', N'Operario', N'pedro.sanchez@recipack.com', N'5556432109', CAST(N'2022-04-22' AS Date), CAST(12000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (7, N'Ana Martínez', N'Supervisor', N'ana.martinez@recipack.com', N'5557321098', CAST(N'2021-03-15' AS Date), CAST(18000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (8, N'Miguel Ángel Cruz', N'Operario', N'miguel.cruz@recipack.com', N'5558210987', CAST(N'2022-07-01' AS Date), CAST(11500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (9, N'Laura Gómez', N'Comercial', N'laura.gomez@recipack.com', N'5559109876', CAST(N'2022-09-12' AS Date), CAST(14500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (10, N'Francisco Ruiz', N'Conductor', N'francisco.ruiz@recipack.com', N'5551098765', CAST(N'2022-11-05' AS Date), CAST(11200.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (11, N'Isabel Díaz', N'Administrativo', N'isabel.diaz@recipack.com', N'5552987654', CAST(N'2023-01-20' AS Date), CAST(12800.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (12, N'Ricardo Vargas', N'Operario', N'ricardo.vargas@recipack.com', N'5553876543', CAST(N'2023-03-10' AS Date), CAST(11800.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (13, N'Patricia Castro', N'Supervisor', N'patricia.castro@recipack.com', N'5554765432', CAST(N'2021-04-05' AS Date), CAST(17500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (14, N'Oscar Mendoza', N'Operario', N'oscar.mendoza@recipack.com', N'5555654321', CAST(N'2023-06-15' AS Date), CAST(11900.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (15, N'Sofía Herrera', N'Comercial', N'sofia.herrera@recipack.com', N'5556543210', CAST(N'2023-08-22' AS Date), CAST(14200.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (18, N'Carlos Mendoza', N'Supervisor', N'carlos@recipack.com', N'999111222', CAST(N'2024-01-15' AS Date), CAST(2500.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Puesto], [Email], [Telefono], [Fecha_Contratacion], [Salario], [Activo]) VALUES (19, N'Ana Torres', N'Operario', N'ana@recipack.com', N'987654321', CAST(N'2024-03-01' AS Date), CAST(1800.00 AS Decimal(10, 2)), 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (230, 1, 2, CAST(1301.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (231, 2, 2, CAST(3540.75 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (232, 3, 2, CAST(780.25 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (233, 4, 2, CAST(5230.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (234, 5, 2, CAST(950.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (235, 11, 2, CAST(980.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (236, 12, 2, CAST(450.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (237, 19, 2, CAST(670.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (238, 20, 2, CAST(3800.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (239, 6, 3, CAST(8420.30 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (240, 14, 3, CAST(2100.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (241, 21, 3, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (242, 7, 1, CAST(3250.75 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (243, 8, 1, CAST(4120.50 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (244, 15, 1, CAST(750.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (245, 16, 1, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (246, 17, 1, CAST(230.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (247, 18, 1, CAST(45.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (248, 7, 5, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (249, 15, 5, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (250, 16, 5, CAST(2900.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (251, 22, 5, CAST(2200.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (252, 23, 5, CAST(3100.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (253, 9, 6, CAST(560.25 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (254, 17, 6, CAST(430.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (255, 24, 6, CAST(520.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (256, 10, 4, CAST(120.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (257, 18, 4, CAST(85.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (258, 25, 4, CAST(45.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:02:13.647' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (259, 1, 2, CAST(1301.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (260, 2, 2, CAST(3540.75 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (261, 3, 2, CAST(780.25 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (262, 4, 2, CAST(5230.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (263, 5, 2, CAST(950.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (264, 11, 2, CAST(980.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (265, 12, 2, CAST(450.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (266, 19, 2, CAST(670.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (267, 20, 2, CAST(3800.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (268, 6, 3, CAST(8420.30 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (269, 14, 3, CAST(2100.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (270, 21, 3, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (271, 7, 1, CAST(3250.75 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (272, 8, 1, CAST(4120.50 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (273, 15, 1, CAST(750.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (274, 16, 1, CAST(1200.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (275, 17, 1, CAST(230.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (276, 18, 1, CAST(45.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (277, 7, 5, CAST(1500.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (278, 15, 5, CAST(1800.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (279, 16, 5, CAST(2900.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (280, 22, 5, CAST(2200.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Alta')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (281, 23, 5, CAST(3100.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (282, 9, 6, CAST(560.25 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (283, 17, 6, CAST(430.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (284, 24, 6, CAST(520.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Baja')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (285, 10, 4, CAST(120.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (286, 18, 4, CAST(85.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
INSERT [dbo].[Inventario] ([ID_Registro], [ID_Tipo], [ID_Almacen], [Cantidad], [Fecha_Actualizacion], [Calidad]) VALUES (287, 25, 4, CAST(45.00 AS Decimal(10, 2)), CAST(N'2025-07-10T20:21:21.303' AS DateTime), N'Media')
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Movimientos] ON 

INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (372, 1, CAST(50.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 1, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (373, 2, CAST(450.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 4, 2, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (374, 3, CAST(34.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 3, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (375, 4, CAST(5230.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 4, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (376, 6, CAST(8420.30 AS Decimal(10, 2)), N'Entrada', NULL, 3, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 5, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (377, 5, CAST(250.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 5, 6, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (378, 7, CAST(700.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 7, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (379, 8, CAST(120.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 8, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (380, 9, CAST(900.00 AS Decimal(10, 2)), N'Entrada', NULL, 6, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 6, 9, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (381, 10, CAST(350.00 AS Decimal(10, 2)), N'Entrada', NULL, 4, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 10, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (382, 11, CAST(450.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 11, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (383, 12, CAST(1650.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 4, 12, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (384, 13, CAST(300.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 13, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (385, 14, CAST(200.00 AS Decimal(10, 2)), N'Entrada', NULL, 3, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 14, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (386, 15, CAST(500.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 5, 15, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (387, 16, CAST(400.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 16, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (388, 17, CAST(350.00 AS Decimal(10, 2)), N'Entrada', NULL, 6, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 17, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (389, 18, CAST(600.00 AS Decimal(10, 2)), N'Entrada', NULL, 4, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 6, 18, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (390, 19, CAST(900.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 19, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (391, 20, CAST(150.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 20, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (392, 1, CAST(1000.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 1, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (393, 3, CAST(450.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 1, 2, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (394, 2, CAST(506.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 3, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (395, 1, CAST(1200.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 4, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (396, 3, CAST(300.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 4, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (397, 4, CAST(250.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 5, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (398, 5, CAST(350.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 5, 6, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (399, 6, CAST(500.00 AS Decimal(10, 2)), N'Salida', 3, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 7, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (400, 7, CAST(300.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 8, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (401, 8, CAST(700.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 6, 9, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (402, 9, CAST(400.00 AS Decimal(10, 2)), N'Salida', 6, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 10, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (403, 10, CAST(750.00 AS Decimal(10, 2)), N'Salida', 4, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 11, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (404, 11, CAST(250.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 4, 12, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (405, 12, CAST(450.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 13, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (406, 13, CAST(600.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 14, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (407, 14, CAST(350.00 AS Decimal(10, 2)), N'Salida', 3, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 5, 15, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (408, 15, CAST(200.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 16, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (409, 16, CAST(700.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 17, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (410, 17, CAST(300.00 AS Decimal(10, 2)), N'Salida', 6, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 6, 18, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (411, 18, CAST(500.00 AS Decimal(10, 2)), N'Salida', 4, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 2, 19, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (412, 19, CAST(400.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:02:13.687' AS DateTime), 3, 20, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (413, 1, CAST(50.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 1, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (414, 2, CAST(450.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 4, 2, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (415, 3, CAST(34.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 3, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (416, 4, CAST(5230.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 4, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (417, 6, CAST(8420.30 AS Decimal(10, 2)), N'Entrada', NULL, 3, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 5, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (418, 5, CAST(250.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 5, 6, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (419, 7, CAST(700.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 7, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (420, 8, CAST(120.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 8, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (421, 9, CAST(900.00 AS Decimal(10, 2)), N'Entrada', NULL, 6, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 6, 9, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (422, 10, CAST(350.00 AS Decimal(10, 2)), N'Entrada', NULL, 4, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 10, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (423, 11, CAST(450.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 11, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (424, 12, CAST(1650.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 4, 12, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (425, 13, CAST(300.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 13, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (426, 14, CAST(200.00 AS Decimal(10, 2)), N'Entrada', NULL, 3, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 14, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (427, 15, CAST(500.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 5, 15, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (428, 16, CAST(400.00 AS Decimal(10, 2)), N'Entrada', NULL, 5, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 16, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (429, 17, CAST(350.00 AS Decimal(10, 2)), N'Entrada', NULL, 6, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 17, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (430, 18, CAST(600.00 AS Decimal(10, 2)), N'Entrada', NULL, 4, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 6, 18, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (431, 19, CAST(900.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 19, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (432, 20, CAST(150.00 AS Decimal(10, 2)), N'Entrada', NULL, 2, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 20, N'Compra', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (433, 1, CAST(1000.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 1, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (434, 3, CAST(450.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 1, 2, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (435, 2, CAST(506.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 3, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (436, 1, CAST(1200.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 4, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (437, 3, CAST(300.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 4, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (438, 4, CAST(250.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 5, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (439, 5, CAST(350.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 5, 6, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (440, 6, CAST(500.00 AS Decimal(10, 2)), N'Salida', 3, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 7, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (441, 7, CAST(300.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 8, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (442, 8, CAST(700.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 6, 9, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (443, 9, CAST(400.00 AS Decimal(10, 2)), N'Salida', 6, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 10, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (444, 10, CAST(750.00 AS Decimal(10, 2)), N'Salida', 4, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 11, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (445, 11, CAST(250.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 4, 12, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (446, 12, CAST(450.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 13, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (447, 13, CAST(600.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 14, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (448, 14, CAST(350.00 AS Decimal(10, 2)), N'Salida', 3, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 5, 15, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (449, 15, CAST(200.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 16, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (450, 16, CAST(700.00 AS Decimal(10, 2)), N'Salida', 5, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 17, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (451, 17, CAST(300.00 AS Decimal(10, 2)), N'Salida', 6, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 6, 18, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (452, 18, CAST(500.00 AS Decimal(10, 2)), N'Salida', 4, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 2, 19, N'Venta', NULL)
INSERT [dbo].[Movimientos] ([ID_Movimiento], [ID_Tipo], [Cantidad], [Tipo], [ID_Origen], [ID_Destino], [Fecha], [ID_Usuario], [ID_Transaccion], [Tipo_Transaccion], [Observaciones]) VALUES (453, 19, CAST(400.00 AS Decimal(10, 2)), N'Salida', 2, NULL, CAST(N'2025-07-10T20:21:21.357' AS DateTime), 3, 20, N'Venta', NULL)
SET IDENTITY_INSERT [dbo].[Movimientos] OFF
GO
SET IDENTITY_INSERT [dbo].[Tipos_Material] ON 

INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (1, N'Cobre limpio', N'Metal', N'Cable de cobre sin forro', CAST(89.78 AS Decimal(8, 2)), CAST(126.00 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (2, N'Aluminio', N'Metal', N'Latas de aluminio compactadas', CAST(12.60 AS Decimal(8, 2)), CAST(19.43 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (3, N'Bronce', N'Metal', N'Trozos de bronce limpio', CAST(47.25 AS Decimal(8, 2)), CAST(68.25 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (4, N'Acero inoxidable', N'Metal', N'Desechos de acero inoxidable', CAST(8.40 AS Decimal(8, 2)), CAST(13.13 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (5, N'Plomo', N'Metal', N'Plomo limpio', CAST(5.78 AS Decimal(8, 2)), CAST(8.40 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (6, N'PET', N'Plástico', N'Botellas de plástico PET', CAST(2.63 AS Decimal(8, 2)), CAST(4.20 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (7, N'Vidrio transparente', N'Vidrio', N'Vidrio sin color', CAST(0.84 AS Decimal(8, 2)), CAST(1.58 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (8, N'Cartón', N'Papel', N'Cartón corrugado limpio', CAST(1.26 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (9, N'Electrónicos', N'Electrónico', N'Circuitos y componentes electrónicos', CAST(15.75 AS Decimal(8, 2)), CAST(26.25 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (10, N'Baterías de auto', N'Otro', N'Baterías usadas de automóvil', CAST(3.68 AS Decimal(8, 2)), CAST(6.30 AS Decimal(8, 2)), N'Unidad')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (11, N'Cobre mixto', N'Metal', N'Cable de cobre con forro', CAST(68.25 AS Decimal(8, 2)), CAST(99.75 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (12, N'Aluminio perfil', N'Metal', N'Perfiles de aluminio limpios', CAST(18.90 AS Decimal(8, 2)), CAST(26.25 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (13, N'Zinc', N'Metal', N'Desechos de zinc', CAST(4.73 AS Decimal(8, 2)), CAST(7.35 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (14, N'HDPE', N'Plástico', N'Plástico duro (tapas, envases)', CAST(3.15 AS Decimal(8, 2)), CAST(5.25 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (15, N'Vidrio verde', N'Vidrio', N'Vidrio de color verde', CAST(0.74 AS Decimal(8, 2)), CAST(1.37 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (16, N'Papel blanco', N'Papel', N'Papel de oficina limpio', CAST(1.58 AS Decimal(8, 2)), CAST(2.63 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (17, N'Circuitos electrónicos', N'Electrónico', N'Placas base y componentes', CAST(21.00 AS Decimal(8, 2)), CAST(36.75 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (18, N'Baterías industriales', N'Otro', N'Baterías grandes de maquinaria', CAST(5.25 AS Decimal(8, 2)), CAST(9.45 AS Decimal(8, 2)), N'Unidad')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (19, N'Latón', N'Metal', N'Desechos de latón limpio', CAST(39.90 AS Decimal(8, 2)), CAST(57.75 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (20, N'Acero al carbono', N'Metal', N'Chatarra de acero común', CAST(6.30 AS Decimal(8, 2)), CAST(9.45 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (21, N'LDPE', N'Plástico', N'Plástico blando (bolsas, film)', CAST(1.89 AS Decimal(8, 2)), CAST(3.15 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (22, N'Vidrio ámbar', N'Vidrio', N'Vidrio de color café', CAST(0.79 AS Decimal(8, 2)), CAST(1.47 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (23, N'Periódico', N'Papel', N'Papel de periódico limpio', CAST(1.05 AS Decimal(8, 2)), CAST(1.89 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (24, N'Cables varios', N'Electrónico', N'Cables de diferentes metales', CAST(12.60 AS Decimal(8, 2)), CAST(21.00 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (25, N'Motores eléctricos', N'Otro', N'Motores usados desarmados', CAST(7.35 AS Decimal(8, 2)), CAST(12.60 AS Decimal(8, 2)), N'Unidad')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (26, N'Fierro', N'Metal', N'Fierro reciclado', CAST(1.26 AS Decimal(8, 2)), CAST(2.10 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (27, N'Aluminio', N'Metal', N'Aluminio puro', CAST(3.15 AS Decimal(8, 2)), CAST(4.73 AS Decimal(8, 2)), N'Kg')
INSERT [dbo].[Tipos_Material] ([ID_Tipo], [Nombre], [Categoria], [Descripcion], [Precio_Compra_Kg], [Precio_Venta_Kg], [Unidad]) VALUES (28, N'Plástico', N'Plástico', N'Plástico duro', CAST(0.84 AS Decimal(8, 2)), CAST(1.26 AS Decimal(8, 2)), N'Kg')
SET IDENTITY_INSERT [dbo].[Tipos_Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (1, CAST(N'2023-01-11T10:30:00.000' AS DateTime), 6, 3, CAST(18000.00 AS Decimal(12, 2)), CAST(1000.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-001')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (2, CAST(N'2023-01-14T13:45:00.000' AS DateTime), 4, 1, CAST(8325.00 AS Decimal(12, 2)), CAST(450.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-002')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (3, CAST(N'2023-01-17T15:20:00.000' AS DateTime), 7, 3, CAST(12650.00 AS Decimal(12, 2)), CAST(506.00 AS Decimal(10, 2)), N'Completada', 0, NULL)
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (4, CAST(N'2023-01-19T09:30:00.000' AS DateTime), 6, 2, CAST(24000.00 AS Decimal(12, 2)), CAST(1500.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-003')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (5, CAST(N'2023-01-22T11:15:00.000' AS DateTime), 4, 3, CAST(4875.00 AS Decimal(12, 2)), CAST(250.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-004')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (6, CAST(N'2023-02-08T10:45:00.000' AS DateTime), 21, 5, CAST(9450.00 AS Decimal(12, 2)), CAST(350.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-005')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (7, CAST(N'2023-02-12T14:20:00.000' AS DateTime), 22, 2, CAST(13500.00 AS Decimal(12, 2)), CAST(500.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-006')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (8, CAST(N'2023-02-16T11:30:00.000' AS DateTime), 23, 3, CAST(8100.00 AS Decimal(12, 2)), CAST(300.00 AS Decimal(10, 2)), N'Completada', 0, NULL)
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (9, CAST(N'2023-02-20T16:15:00.000' AS DateTime), 24, 6, CAST(18900.00 AS Decimal(12, 2)), CAST(700.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-007')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (10, CAST(N'2023-02-24T09:45:00.000' AS DateTime), 25, 2, CAST(10800.00 AS Decimal(12, 2)), CAST(400.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-008')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (11, CAST(N'2023-03-01T13:10:00.000' AS DateTime), 26, 3, CAST(15750.00 AS Decimal(12, 2)), CAST(750.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-009')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (12, CAST(N'2023-03-05T10:20:00.000' AS DateTime), 27, 4, CAST(6750.00 AS Decimal(12, 2)), CAST(250.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-010')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (13, CAST(N'2023-03-09T15:30:00.000' AS DateTime), 28, 2, CAST(12150.00 AS Decimal(12, 2)), CAST(450.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-011')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (14, CAST(N'2023-03-13T11:45:00.000' AS DateTime), 29, 3, CAST(16200.00 AS Decimal(12, 2)), CAST(600.00 AS Decimal(10, 2)), N'Completada', 0, NULL)
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (15, CAST(N'2023-03-17T14:15:00.000' AS DateTime), 30, 5, CAST(9450.00 AS Decimal(12, 2)), CAST(350.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-012')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (16, CAST(N'2023-03-21T10:30:00.000' AS DateTime), 21, 2, CAST(5400.00 AS Decimal(12, 2)), CAST(200.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-013')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (17, CAST(N'2023-03-25T13:50:00.000' AS DateTime), 22, 3, CAST(18900.00 AS Decimal(12, 2)), CAST(700.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-014')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (18, CAST(N'2023-03-29T09:20:00.000' AS DateTime), 23, 6, CAST(8100.00 AS Decimal(12, 2)), CAST(300.00 AS Decimal(10, 2)), N'Completada', 0, NULL)
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (19, CAST(N'2023-04-02T15:40:00.000' AS DateTime), 24, 2, CAST(13500.00 AS Decimal(12, 2)), CAST(500.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-015')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (20, CAST(N'2023-04-06T11:10:00.000' AS DateTime), 25, 3, CAST(10800.00 AS Decimal(12, 2)), CAST(400.00 AS Decimal(10, 2)), N'Completada', 1, N'FAC-2023-016')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (21, CAST(N'2025-07-11T01:28:32.960' AS DateTime), 1, 1, CAST(500.00 AS Decimal(12, 2)), CAST(250.00 AS Decimal(10, 2)), N'Completada', 1, N'F001-000123')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (22, CAST(N'2025-07-11T01:28:32.967' AS DateTime), 2, 2, CAST(300.00 AS Decimal(12, 2)), CAST(200.00 AS Decimal(10, 2)), N'Completada', 1, N'F001-000124')
INSERT [dbo].[Ventas] ([ID_Venta], [Fecha], [ID_Cliente], [ID_Empleado], [Monto_Total], [Peso_Total], [Estado], [Facturado], [Numero_Factura]) VALUES (23, CAST(N'2025-07-11T17:34:59.857' AS DateTime), 1, 1, CAST(420.00 AS Decimal(12, 2)), CAST(210.00 AS Decimal(10, 2)), N'Completada', 0, NULL)
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 1, 1, N'Cobre limpio', CAST(2450.00 AS Decimal(10, 2)), CAST(264500.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 1, 2, N'Aluminio', CAST(716.00 AS Decimal(10, 2)), CAST(10306.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 1, 3, N'Bronce', CAST(950.00 AS Decimal(10, 2)), CAST(48990.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 1, 4, N'Acero inoxidable', CAST(250.00 AS Decimal(10, 2)), CAST(3125.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 2, 5, N'Plomo', CAST(350.00 AS Decimal(10, 2)), CAST(2800.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 2, 6, N'PET', CAST(500.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 2, 7, N'Vidrio transparente', CAST(300.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 2, 8, N'Cartón', CAST(700.00 AS Decimal(10, 2)), CAST(1400.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 2, 9, N'Electrónicos', CAST(400.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 10, N'Baterías de auto', CAST(750.00 AS Decimal(10, 2)), CAST(4500.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 11, N'Cobre mixto', CAST(250.00 AS Decimal(10, 2)), CAST(23750.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 12, N'Aluminio perfil', CAST(450.00 AS Decimal(10, 2)), CAST(11250.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 13, N'Zinc', CAST(600.00 AS Decimal(10, 2)), CAST(4200.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 14, N'HDPE', CAST(350.00 AS Decimal(10, 2)), CAST(1750.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 15, N'Vidrio verde', CAST(200.00 AS Decimal(10, 2)), CAST(260.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 16, N'Papel blanco', CAST(700.00 AS Decimal(10, 2)), CAST(1750.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 3, 17, N'Circuitos electrónicos', CAST(300.00 AS Decimal(10, 2)), CAST(10500.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 4, 18, N'Baterías industriales', CAST(500.00 AS Decimal(10, 2)), CAST(4500.00 AS Decimal(12, 2)))
INSERT [dbo].[Ventas_Agregadas] ([Anio], [Mes], [ID_Tipo], [Tipo_Material], [Total_Kg], [Total_Venta]) VALUES (2023, 4, 19, N'Latón', CAST(400.00 AS Decimal(10, 2)), CAST(22000.00 AS Decimal(12, 2)))
GO
/****** Object:  Index [IX_Ventas_Empleado]    Script Date: 12/07/2025 21:21:31 ******/
CREATE NONCLUSTERED INDEX [IX_Ventas_Empleado] ON [dbo].[Ventas]
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [Fecha_Registro]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Compras] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Compras] ADD  DEFAULT ('Completada') FOR [Estado]
GO
ALTER TABLE [dbo].[Empleados] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Inventario] ADD  DEFAULT (getdate()) FOR [Fecha_Actualizacion]
GO
ALTER TABLE [dbo].[Inventario] ADD  DEFAULT ('Media') FOR [Calidad]
GO
ALTER TABLE [dbo].[Movimientos] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Tipos_Material] ADD  DEFAULT ('Kg') FOR [Unidad]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ('Completada') FOR [Estado]
GO
ALTER TABLE [dbo].[Ventas] ADD  DEFAULT ((0)) FOR [Facturado]
GO
ALTER TABLE [dbo].[Almacenes]  WITH CHECK ADD FOREIGN KEY([Responsable])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Almacenes]  WITH CHECK ADD FOREIGN KEY([Responsable])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Almacenes] ([ID_Almacen])
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Almacenes] ([ID_Almacen])
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD FOREIGN KEY([ID_Compra])
REFERENCES [dbo].[Compras] ([ID_Compra])
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD FOREIGN KEY([ID_Compra])
REFERENCES [dbo].[Compras] ([ID_Compra])
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Almacenes] ([ID_Almacen])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Almacenes] ([ID_Almacen])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID_Venta])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID_Venta])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Almacenes] ([ID_Almacen])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Almacen])
REFERENCES [dbo].[Almacenes] ([ID_Almacen])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD FOREIGN KEY([ID_Tipo])
REFERENCES [dbo].[Tipos_Material] ([ID_Tipo])
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD CHECK  (([Tipo]='Comercio' OR [Tipo]='Empresa' OR [Tipo]='Particular'))
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD CHECK  (([Tipo]='Comercio' OR [Tipo]='Empresa' OR [Tipo]='Particular'))
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD CHECK  (([Estado]='Cancelada' OR [Estado]='Completada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD CHECK  (([Estado]='Cancelada' OR [Estado]='Completada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[Detalle_Compras]  WITH CHECK ADD  CONSTRAINT [CK_DetalleCompras_Peso] CHECK  (([Peso]>(0)))
GO
ALTER TABLE [dbo].[Detalle_Compras] CHECK CONSTRAINT [CK_DetalleCompras_Peso]
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD  CONSTRAINT [CK_DetalleVentas_Peso] CHECK  (([Peso]>(0)))
GO
ALTER TABLE [dbo].[Detalle_Ventas] CHECK CONSTRAINT [CK_DetalleVentas_Peso]
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD  CONSTRAINT [CK_Peso_Venta] CHECK  (([Peso]>(0)))
GO
ALTER TABLE [dbo].[Detalle_Ventas] CHECK CONSTRAINT [CK_Peso_Venta]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [CK_Empleados_Puesto] CHECK  (([Puesto]='Supervisor' OR [Puesto]='Administrativo' OR [Puesto]='Comercial' OR [Puesto]='Conductor' OR [Puesto]='Operario' OR [Puesto]='Gerente'))
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [CK_Empleados_Puesto]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD CHECK  (([Calidad]='Baja' OR [Calidad]='Media' OR [Calidad]='Alta'))
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD CHECK  (([Calidad]='Baja' OR [Calidad]='Media' OR [Calidad]='Alta'))
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD CHECK  (([Tipo_Transaccion]='Interno' OR [Tipo_Transaccion]='Venta' OR [Tipo_Transaccion]='Compra'))
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD CHECK  (([Tipo_Transaccion]='Interno' OR [Tipo_Transaccion]='Venta' OR [Tipo_Transaccion]='Compra'))
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD CHECK  (([Tipo]='Ajuste' OR [Tipo]='Transferencia' OR [Tipo]='Salida' OR [Tipo]='Entrada'))
GO
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD CHECK  (([Tipo]='Ajuste' OR [Tipo]='Transferencia' OR [Tipo]='Salida' OR [Tipo]='Entrada'))
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD CHECK  (([Categoria]='Otro' OR [Categoria]='Electrónico' OR [Categoria]='Papel' OR [Categoria]='Vidrio' OR [Categoria]='Plástico' OR [Categoria]='Metal'))
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD CHECK  (([Categoria]='Otro' OR [Categoria]='Electrónico' OR [Categoria]='Papel' OR [Categoria]='Vidrio' OR [Categoria]='Plástico' OR [Categoria]='Metal'))
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD CHECK  (([Unidad]='Unidad' OR [Unidad]='Tonelada' OR [Unidad]='Kg'))
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD CHECK  (([Unidad]='Unidad' OR [Unidad]='Tonelada' OR [Unidad]='Kg'))
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD  CONSTRAINT [CK_Precio_Compra] CHECK  (([Precio_Compra_Kg]>(0)))
GO
ALTER TABLE [dbo].[Tipos_Material] CHECK CONSTRAINT [CK_Precio_Compra]
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD  CONSTRAINT [CK_Precio_Venta] CHECK  (([Precio_Venta_Kg]>(0)))
GO
ALTER TABLE [dbo].[Tipos_Material] CHECK CONSTRAINT [CK_Precio_Venta]
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD  CONSTRAINT [CK_TipoMaterial_PrecioCompra] CHECK  (([Precio_Compra_Kg]>(0)))
GO
ALTER TABLE [dbo].[Tipos_Material] CHECK CONSTRAINT [CK_TipoMaterial_PrecioCompra]
GO
ALTER TABLE [dbo].[Tipos_Material]  WITH CHECK ADD  CONSTRAINT [CK_TipoMaterial_PrecioVenta] CHECK  (([Precio_Venta_Kg]>(0)))
GO
ALTER TABLE [dbo].[Tipos_Material] CHECK CONSTRAINT [CK_TipoMaterial_PrecioVenta]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD CHECK  (([Estado]='Cancelada' OR [Estado]='Completada' OR [Estado]='Pendiente'))
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD CHECK  (([Estado]='Cancelada' OR [Estado]='Completada' OR [Estado]='Pendiente'))
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarPrecios]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarPrecios]
    @PorcentajeAumento DECIMAL(5,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE Tipos_Material
        SET Precio_Compra_Kg = Precio_Compra_Kg * (1 + @PorcentajeAumento/100),
            Precio_Venta_Kg = Precio_Venta_Kg * (1 + @PorcentajeAumento/100);
        
        COMMIT TRANSACTION;
        
        SELECT 'Precios actualizados exitosamente' AS Mensaje;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT 'Error: ' + ERROR_MESSAGE() AS Mensaje;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AlertasStock2]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AlertasStock2]
AS
BEGIN
    SELECT 
        tm.Nombre AS Material,
        a.Nombre AS Almacen,
        i.Cantidad AS Stock_Actual,
        'N/A' AS Stock_Mínimo,
        CASE 
            WHEN i.Cantidad < 100 THEN 'CRÍTICO'
            WHEN i.Cantidad < 150 THEN 'BAJO'
            ELSE 'OK'
        END AS Estado
    FROM Inventario i
    INNER JOIN Tipos_Material tm ON i.ID_Tipo = tm.ID_Tipo
    INNER JOIN Almacenes a ON i.ID_Almacen = a.ID_Almacen
    WHERE i.Cantidad < 150
    ORDER BY Estado, i.Cantidad;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarComprasETL]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_CargarComprasETL]
AS
BEGIN
    SET NOCOUNT ON;

    -- Limpiar tabla
    DELETE FROM dbo.Compras_Agregadas;

    -- Cargar datos agrupados por año, mes y tipo
    INSERT INTO dbo.Compras_Agregadas (Anio, Mes, ID_Tipo, Tipo_Material, Total_Kg, Total_Compra)
    SELECT 
        YEAR(Fecha) AS Anio,
        MONTH(Fecha) AS Mes,
        ID_Tipo,
        Tipo_Material,
        SUM(Peso) AS Total_Kg,
        SUM(Subtotal) AS Total_Compra
    FROM VW_Compras_Expandida
    GROUP BY YEAR(Fecha), MONTH(Fecha), ID_Tipo, Tipo_Material;

    PRINT '? ETL de compras completado con éxito';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CargarTodoETL]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CargarTodoETL]
AS
BEGIN
    EXEC sp_CargarVentasETL;
    EXEC sp_CargarComprasETL;
    PRINT '? ETL completo ejecutado correctamente';
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_CargarVentasETL]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_CargarVentasETL]
AS
BEGIN
    SET NOCOUNT ON;

    -- Paso 1: Vaciar la tabla de carga
    DELETE FROM dbo.Ventas_Agregadas;

    -- Paso 2: Insertar datos agrupados por año, mes, tipo
    INSERT INTO dbo.Ventas_Agregadas (Anio, Mes, ID_Tipo, Tipo_Material, Total_Kg, Total_Venta)
    SELECT 
        YEAR(Fecha) AS Anio,
        MONTH(Fecha) AS Mes,
        ID_Tipo,
        Tipo_Material,
        SUM(Peso) AS Total_Kg,
        SUM(Subtotal) AS Total_Venta
    FROM VW_Ventas_Expandida
    GROUP BY YEAR(Fecha), MONTH(Fecha), ID_Tipo, Tipo_Material;

    PRINT '? ETL completado con éxito';
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerVentasPorEmpleado]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerVentasPorEmpleado]
    @ID_Empleado INT,
    @FechaInicio DATE = NULL,
    @FechaFin DATE = NULL
AS
BEGIN
    IF @FechaInicio IS NULL SET @FechaInicio = DATEADD(MONTH, -1, GETDATE())
    IF @FechaFin IS NULL SET @FechaFin = GETDATE()
    
    SELECT 
        v.ID_Venta,
        v.Fecha,
        v.MontoTotal,
        c.Nombre AS Cliente,
        COUNT(dv.ID_Detalle) AS CantidadProductos
    FROM Ventas v
    JOIN Clientes c ON v.ID_Cliente = c.ID_Cliente
    JOIN DetalleVentas dv ON v.ID_Venta = dv.ID_Venta
    WHERE v.ID_Empleado = @ID_Empleado
    AND v.Fecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY v.ID_Venta, v.Fecha, v.MontoTotal, c.Nombre
    ORDER BY v.Fecha DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCompra]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarCompra]
    @ID_Cliente INT,
    @ID_Empleado INT,
    @Detalles DetalleCompraType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Insertar la cabecera de compra
        DECLARE @ID_Compra INT;
        DECLARE @MontoTotal DECIMAL(12,2) = 0;
        DECLARE @PesoTotal DECIMAL(10,2) = 0;
        
        SELECT 
            @MontoTotal = SUM(Precio_Kg * Peso),
            @PesoTotal = SUM(Peso) 
        FROM @Detalles;
        
        INSERT INTO Compras (
            Fecha, 
            ID_Cliente, 
            ID_Empleado, 
            Monto_Total, 
            Peso_Total, 
            Estado
        )
        VALUES (
            GETDATE(), 
            @ID_Cliente, 
            @ID_Empleado, 
            @MontoTotal, 
            @PesoTotal, 
            'Completada'
        );
        
        SET @ID_Compra = SCOPE_IDENTITY();
        
        -- Insertar los detalles
        INSERT INTO Detalle_Compras (
            ID_Compra, 
            ID_Tipo, 
            Peso, 
            Precio_Kg, 
            ID_Almacen
        )
        SELECT 
            @ID_Compra, 
            ID_Tipo, 
            Peso, 
            Precio_Kg, 
            ID_Almacen 
        FROM @Detalles;
        
        -- Actualizar inventario
        UPDATE i
        SET i.Cantidad = i.Cantidad + d.Peso
        FROM Inventario i
        INNER JOIN @Detalles d ON i.ID_Tipo = d.ID_Tipo AND i.ID_Almacen = d.ID_Almacen;
        
        COMMIT TRANSACTION;
        
        SELECT 'Compra registrada exitosamente' AS Mensaje, @ID_Compra AS ID_Compra;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT 
            'Error al registrar compra: ' + ERROR_MESSAGE() AS Mensaje,
            ERROR_NUMBER() AS CodigoError,
            ERROR_LINE() AS LineaError;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCompraSimple]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegistrarCompraSimple]
    @ID_Cliente INT,
    @ID_Empleado INT,
    @DetallesXML XML  -- Usamos XML en lugar de tipo de tabla
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        BEGIN TRANSACTION;
        
        -- Insertar la cabecera de compra
        DECLARE @ID_Compra INT;
        DECLARE @MontoTotal DECIMAL(12,2) = 0;
        DECLARE @PesoTotal DECIMAL(10,2) = 0;
        
        -- Calcular totales desde XML
        SELECT 
            @MontoTotal = SUM(detalle.value('(Precio_Kg)[1]', 'DECIMAL(8,2)') * 
                             detalle.value('(Peso)[1]', 'DECIMAL(10,2)')),
            @PesoTotal = SUM(detalle.value('(Peso)[1]', 'DECIMAL(10,2)'))
        FROM @DetallesXML.nodes('/Detalles/Detalle') AS T(detalle);
        
        INSERT INTO Compras (
            Fecha, 
            ID_Cliente, 
            ID_Empleado, 
            Monto_Total, 
            Peso_Total, 
            Estado
        )
        VALUES (
            GETDATE(), 
            @ID_Cliente, 
            @ID_Empleado, 
            @MontoTotal, 
            @PesoTotal, 
            'Completada'
        );
        
        SET @ID_Compra = SCOPE_IDENTITY();
        
        -- Insertar los detalles desde XML
        INSERT INTO Detalle_Compras (
            ID_Compra, 
            ID_Tipo, 
            Peso, 
            Precio_Kg, 
            ID_Almacen
        )
        SELECT 
            @ID_Compra, 
            detalle.value('(ID_Tipo)[1]', 'INT'),
            detalle.value('(Peso)[1]', 'DECIMAL(10,2)'),
            detalle.value('(Precio_Kg)[1]', 'DECIMAL(8,2)'),
            detalle.value('(ID_Almacen)[1]', 'INT')
        FROM @DetallesXML.nodes('/Detalles/Detalle') AS T(detalle);
        
        -- Actualizar inventario desde XML
        UPDATE i
        SET i.Cantidad = i.Cantidad + d.Peso
        FROM Inventario i
        INNER JOIN (
            SELECT 
                detalle.value('(ID_Tipo)[1]', 'INT') AS ID_Tipo,
                detalle.value('(ID_Almacen)[1]', 'INT') AS ID_Almacen,
                detalle.value('(Peso)[1]', 'DECIMAL(10,2)') AS Peso
            FROM @DetallesXML.nodes('/Detalles/Detalle') AS T(detalle)
        ) d ON i.ID_Tipo = d.ID_Tipo AND i.ID_Almacen = d.ID_Almacen;
        
        COMMIT TRANSACTION;
        
        SELECT 'Compra registrada exitosamente' AS Mensaje, @ID_Compra AS ID_Compra;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        SELECT 
            'Error al registrar compra: ' + ERROR_MESSAGE() AS Mensaje,
            ERROR_NUMBER() AS CodigoError,
            ERROR_LINE() AS LineaError;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ReporteMensual]    Script Date: 12/07/2025 21:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ReporteMensual]
    @Mes INT,
    @Año INT
AS
BEGIN
    SELECT 
        tm.Nombre AS Material,
        tm.Categoria,
        SUM(dc.Peso) AS Kg_Comprados,
        SUM(dc.Peso * dc.Precio_Kg) AS Total_Comprado,
        SUM(dv.Peso) AS Kg_Vendidos,
        SUM(dv.Peso * dv.Precio_Kg) AS Total_Vendido,
        SUM(dv.Peso * dv.Precio_Kg) - SUM(dc.Peso * dc.Precio_Kg) AS Margen
    FROM Tipos_Material tm
    LEFT JOIN Detalle_Compras dc ON tm.ID_Tipo = dc.ID_Tipo
    LEFT JOIN Compras c ON dc.ID_Compra = c.ID_Compra AND MONTH(c.Fecha) = @Mes AND YEAR(c.Fecha) = @Año
    LEFT JOIN Detalle_Ventas dv ON tm.ID_Tipo = dv.ID_Tipo
    LEFT JOIN Ventas v ON dv.ID_Venta = v.ID_Venta AND MONTH(v.Fecha) = @Mes AND YEAR(v.Fecha) = @Año
    GROUP BY tm.Nombre, tm.Categoria
    ORDER BY Margen DESC;
END;
GO
USE [master]
GO
ALTER DATABASE [Recipackbase] SET  READ_WRITE 
GO
