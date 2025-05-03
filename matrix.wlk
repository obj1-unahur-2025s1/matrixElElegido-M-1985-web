// matrix.wlk
// matrix.wlk
// matrix.wlk
// matrix.wlk
// matrix.wlk
// matrix.wlk



object neo {
    var energia = 100

    method esElElegido() = true

    //metodo que modifica
    method salta(){
        energia -= energia / 2
        //energia = energia * 0.5
    }

    method vitalidad()= energia * 0.1 //energia / 10

}

object morfeo {

    var vitalidad = 0
    var estaDescansado = true

    method esElElegido()= false

    method salta(){
        estaDescansado = not estaDescansado
        //vitalidad -= 1
        vitalidad = (vitalidad - 1).max(0) //no puede ser menor a cero
    }

    //metodo consulta mas que nada
    method vitalidad() = vitalidad

}

object trinity {

    method vitalidad() = 0

    //indicativo, mantengo el polimorfismo, procesa
    method saltar(){}

    method esElElegido()=false
}

object nave {
    const pasajeros = #{neo,morfeo,trinity}

    //method cuantosPasajerosHay() = pasajeros.size()
    method cuantosPasajerosHay() {
      return pasajeros.size()
    }

    method pasajeroDeMayorVitalidad() = pasajeros.max({p => p.vitalidad()})

    method pasajeroDeMinimaVitalidad() = pasajeros.min({p => p.vitalidad()})

    method estaEquilibrada(){
        return self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMinimaVitalidad().vitalidad() * 2
    }

    method estaElElejido()= pasajeros.any({p=>p.esElejido()})

    //hasta los metodos de consultas
    //ahora la nave tiene que hacer cosas

    method chocar(){//ciclo repetitivo
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        pasajeros.filter({p => not p.esElElegido()}).forEach({p=> p.salta()})//devuelve una sublista o nueva coleccion
        pasajeros.remove(neo)

    }
  
}

