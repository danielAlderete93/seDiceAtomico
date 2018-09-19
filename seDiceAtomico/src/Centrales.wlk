
object hidroelectrica{
	method produccionEnergetica(ciudad){
		return 2*ciudad.caudal()
	}
}
object burns {
	var cantVarillas = 10
	
	method produccionEnergetica(ciudad){
		return 0.1 * cantVarillas
	}
	method esContaminante(ciudad){
		return cantVarillas > 20
	}
}

object exBosque{
	var capacidad = 20
	
	method produccionEnergetica(ciudad){
		return 0.5+ capacidad * ciudad.riqueza()
	}
	
	method esContaminante(ciudad){
		return true
	}
}

object elSuspiro{
	var property turbinas = [turbina1]
		
	method agregarTurbina(turbina){
		turbinas.add(turbina)
	}
	method produccionEnergetica(ciudad){
		return turbinas.sum({unaTurbina => unaTurbina.produccionEnergetica(ciudad)})
	}
	method esContaminante(ciudad){
		return false
	}
}

object turbina1{
	method produccionEnergetica(ciudad){
		return 0.2*ciudad.vientos()
	}
}
