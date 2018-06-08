USE [master]
GO
/****** Object:  Database [AUTOPOSTO]    Script Date: 08/06/2018 19:26:57 ******/
CREATE DATABASE [AUTOPOSTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AUTOPOSTO', FILENAME = N'C:\Dados\AUTOPOSTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AUTOPOSTO_log', FILENAME = N'C:\Dados\AUTOPOSTO_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AUTOPOSTO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AUTOPOSTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AUTOPOSTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AUTOPOSTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AUTOPOSTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AUTOPOSTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AUTOPOSTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AUTOPOSTO] SET  MULTI_USER 
GO
ALTER DATABASE [AUTOPOSTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AUTOPOSTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AUTOPOSTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AUTOPOSTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AUTOPOSTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AUTOPOSTO] SET QUERY_STORE = OFF
GO
USE [AUTOPOSTO]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [AUTOPOSTO]
GO
/****** Object:  Table [dbo].[CIDADE]    Script Date: 08/06/2018 19:26:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIDADE](
	[id_cidade] [int] NOT NULL,
	[id_estado] [int] NULL,
	[nome] [varchar](120) NULL,
 CONSTRAINT [PK__CIDADE__3214EC278E36C7A0] PRIMARY KEY CLUSTERED 
(
	[id_cidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[id_sexo] [tinyint] NOT NULL,
	[id_cidade] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[sobrenome] [varchar](100) NOT NULL,
	[cpf] [varchar](14) NOT NULL,
	[rg] [varchar](12) NOT NULL,
	[dt_nascimento] [datetime] NOT NULL,
	[cnpj] [varchar](16) NULL,
	[logradouro] [varchar](100) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[complemento] [varchar](50) NULL,
	[cep] [varchar](10) NOT NULL,
	[telefone_res] [varchar](50) NULL,
	[telefone_cel] [varchar](50) NULL,
	[telefone_3] [varchar](50) NULL,
	[telefone_4] [varchar](100) NULL,
	[email_p] [varchar](100) NOT NULL,
	[email_s] [varchar](100) NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[id_estado] [int] NOT NULL,
	[nome] [varchar](75) NULL,
	[uf] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO_CIVIL]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO_CIVIL](
	[id_estado_civil] [tinyint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NULL,
 CONSTRAINT [PK_ESTADO_CIVIL] PRIMARY KEY CLUSTERED 
(
	[id_estado_civil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORNECEDOR]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORNECEDOR](
	[id_fornecedor] [int] IDENTITY(1,1) NOT NULL,
	[fantasia] [varchar](100) NOT NULL,
	[razao_social] [varchar](100) NOT NULL,
	[cnpj] [varchar](14) NOT NULL,
	[inscricao_estadual] [varchar](20) NOT NULL,
	[logradouro] [varchar](100) NOT NULL,
	[complemento] [varchar](50) NULL,
	[bairro] [varchar](50) NOT NULL,
	[cep] [varchar](10) NOT NULL,
	[estado] [varchar](2) NOT NULL,
	[cidade] [varchar](60) NOT NULL,
	[telefone_com] [varchar](50) NOT NULL,
	[telefone_cel] [varchar](50) NOT NULL,
	[telefone_fax] [varchar](50) NULL,
	[telefone_whats] [varchar](50) NOT NULL,
	[email_p] [varchar](100) NOT NULL,
	[email_s] [varchar](100) NULL,
 CONSTRAINT [PK_FORNECEDOR] PRIMARY KEY CLUSTERED 
(
	[id_fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FUNCIONARIO]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FUNCIONARIO](
	[id_funcionario] [int] IDENTITY(1,1) NOT NULL,
	[id_sexo] [tinyint] NULL,
	[id_estado_civil] [tinyint] NULL,
	[id_cidade] [int] NULL,
	[nome] [varchar](100) NOT NULL,
	[sobrenome] [varchar](100) NOT NULL,
	[nacionalidade] [varchar](50) NULL,
	[naturalidade] [varchar](50) NULL,
	[cpf] [varchar](14) NULL,
	[rg] [varchar](12) NULL,
	[dt_nascimento] [datetime] NOT NULL,
	[logradouro] [varchar](100) NOT NULL,
	[complemento] [varchar](50) NULL,
	[bairro] [varchar](50) NOT NULL,
	[cep] [varchar](10) NOT NULL,
	[telefone_res] [varchar](50) NULL,
	[telefone_cel] [varchar](50) NOT NULL,
	[telefone_whats] [varchar](50) NULL,
	[telefone_3] [varchar](50) NULL,
	[email_p] [varchar](100) NOT NULL,
	[email_s] [varchar](100) NULL,
	[salario] [decimal](18, 2) NULL,
 CONSTRAINT [PK_FUNCIONARIO] PRIMARY KEY CLUSTERED 
(
	[id_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NOT NULL,
 CONSTRAINT [PK_MARCA] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAIS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NOME] [varchar](60) NULL,
	[SIGLA] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUTO]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUTO](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[id_fornecedor] [int] NOT NULL,
	[id_marca] [int] NOT NULL,
	[nome] [varchar](100) NOT NULL,
	[dt_cadastro] [datetime] NOT NULL,
	[codigo_barra] [varchar](100) NOT NULL,
	[preco_custo] [decimal](10, 2) NOT NULL,
	[preco_venda] [decimal](10, 2) NOT NULL,
	[quantidade] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEXO]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEXO](
	[id_sexo] [tinyint] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SEXO] PRIMARY KEY CLUSTERED 
(
	[id_sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_funcionario] [int] NOT NULL,
	[nome] [varchar](30) NOT NULL,
	[senha] [varchar](12) NOT NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDA]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDA](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[hora] [datetime] NOT NULL,
 CONSTRAINT [PK_VENDA] PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENDA_ITEM]    Script Date: 08/06/2018 19:26:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDA_ITEM](
	[id_venda_item] [int] IDENTITY(1,1) NOT NULL,
	[id_venda] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
	[quantidade] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_VENDA_ITEM] PRIMARY KEY CLUSTERED 
(
	[id_venda_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CIDADE] ADD  CONSTRAINT [DF__CIDADE__ESTADO__4316F928]  DEFAULT (NULL) FOR [id_estado]
GO
ALTER TABLE [dbo].[CIDADE] ADD  CONSTRAINT [DF__CIDADE__NOME__4222D4EF]  DEFAULT (NULL) FOR [nome]
GO
ALTER TABLE [dbo].[CIDADE]  WITH CHECK ADD  CONSTRAINT [FK_CIDADE_ESTADO] FOREIGN KEY([id_estado])
REFERENCES [dbo].[ESTADO] ([id_estado])
GO
ALTER TABLE [dbo].[CIDADE] CHECK CONSTRAINT [FK_CIDADE_ESTADO]
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_CIDADE] FOREIGN KEY([id_cidade])
REFERENCES [dbo].[CIDADE] ([id_cidade])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [FK_CLIENTE_CIDADE]
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTE_SEXO] FOREIGN KEY([id_sexo])
REFERENCES [dbo].[SEXO] ([id_sexo])
GO
ALTER TABLE [dbo].[CLIENTE] CHECK CONSTRAINT [FK_CLIENTE_SEXO]
GO
ALTER TABLE [dbo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FK_FUNCIONARIO_CIDADE] FOREIGN KEY([id_cidade])
REFERENCES [dbo].[CIDADE] ([id_cidade])
GO
ALTER TABLE [dbo].[FUNCIONARIO] CHECK CONSTRAINT [FK_FUNCIONARIO_CIDADE]
GO
ALTER TABLE [dbo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FK_FUNCIONARIO_ESTADO_CIVIL] FOREIGN KEY([id_estado_civil])
REFERENCES [dbo].[ESTADO_CIVIL] ([id_estado_civil])
GO
ALTER TABLE [dbo].[FUNCIONARIO] CHECK CONSTRAINT [FK_FUNCIONARIO_ESTADO_CIVIL]
GO
ALTER TABLE [dbo].[FUNCIONARIO]  WITH CHECK ADD  CONSTRAINT [FK_FUNCIONARIO_SEXO] FOREIGN KEY([id_sexo])
REFERENCES [dbo].[SEXO] ([id_sexo])
GO
ALTER TABLE [dbo].[FUNCIONARIO] CHECK CONSTRAINT [FK_FUNCIONARIO_SEXO]
GO
ALTER TABLE [dbo].[PRODUTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUTO_FORNECEDOR] FOREIGN KEY([id_fornecedor])
REFERENCES [dbo].[FORNECEDOR] ([id_fornecedor])
GO
ALTER TABLE [dbo].[PRODUTO] CHECK CONSTRAINT [FK_PRODUTO_FORNECEDOR]
GO
ALTER TABLE [dbo].[PRODUTO]  WITH CHECK ADD  CONSTRAINT [FK_PRODUTO_MARCA] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MARCA] ([id_marca])
GO
ALTER TABLE [dbo].[PRODUTO] CHECK CONSTRAINT [FK_PRODUTO_MARCA]
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD  CONSTRAINT [FK_USUARIO_FUNCIONARIO] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[FUNCIONARIO] ([id_funcionario])
GO
ALTER TABLE [dbo].[USUARIO] CHECK CONSTRAINT [FK_USUARIO_FUNCIONARIO]
GO
ALTER TABLE [dbo].[VENDA]  WITH CHECK ADD  CONSTRAINT [FK_VENDA_CLIENTE] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTE] ([id_cliente])
GO
ALTER TABLE [dbo].[VENDA] CHECK CONSTRAINT [FK_VENDA_CLIENTE]
GO
ALTER TABLE [dbo].[VENDA]  WITH CHECK ADD  CONSTRAINT [FK_VENDA_USUARIO] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIO] ([id_usuario])
GO
ALTER TABLE [dbo].[VENDA] CHECK CONSTRAINT [FK_VENDA_USUARIO]
GO
ALTER TABLE [dbo].[VENDA_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_VENDA_ITEM_PRODUTO] FOREIGN KEY([id_produto])
REFERENCES [dbo].[PRODUTO] ([id_produto])
GO
ALTER TABLE [dbo].[VENDA_ITEM] CHECK CONSTRAINT [FK_VENDA_ITEM_PRODUTO]
GO
ALTER TABLE [dbo].[VENDA_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_VENDA_ITEM_VENDA] FOREIGN KEY([id_venda])
REFERENCES [dbo].[VENDA] ([id_venda])
GO
ALTER TABLE [dbo].[VENDA_ITEM] CHECK CONSTRAINT [FK_VENDA_ITEM_VENDA]
GO
USE [master]
GO
ALTER DATABASE [AUTOPOSTO] SET  READ_WRITE 
GO
