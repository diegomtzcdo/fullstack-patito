USE master;
CREATE LOGIN [pruebaP4] WITH PASSWORD = 'pruebaP4';

USE [patitoP4]
GO

-- Crear usuario
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'pruebaP4')
BEGIN
    CREATE USER [pruebaP4] FOR LOGIN [pruebaP4] WITH DEFAULT_SCHEMA=[dbo]
    ALTER ROLE [db_owner] ADD MEMBER [pruebaP4]
    ALTER ROLE [db_accessadmin] ADD MEMBER [pruebaP4]
    ALTER ROLE [db_securityadmin] ADD MEMBER [pruebaP4]
    ALTER ROLE [db_ddladmin] ADD MEMBER [pruebaP4]
    ALTER ROLE [db_backupoperator] ADD MEMBER [pruebaP4]
    ALTER ROLE [db_datareader] ADD MEMBER [pruebaP4]
    ALTER ROLE [db_datawriter] ADD MEMBER [pruebaP4]
    -- No añadir a los roles de negación de lectura y escritura
    -- ALTER ROLE [db_denydatareader] ADD MEMBER [pruebaP4]
    -- ALTER ROLE [db_denydatawriter] ADD MEMBER [pruebaP4]
END
GO

-- Crear tablas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cliente]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[cliente](
        [id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
		[fecha_actualizacion] [datetime] NOT NULL,
		[fecha_creacion] [datetime] NOT NULL,
		[direccion] [varchar](255) NULL,
		[email] [varchar](255) NULL,
		[nombre] [varchar](255) NULL,
		[password] [varchar](255) NULL,
		[telefono] [varchar](255) NULL,
        PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedido]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[pedido](
        [id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
		[fecha_actualizacion] [datetime] NOT NULL,
		[fecha_creacion] [datetime] NOT NULL,
		[accion] [varchar](255) NULL,
		[ip_usuario] [varchar](255) NULL,
		[estatus] [varchar](255) NULL,
		[cliente_id] [numeric](19, 0) NULL,
        PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pedido_producto]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[pedido_producto](
        [id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
        [cantidad] [int] NULL,
        [pedido_id] [numeric](19, 0) NULL,
        [producto_id] [numeric](19, 0) NULL,
        PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[producto](
        [id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
		[fecha_actualizacion] [datetime] NOT NULL,
		[fecha_creacion] [datetime] NOT NULL,
		[existencias] [int] NULL,
		[hawa] [varchar](255) NULL,
		[nombre] [varchar](255) NULL,
		[porcentaje_descuento] [float] NULL,
		[precio] [float] NULL,
		[vendedor_id] [numeric](19, 0) NULL,
        PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tienda]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[tienda](
        [id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
		[fecha_actualizacion] [datetime] NOT NULL,
		[fecha_creacion] [datetime] NOT NULL,
		[direccion] [varchar](255) NULL,
		[nombre] [varchar](255) NULL,
		[telefono] [varchar](255) NULL,
        PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vendedor]') AND type in (N'U'))
BEGIN
    CREATE TABLE [dbo].[vendedor](
        [id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
		[fecha_actualizacion] [datetime] NOT NULL,
		[fecha_creacion] [datetime] NOT NULL,
		[email] [varchar](255) NULL,
		[nombre] [varchar](255) NULL,
		[tienda_id] [numeric](19, 0) NULL,
        PRIMARY KEY CLUSTERED ([id] ASC)
    ) ON [PRIMARY]
END
GO

-- Inserciones de datos de ejemplo
SET IDENTITY_INSERT [dbo].[cliente] ON 
INSERT INTO [dbo].[cliente] ([id], [fecha_actualizacion], [fecha_creacion], [direccion], [email], [nombre], [password], [telefono]) VALUES 
(CAST(1 AS Numeric(19, 0)), CAST(N'2024-07-07T07:33:59.460' AS DateTime), CAST(N'2024-07-07T07:33:59.460' AS DateTime), N'Lagos de Moreno', N'cdodiegomtz+cliente@gmail.com', N'Diego Martinez', N'$2a$10$oq7S4Eg9diP9DoUQkJeY9.d2dJbCzCkPa7C6rIbIgy5Lf.9dy8y/2', N'45754125454')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO

SET IDENTITY_INSERT [dbo].[pedido] ON 
INSERT INTO [dbo].[pedido] ([id], [fecha_actualizacion], [fecha_creacion], [accion], [ip_usuario], [estatus], [cliente_id]) VALUES 
(CAST(1 AS Numeric(19, 0)), CAST(N'2024-07-07T09:09:46.777' AS DateTime), CAST(N'2024-07-07T07:35:42.927' AS DateTime), N'Creación Pedido', N'0:0:0:0:0:0:0:1', N'ENTREGADO', CAST(1 AS Numeric(19, 0))),
(CAST(2 AS Numeric(19, 0)), CAST(N'2024-07-07T09:22:18.530' AS DateTime), CAST(N'2024-07-07T09:10:05.930' AS DateTime), N'Creación Pedido', N'0:0:0:0:0:0:0:1', N'ENTREGADO', CAST(1 AS Numeric(19, 0))),
(CAST(3 AS Numeric(19, 0)), CAST(N'2024-07-08T07:51:14.893' AS DateTime), CAST(N'2024-07-07T10:21:37.450' AS DateTime), N'Creacion Pedido', N'0:0:0:0:0:0:0:1', N'ENTREGADO', CAST(1 AS Numeric(19, 0))),
(CAST(4 AS Numeric(19, 0)), CAST(N'2024-07-08T07:51:19.867' AS DateTime), CAST(N'2024-07-08T00:21:19.813' AS DateTime), N'Creacion Pedido', N'0:0:0:0:0:0:0:1', N'ENTREGADO', CAST(1 AS Numeric(19, 0))),
(CAST(5 AS Numeric(19, 0)), CAST(N'2024-07-08T07:51:26.140' AS DateTime), CAST(N'2024-07-08T00:23:10.760' AS DateTime), N'Creacion Pedido', N'0:0:0:0:0:0:0:1', N'ENTREGADO', CAST(1 AS Numeric(19, 0))),
(CAST(6 AS Numeric(19, 0)), CAST(N'2024-07-08T08:31:28.827' AS DateTime), CAST(N'2024-07-08T08:31:28.827' AS DateTime), N'Creacion Pedido', N'0:0:0:0:0:0:0:1', N'PENDIENTE', CAST(1 AS Numeric(19, 0))),
(CAST(7 AS Numeric(19, 0)), CAST(N'2024-07-08T09:00:09.713' AS DateTime), CAST(N'2024-07-08T09:00:09.713' AS DateTime), N'Creacion Pedido', N'0:0:0:0:0:0:0:1', N'PENDIENTE', CAST(1 AS Numeric(19, 0))),
(CAST(8 AS Numeric(19, 0)), CAST(N'2024-07-08T09:02:13.240' AS DateTime), CAST(N'2024-07-08T09:02:13.240' AS DateTime), N'Creacion Pedido', N'0:0:0:0:0:0:0:1', N'PENDIENTE', CAST(1 AS Numeric(19, 0)))
SET IDENTITY_INSERT [dbo].[pedido] OFF
GO

SET IDENTITY_INSERT [dbo].[pedido_producto] ON 
INSERT INTO [dbo].[pedido_producto] ([id], [cantidad], [pedido_id], [producto_id]) VALUES 
(CAST(1 AS Numeric(19, 0)), 10, CAST(1 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(2 AS Numeric(19, 0)), 10, CAST(2 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(3 AS Numeric(19, 0)), 10, CAST(3 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(4 AS Numeric(19, 0)), 80, CAST(4 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(5 AS Numeric(19, 0)), 80, CAST(5 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(6 AS Numeric(19, 0)), 1, CAST(6 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(7 AS Numeric(19, 0)), 2, CAST(7 AS Numeric(19, 0)), CAST(3 AS Numeric(19, 0))),
(CAST(8 AS Numeric(19, 0)), 1, CAST(7 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(9 AS Numeric(19, 0)), 1, CAST(8 AS Numeric(19, 0)), CAST(1 AS Numeric(19, 0))),
(CAST(10 AS Numeric(19, 0)), 1, CAST(8 AS Numeric(19, 0)), CAST(3 AS Numeric(19, 0)))
SET IDENTITY_INSERT [dbo].[pedido_producto] OFF
GO

SET IDENTITY_INSERT [dbo].[producto] ON 
INSERT INTO [dbo].[producto] ([id], [fecha_actualizacion], [fecha_creacion], [existencias], [hawa], [nombre], [porcentaje_descuento], [precio], [vendedor_id]) VALUES 
(CAST(1 AS Numeric(19, 0)), CAST(N'2024-07-07T07:34:11.020' AS DateTime), CAST(N'2024-07-07T07:34:11.020' AS DateTime), 20, N'LSLAS-239ASKL-232', N'camioneton 1', 15, 1500, CAST(1 AS Numeric(19, 0))),
(CAST(3 AS Numeric(19, 0)), CAST(N'2024-07-08T02:53:53.903' AS DateTime), CAST(N'2024-07-08T02:53:53.903' AS DateTime), 30, N'TTC-10TE-OT401', N'Trocota 10', 15, 25000, CAST(2 AS Numeric(19, 0)))
SET IDENTITY_INSERT [dbo].[producto] OFF
GO

SET IDENTITY_INSERT [dbo].[tienda] ON 
INSERT INTO [dbo].[tienda] ([id], [fecha_actualizacion], [fecha_creacion], [direccion], [nombre], [telefono]) VALUES 
(CAST(1 AS Numeric(19, 0)), CAST(N'2024-07-07T07:34:10.930' AS DateTime), CAST(N'2024-07-07T07:34:10.930' AS DateTime), N'La luna', N'Tienda 1', N'5464682135'),
(CAST(2 AS Numeric(19, 0)), CAST(N'2024-07-08T02:53:53.067' AS DateTime), CAST(N'2024-07-08T02:53:53.067' AS DateTime), N'La antartida', N'Tienda 2', N'51651651665')
SET IDENTITY_INSERT [dbo].[tienda] OFF
GO

SET IDENTITY_INSERT [dbo].[vendedor] ON 
INSERT INTO [dbo].[vendedor] ([id], [fecha_actualizacion], [fecha_creacion], [email], [nombre], [tienda_id]) VALUES 
(CAST(1 AS Numeric(19, 0)), CAST(N'2024-07-07T07:34:10.983' AS DateTime), CAST(N'2024-07-07T07:34:10.983' AS DateTime), N'real@amazon.com', N'Amazon', CAST(1 AS Numeric(19, 0))),
(CAST(2 AS Numeric(19, 0)), CAST(N'2024-07-08T02:53:53.793' AS DateTime), CAST(N'2024-07-08T02:53:53.793' AS DateTime), N'real@mercadolibre.com', N'MercadoLibre', CAST(2 AS Numeric(19, 0)))
SET IDENTITY_INSERT [dbo].[vendedor] OFF
GO

-- Añadir restricciones de unicidad
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cliente]') AND name = N'UK_hue2rluk9jd8jymj3h8ywcj95')
BEGIN
    ALTER TABLE [dbo].[cliente] ADD CONSTRAINT [UK_hue2rluk9jd8jymj3h8ywcj95] UNIQUE NONCLUSTERED ([email] ASC)
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[producto]') AND name = N'UK_obbb7sfqf7cs1ju3flvbyp8as')
BEGIN
    ALTER TABLE [dbo].[producto] ADD CONSTRAINT [UK_obbb7sfqf7cs1ju3flvbyp8as] UNIQUE NONCLUSTERED ([hawa] ASC)
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tienda]') AND name = N'UK_sevfuo61alvh4tm231jm4ul1r')
BEGIN
    ALTER TABLE [dbo].[tienda] ADD CONSTRAINT [UK_sevfuo61alvh4tm231jm4ul1r] UNIQUE NONCLUSTERED ([nombre] ASC)
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[vendedor]') AND name = N'UK_hwt98yh0cjloegvqewa7aruut')
BEGIN
    ALTER TABLE [dbo].[vendedor] ADD CONSTRAINT [UK_hwt98yh0cjloegvqewa7aruut] UNIQUE NONCLUSTERED ([email] ASC)
END
GO

-- Añadir claves foráneas
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK30s8j2ktpay6of18lbyqn3632]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedido]'))
BEGIN
    ALTER TABLE [dbo].[pedido] WITH CHECK ADD CONSTRAINT [FK30s8j2ktpay6of18lbyqn3632] FOREIGN KEY([cliente_id])
    REFERENCES [dbo].[cliente] ([id])
END
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [FK30s8j2ktpay6of18lbyqn3632]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK7uyg0ynfe4wadl7ha9bmtynvm]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedido_producto]'))
BEGIN
    ALTER TABLE [dbo].[pedido_producto] WITH CHECK ADD CONSTRAINT [FK7uyg0ynfe4wadl7ha9bmtynvm] FOREIGN KEY([pedido_id])
    REFERENCES [dbo].[pedido] ([id])
END
GO
ALTER TABLE [dbo].[pedido_producto] CHECK CONSTRAINT [FK7uyg0ynfe4wadl7ha9bmtynvm]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FKl9lfd6a7bi0o5qn2f3epfbpin]') AND parent_object_id = OBJECT_ID(N'[dbo].[pedido_producto]'))
BEGIN
    ALTER TABLE [dbo].[pedido_producto] WITH CHECK ADD CONSTRAINT [FKl9lfd6a7bi0o5qn2f3epfbpin] FOREIGN KEY([producto_id])
    REFERENCES [dbo].[producto] ([id])
END
GO
ALTER TABLE [dbo].[pedido_producto] CHECK CONSTRAINT [FKl9lfd6a7bi0o5qn2f3epfbpin]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FKba49dxcp4ftf7hg7e3jcgx62l]') AND parent_object_id = OBJECT_ID(N'[dbo].[producto]'))
BEGIN
    ALTER TABLE [dbo].[producto] WITH CHECK ADD CONSTRAINT [FKba49dxcp4ftf7hg7e3jcgx62l] FOREIGN KEY([vendedor_id])
    REFERENCES [dbo].[vendedor] ([id])
END
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [FKba49dxcp4ftf7hg7e3jcgx62l]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK4w1f5390ogxeokryc98pws1as]') AND parent_object_id = OBJECT_ID(N'[dbo].[vendedor]'))
BEGIN
    ALTER TABLE [dbo].[vendedor] WITH CHECK ADD CONSTRAINT [FK4w1f5390ogxeokryc98pws1as] FOREIGN KEY([tienda_id])
    REFERENCES [dbo].[tienda] ([id])
END
GO
ALTER TABLE [dbo].[vendedor] CHECK CONSTRAINT [FK4w1f5390ogxeokryc98pws1as]
GO
