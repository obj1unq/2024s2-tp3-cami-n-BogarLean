object knightRider {
	const property peso = 500
	const property nivelPeligrosidad = 10
	const property bultos = 1
}

object bumblebee {
	const property peso = 800
	var property estado = auto
	const property bultos = 2
	
	
	method nivelPeligrosidad() = estado.nivelPeligrosidad()
}

object auto {
	const property nivelPeligrosidad = 15
}

object robot {
	const property nivelPeligrosidad = 30
}

object paqueteDeLadrillos {
	var property cantidad = 1
	const property nivelPeligrosidad = 2

	// hasta 100 ladrillos = 1 bultos
	// de 101 a 300 = 2 bultos
	// de 301 en adelante = 3 bultos
}

object arenaAGranel {
	var property peso = 1
	const property nivelPeligrosidad = 1
	const property bultos = 1
}

object bateriaAntiaerea {
	var property estado = misiles
	
	// El peso y el nivel de peligrosidad dependen del estado
	// por eso no pongo que sean variables
	method peso() = estado.peso()
	
	method nivelPeligrosidad() {
		estado.nivelPeligrosidad()
	}
}

object misiles {
	const property peso = 300
	const property nivelPeligrosidad = 100
}

object sinMisiles {
	const property peso = 0
	const property nivelPeligrosidad = 0
}

object contenedorPortuario {
	const property cosas = #{}
	const pesoPropio = 100
	
	method peso() = pesoPropio + self.pesoDeCosas()
	
	method pesoDeCosas() = cosas.sum({ cosa => cosa.peso() })
	
	method nivelPeligrosidad() = self.peligrosidadDeCosas().maxIfEmpty(0)
	
	method peligrosidadDeCosas() = cosas.map({ cosa => cosa.nivelPeligrosidad() })
}

object residuosRadiactivos {
	var property peso = 0
	const property nivelPeligrosidad = 200
	const property bultos = 1
}

object embalajeDeSeguridad {
	var property cosa = knightRider
	const property bultos = 2

	method peso() {
		return cosa.peso()
	}

	method nivelPeligrosidad() {
		return cosa.nivelPeligrosidad() / 2
	}
}


