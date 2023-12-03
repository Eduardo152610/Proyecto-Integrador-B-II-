CREATE PROCEDURE dbo.stpSelUsuario
	@numeroVenta varchar(6)
AS
BEGIN
	
	select U.idUsuario as IdUsuario,
		   U.nombre as Nombre,
		   U.correo as Correo,
		   U.telefono as Telefono
	From Venta V
	inner join Usuario U on V.idUsuario = U.idUsuario
	where V.numeroVenta = @numeroVenta	

END
GO



CREATE PROCEDURE [dbo].[stpSelDetalleVenta]
	@numeroVenta varchar(6)
AS
BEGIN
	
	declare @VentaId int = (select top 1 idVenta from Venta where numeroVenta = @numeroVenta)

	select V.*,
	N.urlLogo as logo,
	N.direccion as DireccionNegocio,
	N.telefono as TelefonoNegocio,
	N.porcentajeImpuesto,
	N.correo as CorreoNegocio,
	U.nombre as NombreUsuario
	From Venta V 
	inner join Negocio N on V.documentoCliente = N.numeroDocumento and V.nombreCliente = N.nombre
	inner join Usuario U on U.idUsuario = V.idUsuario
	where V.idVenta = @VentaId

	select * from DetalleVenta
	where idVenta = @VentaId

END
GO
