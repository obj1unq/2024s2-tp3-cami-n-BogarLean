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
      return maxBultos < cantidad
    }
}
object ruta9 {
    var property pesoSoportado = 800

    method validarPesoSoportado(camion) {
        if (not self.excesoDePeso(camion.pesoTotal())) {
            self.error("El camión pesa " + camion.pesoTotal() + " y la 
            ruta 9 soporta " + pesoSoportado)
        }
    }
    method excesoDePeso(cantidad) {
      return pesoSoportado <= cantidad
    }
}
object caminosVecinales {
    var property pesoSoportado = 500

    method validarPesoSoportado(camion) {
        if (not self.excesoDePeso(camion.pesoTotal())) {
            self.error("El camión pesa " + camion.pesoTotal() + " y los 
            caminos vecinales soportan " + pesoSoportado)
        }
    }
    method excesoDePeso(cantidad) {
      return pesoSoportado <= cantidad
    }
}