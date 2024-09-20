object knightRider {
	const property peso = 500
	const property nivelPeligrosidad = 10
}

object bumblebee {
	const property peso = 800
	var property estado = auto
	
	method nivelPeligrosidad() = estado.nivelPeligrosidad()
}

object auto {
	const property nivelPeligrosidad = 15
}

object robot {
	const property nivelPeligrosidad = 30
}

object paqueteDeLadrillos {
	var property cantidad = 0
	const property nivelPeligrosidad = 2
}

object arenaAGranel {
	var property peso = 0
	const property nivelPeligrosidad = 1
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
}

object embalajeDeSeguridad {
	//Pensando
}


