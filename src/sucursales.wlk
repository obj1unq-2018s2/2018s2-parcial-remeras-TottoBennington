import remeras.*
class Comercio{
	const sucursales = []
	
	method agregarSucursal(sucursal){sucursales.add(sucursal)}
	
	method totalFacturadoComercio() = sucursales.sum{
		sucu => sucu.totalFacturado()
	}
	
	method totalFacturadoPor(unaSucursal) = unaSucursal.totalFacturado()
	
	method cantidadDePedidosDe(color) = self.pedidosDeTodasLasSucursales().count{
		pedido => pedido.modelo().color()
	} 
	
	method pedidosDeTodasLasSucursales() = sucursales.map{
		sucu => sucu.pedidos()
	}
	
	method pedidoMasCaro() = self.pedidosDeTodasLasSucursales().max{
		pedido => pedido.precio()
	}
	
	method sucursalQueMasFacturo() = sucursales.max{
		sucu => sucu.totalFacturado()
	}
	// el 6 y 8 no estoy seguro como encararlos...
}
class Sucursal {
	var property cantMinimaParaDesc
	var property hayConvenio
	/*
	 *  true o false
	 * dependiendo de si quiero o no
	 * que haya convenio con la empresa
	 */
	var property pedidos = []
	
	method registrarPedido(pedido){
		pedidos.add(pedido)
	}
	method totalFacturado() = pedidos.sum{
		pedido => pedido.precio()
	}
}

class Pedido{
	var property sucursal // una sucursal
	var property modelo //una remera
	var property cantidad
	method cantDeDescuento() = self.precioBase() * (self.porcentajeDescuento() / 100)
	
	method precioBase() = modelo.costo() * cantidad
	
	method precio() = if(cantidad >= sucursal.cantMinimaParaDesc()) self.precioBase() - self.cantDeDescuento() else self.precioBase() 
	method porcentajeDescuento() = modelo.descuento(sucursal)
}