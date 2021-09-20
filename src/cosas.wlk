object knightRider {
	method peso() = 500
	method nivel() = 10	
}

object bumblebee {
	var transformacion = true /* true = robot false = auto */
	method cambiarTransformacion(estado){ transformacion = estado } 
	method transformacion() = transformacion
	method peso() = 800
	method peligrosidad() = if (self.transformacion()) 30 else 15
	method nivel() = self.peligrosidad()
}

object paqueteDeLadrillos{
	var cantidadDeLadrillos = 0
	method cantidadDeLadrillos(cant) {cantidadDeLadrillos+= cant}
	method peso() = cantidadDeLadrillos*2
	method nivel() = 2
}

object arenaAgranel{
	var peso = 0
	method agregarArena(kg) { peso+= kg }
	method peso() = peso
	method nivel() = 1
}

object bateriaAntiAerea{
	var misiles = true
	method cambiarEstadoCarga(estado){	misiles = estado }
	method estaCargado() = misiles
	method peso() = if(self.estaCargado()) 300 else 200
	method nivel() = if(self.estaCargado()) 100 else 0
}

object contenedorPortuario{
	const cosas = []
	method cargar(cosa){ cosas.add(cosa) } 
	method descargar(cosa) { cosas.remove(cosa) }	
	method peso() = cosas.sum( {c => c.peso()} ) + 100
	method nivel() =  cosas.max({ c => c.nivel()}).nivel() 
}

object residuosRadioactivos{
	var peso = 0
	method agregarResiduo(kg) {(peso+=kg)} 
	method peso() = peso
	method nivel() = 200
}

object embalajeDeSeguridad{
	var cosa =  ""
	method agregarCosa(cosaAembalar){ cosa = cosaAembalar}
	method peso() = cosa.peso()/2
	method nivel() = cosa.nivel()/2
}

