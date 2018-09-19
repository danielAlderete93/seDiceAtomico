import Centrales.*

//"Queria comitear algo :)"
object springfield{
	var centrales=#{elSuspiro,burns,exBosque}
	var vientos = 10
	var riqueza = 0.9
	var property necesidadEnergetica= 20
	
	method centrales(){
		return centrales
	}
	method riqueza(){
		return riqueza
	}
	method vientos(){
		return vientos
	}
	method produccionEnergetica(){
		return centrales.sum({unaCentral => unaCentral.produccionEnergetica(self)})
	}
	method centralesContaminantes(){
		return centrales.filter({unaCentral => unaCentral.esContaminante(self)})
	}
	method cubreNecesidades(){
		return necesidadEnergetica < self.produccionEnergetica()
	}
	method estaAlHorno(){
		return self.centralesContaminantes().sum({unaCentral=> unaCentral.produccionEnergetica(self)}) > self.produccionEnergetica()/2 || centrales.all({unaCentral => unaCentral.esContaminante()})
	
	}
}

object alburquerque{
	const caudal=150
	var centrales = [hidroelectrica]
	
	method centrales(){
		return centrales
	}
	method caudal(){
		return caudal
	}
	method produccionEnergetica(){
		return centrales.sum({unaCentral => unaCentral.produccionEnergetica(self)})
	}
	method centralesContaminantes(){
		return centrales.filter({unaCentral => unaCentral.esContaminante()})
	}
}

object region{
	var ciudades =[springfield,alburquerque]
	
	method centralesMasProductoras(){
		return ciudades.map({unaCiudad => unaCiudad.centrales().max({unaCentral => unaCentral.produccionEnergetica(unaCiudad)})})
	}	
}
