//
//  Pacientes.swift
//  Dentalia
//
//  Created by Master Pain on 26/04/22.
//

import Foundation

//var aPacientes: [Paciente] = []

struct Paciente {
    
    var eID: Int = 0
    var eEdad: Int = 0
    var sNombre: String = ""
    var sTratamiento: String = ""
    
    init() {}
    init (edad eEdad: Int, nombre sNombre: String, tratamiento sTratamiento: String){
        self.eEdad = eEdad
        self.sNombre = sNombre
        self.sTratamiento = sTratamiento
    }
    
}
