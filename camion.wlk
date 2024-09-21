import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const property pesoMaximo = 2500
	
	method cargar(cosa) {
		cosa.cambios()
		cosas.add(cosa)
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() = cosas.all(
		{ cosa => ((cosa.peso() / 2) * 2) == cosa.peso() }
	)
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method elDeNivel(nivel) = cosas.find(
		{ cosa => cosa.nivelPeligrosidad() == nivel }
	) // ↑ Se podría poner una excepción si no lo encuentra
	
	method tara() = tara
	
	method pesoTotal() = self.tara() + cosas.sum({ cosa => cosa.peso() })
	
	method excedidoDePeso() = self.pesoTotal() > pesoMaximo
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() > nivel }
	)
	
	method objetosMasPeligrososQue(cosa) = cosas.filter(
		{ objeto => objeto.nivelPeligrosidad() > cosa.nivelPeligrosidad() }
	)
	
	method puedeCircularEnRuta(
		nivelMaximoPeligrosidad
	) = (not self.excedidoDePeso()) and self.objetosQueSuperanPeligrosidad(
		nivelMaximoPeligrosidad
	).isEmpty()
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any(
		{ cosa => (cosa.peso() >= min) and (cosa.peso() <= max) }
	)
	
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	
	method pesos() = cosas.map({ cosa => cosa.peso() })
	
	method totalBultos() = cosas.sum({ cosa => cosa.bultos() })
	
	method transportar(destino, camino) {
		self.validarExcesoDePeso()
		destino.validarBultos(self)
		camino.validarViajar(self)
		destino.depositar(self)
		self.cosas().clear()
	}
	method validarExcesoDePeso() {
		if (self.excedidoDePeso()) {
			self.error("El camión está excedido de peso, tiene " + self.pesoTotal() + " y el peso máximo es " + pesoMaximo)
		}
	}
}