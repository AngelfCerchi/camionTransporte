import cosas.*
object camion {
	const carga = []
	
	
	method cargar(cosa){ carga.add(cosa) } 
	method descargar(cosa) { carga.remove(cosa) }	
	method todoPesoPar() = carga.all({c => c.peso().even()})
	method hayAlgunoQuePesa(peso) = carga.any({ c => c.peso() == peso})
	method elNivelEs(nivel) = carga.find({ c => c.nivel() == nivel})
	method pesoTotal() = carga.sum({ c => c.peso()}) + 1000 
	method excedidoEnPeso() = self.pesoTotal() > 2500
	method objetosQueSuperanPeligrosidad(nivel) = carga.filter({c => c.nivel() > nivel})
	method objetosMasPeligrososQue(cosa) = carga.filter({c => c.nivel() > cosa.nivel()})
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) = not self.excedidoEnPeso() and not carga.any({c => c.nivel() > nivelMaximoPeligrosidad})
	method tieneAlgoQuePesaEntre(min,max) = carga.any({ c => c.peso().between(min,max)})
	method cosaMasPesada() = carga.max({c => c.peso()})
	method pesos() = carga.map({ c => c.peso()})
	method totalBultos() = carga.sum({c => c.totalBultos()})
}
