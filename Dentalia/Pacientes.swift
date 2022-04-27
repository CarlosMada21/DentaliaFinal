//
//  Pacientes.swift
//  Dentalia
//
//  Created by Master Pain on 26/04/22.
//

import Foundation

struct Paciente {
    var eEdad: Int = 0
    var sNombre: String = ""
    var tTratamiento: Tratamiento = Tratamiento()
    init() {}
    init (edad eEdad: Int, nombre sNombre: String, tratamiento tTratamiento: Tratamiento){
        self.eEdad = eEdad
        self.sNombre = sNombre
        self.tTratamiento = tTratamiento
    }
    
}
