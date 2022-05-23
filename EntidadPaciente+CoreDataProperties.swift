//
//  EntidadPaciente+CoreDataProperties.swift
//  Dentalia
//
//  Created by Master Pain on 22/05/22.
//
//

import Foundation
import CoreData


extension EntidadPaciente {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntidadPaciente> {
        return NSFetchRequest<EntidadPaciente>(entityName: "EntidadPaciente")
    }

    @NSManaged public var sNombre: String?
    @NSManaged public var eEdad: Int16
    @NSManaged public var sTelefono: String?
    @NSManaged public var sDomicilio: String?
    @NSManaged public var eID: Int64
    @NSManaged public var sTratamiento: String?
    @NSManaged public var sGenero: String?

}

extension EntidadPaciente : Identifiable {

}
