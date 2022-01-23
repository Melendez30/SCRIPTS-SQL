USE InstitutoTich
SET IDENTITY_INSERT [dbo].[estatusAlumnos] ON 
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (1, N'PTO       ', N'Prospecto')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (2, N'PRO       ', N'En curso propedéutico')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (3, N'CAP       ', N'En capacitación')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (4, N'INC       ', N'En Incursión')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (5, N'LAB       ', N'Laborando')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (6, N'LIB       ', N'Liberado')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (7, N'NI        ', N'No le interesó')
INSERT [dbo].[estatusAlumnos] ([id], [clave], [nombre]) VALUES (8, N'BA        ', N'Baja')

SET IDENTITY_INSERT [dbo].[estatusAlumnos] OFF 