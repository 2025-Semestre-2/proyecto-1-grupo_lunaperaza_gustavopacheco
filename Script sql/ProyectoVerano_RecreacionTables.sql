USE [ProyectoVerano]
GO
/****** Object:  Table [dbo].[Empresa_Recreacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa_Recreacion](
    [id_empresa_recreacion] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](120) NOT NULL,
    [cedula_juridica] [varchar](25) NOT NULL,
    [correo] [varchar](120) NULL,
    [nombre_contacto] [varchar](120) NULL,
    [provincia] [varchar](60) NULL,
    [canton] [varchar](60) NULL,
    [distrito] [varchar](60) NULL,
    [señas_exactas] [varchar](250) NULL,
    [precio] [decimal](10,2) NULL,
 CONSTRAINT [PK_Empresa_Recreacion] PRIMARY KEY CLUSTERED 
(
    [id_empresa_recreacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Empresa_Recreacion_Cedula] UNIQUE NONCLUSTERED 
(
    [cedula_juridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Telefono_Empresa_Recreacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono_Empresa_Recreacion](
    [id_telefono] [int] IDENTITY(1,1) NOT NULL,
    [id_empresa_recreacion] [int] NOT NULL,
    [codigo_pais] [varchar](5) NULL,
    [telefono] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Telefono_Empresa_Recreacion] PRIMARY KEY CLUSTERED 
(
    [id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Tipo_Actividad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Actividad](
    [id_tipo_actividad] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Tipo_Actividad] PRIMARY KEY CLUSTERED 
(
    [id_tipo_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TipoActividad_Nombre] UNIQUE NONCLUSTERED 
(
    [nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Servicio_Recreacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio_Recreacion](
    [id_servicio] [int] IDENTITY(1,1) NOT NULL,
    [nombre] [varchar](80) NOT NULL,
    [descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Servicio_Recreacion] PRIMARY KEY CLUSTERED 
(
    [id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Servicio_Nombre] UNIQUE NONCLUSTERED 
(
    [nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Empresa_Actividad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa_Actividad](
    [id_empresa_recreacion] [int] NOT NULL,
    [id_tipo_actividad] [int] NOT NULL,
 CONSTRAINT [PK_Empresa_Actividad] PRIMARY KEY CLUSTERED 
(
    [id_empresa_recreacion] ASC,
    [id_tipo_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Empresa_Servicio_Recreacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa_Servicio_Recreacion](
    [id_empresa_recreacion] [int] NOT NULL,
    [id_servicio] [int] NOT NULL,
 CONSTRAINT [PK_Empresa_Servicio_Recreacion] PRIMARY KEY CLUSTERED 
(
    [id_empresa_recreacion] ASC,
    [id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Telefono_Empresa_Recreacion]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Empresa_Recreacion] FOREIGN KEY([id_empresa_recreacion])
REFERENCES [dbo].[Empresa_Recreacion] ([id_empresa_recreacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empresa_Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Actividad_Empresa] FOREIGN KEY([id_empresa_recreacion])
REFERENCES [dbo].[Empresa_Recreacion] ([id_empresa_recreacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empresa_Actividad]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Actividad_Tipo] FOREIGN KEY([id_tipo_actividad])
REFERENCES [dbo].[Tipo_Actividad] ([id_tipo_actividad])
GO
ALTER TABLE [dbo].[Empresa_Servicio_Recreacion]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Servicio_Empresa] FOREIGN KEY([id_empresa_recreacion])
REFERENCES [dbo].[Empresa_Recreacion] ([id_empresa_recreacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Empresa_Servicio_Recreacion]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Servicio_Servicio] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicio_Recreacion] ([id_servicio])
GO
