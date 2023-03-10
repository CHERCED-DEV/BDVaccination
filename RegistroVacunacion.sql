USE [master]
GO
/****** Object:  Database [VacunacionMascotas]    Script Date: 12/20/2022 6:28:44 PM ******/
CREATE DATABASE [VacunacionMascotas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VacunacionMascotas', FILENAME = N'C:\Users\eyjoa\VacunacionMascotas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VacunacionMascotas_log', FILENAME = N'C:\Users\eyjoa\VacunacionMascotas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VacunacionMascotas] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VacunacionMascotas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VacunacionMascotas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET ARITHABORT OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VacunacionMascotas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VacunacionMascotas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VacunacionMascotas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VacunacionMascotas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VacunacionMascotas] SET  MULTI_USER 
GO
ALTER DATABASE [VacunacionMascotas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VacunacionMascotas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VacunacionMascotas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VacunacionMascotas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VacunacionMascotas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VacunacionMascotas] SET QUERY_STORE = OFF
GO
USE [VacunacionMascotas]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [VacunacionMascotas]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 12/20/2022 6:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[IdTipoAnimal] [uniqueidentifier] NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[Edad] [int] NULL,
 CONSTRAINT [PK_Mascota] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroVacunacion]    Script Date: 12/20/2022 6:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroVacunacion](
	[Id] [uniqueidentifier] NOT NULL,
	[IdMascota] [uniqueidentifier] NOT NULL,
	[FechaVacunacion] [datetime] NOT NULL,
	[Vacuna] [varchar](250) NOT NULL,
	[FechaVencimiento] [datetime] NULL,
	[Veterinario] [varchar](250) NULL,
 CONSTRAINT [PK_RegistroVacunacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAnimal]    Script Date: 12/20/2022 6:28:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAnimal](
	[Id] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
 CONSTRAINT [PK_TipoAnimal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [FK_Mascota_TipoAnimal] FOREIGN KEY([IdTipoAnimal])
REFERENCES [dbo].[TipoAnimal] ([Id])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [FK_Mascota_TipoAnimal]
GO
ALTER TABLE [dbo].[RegistroVacunacion]  WITH CHECK ADD  CONSTRAINT [FK_RegistroVacunacion_Mascota] FOREIGN KEY([IdMascota])
REFERENCES [dbo].[Mascota] ([Id])
GO
ALTER TABLE [dbo].[RegistroVacunacion] CHECK CONSTRAINT [FK_RegistroVacunacion_Mascota]
GO
USE [master]
GO
ALTER DATABASE [VacunacionMascotas] SET  READ_WRITE 
GO
