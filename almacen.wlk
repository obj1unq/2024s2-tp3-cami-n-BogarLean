import camion.*
object almacen {
    // El depósito debe ser también un set? yo lo veo más como list
    // creo que podría tener más cosas aunque sean iguales
    const property deposito = #{}
    var property maxBultos = 3

    method depositar(camion) {
        self.validarBultos(camion)
        deposito.add(camion.cosas())
    }
    method validarBultos(camion) {
        if (not self.excesoDeBultos(camion.totalBultos())) {
            self.error("El camion tiene " + camion.totalBultos() + 
            " de bultos y el almacén soporta " + maxBultos + " bultos")
        }
    }
    method excesoDeBultos(cantidad) {
      return (maxBultos - self.totalBultos()) <= cantidad
    }

    method totalBultos() = deposito.sum({ cosa => cosa.bultos() })
}
object ruta9 {
    const property peligrosidadMaxima = 11

    method validarViajar(camion) {
        if ( not camion.puedeCircularEnRuta(peligrosidadMaxima) ) {
            self.error("La ruta 9 soporta " + peligrosidadMaxima + 
            " de nivel de peligrosidad")
        }
    }
}
object caminosVecinales {
    var property pesoSoportado = 3000

    method validarViajar(camion) {
        if (not self.puedeViajar(camion.pesoTotal())) {
            self.error("El camión pesa " + camion.pesoTotal() + " y los 
            caminos vecinales soportan " + pesoSoportado)
        }
    }
    method puedeViajar(cantidad) {
      return pesoSoportado >= cantidad
    }
}