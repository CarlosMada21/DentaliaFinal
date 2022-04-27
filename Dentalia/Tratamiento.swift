//
//  Tratamiento.swift
//  Dentalia
//
//  Created by Master Pain on 26/04/22.
//

import Foundation

struct Tratamiento {
    var sNombre: String = ""
    var dCosto: Double = 0.0
    var eDuracionSesiones: Int = 0
    init() {}
    init(tratamiento sNombre: String, costo dCosto: Double, duracion eSesiones: Int){
        self.sNombre = sNombre
        self.dCosto = dCosto
        self.eDuracionSesiones = eSesiones
    }
    
}
