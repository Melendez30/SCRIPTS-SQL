USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Instructores] ON 

INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (1, N'Oscar', N'López', N'Osorio', N'olopez@ti-capitalhumano.com', N'7226181450', CAST(N'1984-08-03' AS Date), N'LOOO840803S08', N'LOOO840803HMCPSS08', CAST(110.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (2, N'Jorge', N'Valdivia', N'Rosas', N'jvaldivia@ti-capitalhumano.com', N'5561040510', CAST(N'1964-01-26' AS Date), N'VARJ640126R00', N'VARJ640126HDFLSR00', CAST(100.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (3, N'Luis', N'Vázquez', N'Cuj', N'luisvazquez@ti-capitalhumano.com', N'5540612941', CAST(N'1974-10-11' AS Date), N'VACL741011JS5', N'VACL741011HTCZJS05', CAST(80.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (4, N'José', N'Morales', N'Narváez', N'jose.morales@ti-capitalhumano.com', N'5511506288', CAST(N'1984-12-31' AS Date), N'MONM941231N07', N'MONM941231HCCRRN07', CAST(70.00 AS Decimal(9, 2)), 1)
SET IDENTITY_INSERT [dbo].[Instructores] OFF
GO
