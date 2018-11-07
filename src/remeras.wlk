import sucursales.*
class Lisa{
	var property talle
	var property color
	method descuento(sucursal) = 10
	method costo(){
		var costoBasico = if(talle.between(32, 40)) 80 else 100
		return if(color == "blanco" or color == "negro" or color == "gris") costoBasico else costoBasico + costoBasico * 0.1  
	}

}

class Bordada inherits Lisa{
	var property cantidadDeColores
	override method descuento(sucursal) = 2
	override method costo() = super() + if(cantidadDeColores == 1) 20 else cantidadDeColores * 10
}

class Sublimada inherits Lisa{
	var property costoCopyright
	var property altoDibujo
	var property anchoDibujo
	
	override method descuento(sucursal) = if(sucursal.hayConvenio()) 20 else 0
	
	method costoDelSublimado() = ((anchoDibujo * altoDibujo) * 0.5) + costoCopyright
	
	override method costo() = super() + self.costoDelSublimado()
}