//
//  EntidadRecordatorio+CoreDataProperties.swift
//  Dentalia
//
//  Created by Master Pain on 10/06/22.
//
//

import Foundation
import CoreData


extension EntidadRecordatorio {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntidadRecordatorio> {
        return NSFetchRequest<EntidadRecordatorio>(entityName: "EntidadRecordatorio")
    }

    @NSManaged public var sNota: String?
    @NSManaged public var sFecha: String?

}

extension EntidadRecordatorio : Identifiable {

}
