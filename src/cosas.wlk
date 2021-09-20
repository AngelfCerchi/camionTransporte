object knightRider {
	method peso() = 500
	method nivel() = 10	
	method totalBultos() = 1
}

object bumblebee {
	var transformacion = true /* true = robot false = auto */
	method cambiarTransformacion(estado){ transformacion = estado } 
	method transformacion() = transformacion
	method peso() = 800
	method peligrosidad() = if (self.transformacion()) 30 else 15
	method nivel() = self.peligrosidad()
	method totalBultos() = 2
}

object paqueteDeLadrillos{
	var cantidadDeLadrillos = 0
	method cantidadDeLadrillos(cant) {cantidadDeLadrillos+= cant}
	method peso() = cantidadDeLadrillos*2
	method nivel() = 2
	method totalBultos(){
		if (cantidadDeLadrillos < 100){
			return 1
		}if (cantidadDeLadrillos.between(101,300)){
			return 2
		}else{
			return 3
		}
	}
}

object arenaAgranel{
	var peso = 0
	method agregarArena(kg) { peso+= kg }
	method peso() = peso
	method nivel() = 1
	method totalBultos() = 1
}

object bateriaAntiAerea{
	var misiles = true
	method cambiarEstadoCarga(estado){	misiles = estado }
	method estaCargado() = misiles
	method peso() = if(self.estaCargado()) 300 else 200
	method nivel() = if(self.estaCargado()) 100 else 0
	method totalBultos() = if (self.estaCargado()) 2 else 1
	
}

object contenedorPortuario{
	const cosas = []
	method cargar(cosa){ cosas.add(cosa) } 
	method descargar(cosa) { cosas.remove(cosa) }	
	method peso() = cosas.sum( {c => c.peso()} ) + 100
	method nivel() =  cosas.max({ c => c.nivel()}).nivel() 
	method totalBultos() = cosas.sum({ c => c.totalBultos()}) +1
}

object residuosRadioactivos{
	var peso = 0
	method agregarResiduo(kg) {(peso+=kg)} 
	method peso() = peso
	method nivel() = 200
	method totalBultos() = 1
}

object embalajeDeSeguridad{
	var cosa =  ""
	method agregarCosa(cosaAembalar){ cosa = cosaAembalar}
	method peso() = cosa.peso()/2
	method nivel() = cosa.nivel()/2
	method totalBultos() = 2
}

