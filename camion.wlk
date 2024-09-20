import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	
	method cargar(cosa) {
		cosas.add(cosa)
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() = cosas.all(
		{ cosa => ((cosa.peso() / 2) * 2) == cosa.peso() }
	)
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method elDeNivel(nivel) = cosas.find({ cosa => cosa.nivelPeligrosidad(nivel) })
	
	method tara() = tara
	
	method pesoTotal() = self.tara() + cosas.sum({ cosa => cosa.peso() })
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter(
		{ cosa => cosa.peso() >= nivel }
	)
	
	method objetosMasPeligrososQue(cosa) = cosas.filter(
		{ objeto => objeto.nivelPeligrosidad() > cosa.nivelPeligrosidad() }
	)
	
	method puedeCircularEnRuta(
		nivelMaximoPeligrosidad
	) = self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(
		nivelMaximoPeligrosidad
	).isEmpty()
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any(
		{ cosa => (cosa.peso() >= min) and (cosa.peso() <= max) }
	)
	
	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}
	
	method pesos() = cosas.map({ cosa => cosa.peso() })

	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}
}