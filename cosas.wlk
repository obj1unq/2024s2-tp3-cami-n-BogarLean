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

	// ¿Tiene sentido que la cantidad sea menor a 0
	// y que el bulto siga siendo 1? tal vez la cantidad
	// no debería ser menor a 0
	method bultos() = if (cantidad <= 100) {
		1
	} else {
		if (cantidad.between(101, 300)) 2 else 3
	}
	method peso() {
		return cantidad * 2
	}
}

object arenaAGranel {
	var property peso = 1
	const property nivelPeligrosidad = 1
	const property bultos = 1
}

object bateriaAntiaerea {
	var property estado = misiles
	
	// El peso, el nivel de peligrosidad y los bultos dependen del estado
	method peso() = estado.peso()
	
	method nivelPeligrosidad() = estado.nivelPeligrosidad()
	
	method bultos() = estado.bultos()
}

object misiles {
	const property peso = 300
	const property nivelPeligrosidad = 100
	const property bultos = 2
}

object sinMisiles {
	const property peso = 0
	const property nivelPeligrosidad = 0
	const property bultos = 1
}

object contenedorPortuario {
	const property cosas = #{}
	const pesoPropio = 100
	
	method peso() = pesoPropio + self.pesoDeCosas()
	
	method pesoDeCosas() = cosas.sum({ cosa => cosa.peso() })
	
	method nivelPeligrosidad() = self.peligrosidadDeCosas().maxIfEmpty(0)
	
	method peligrosidadDeCosas() = cosas.map({ cosa => cosa.nivelPeligrosidad() })
	
	method bultos() {
		cosas.sum({ cosa => cosa.bultos() })
	}
}

object residuosRadiactivos {
	var property peso = 0
	const property nivelPeligrosidad = 200
	const property bultos = 1
}

object embalajeDeSeguridad {
	var property cosa = knightRider
	const property bultos = 2
	
	method peso() = cosa.peso()
	
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
}
