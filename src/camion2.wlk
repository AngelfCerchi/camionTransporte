import cosas2.*
object camion2 {
	
	const carga = []
	method cargar(cosa){ 
		carga.add(cosa)
		cosa.reaccionar()		
	} 
	method totalBultos() = carga.sum({c => c.totalBultos()})
}
