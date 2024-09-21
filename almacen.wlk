import camion.*
object almacen {
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

    
}
object caminosVecinales {
    var property pesoSoportado = 500
}