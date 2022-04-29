//
//  GuardarCore.swift
//  Dentalia
//
//  Created by Master Pain on 28/04/22.
//
/*
import Foundation
import UIKit
import CoreData

func getContext() -> NSManagedObjectContext{
    
    return(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
}

func recoverRecordatorio() -> [Pacientes]{
        
    var recordatorios: [Pacientes]?
    
    let context = getContext()
    let fetchRequest: NSFetchRequest<Pacientes> = Pacientes.fetchRequest()
    
    do {
        recordatorios = try context.fetch(fetchRequest)
        
    } catch let error as NSError {
        print("No se pudo recuperar \(error), \(error.userInfo)")
    }
    return recordatorios!
}

func saveEntityRecordatorio(recordatorio : String) {
    let context = getContext()
    
    let entityRecordatorio = NSEntityDescription.entity(forEntityName: "Recordatorio", in: context)!
    let recordatorioManaged = NSManagedObject(entity: entityRecordatorio, insertInto: context) as! Paciente
    recordatorioManaged.recordatorio = recordatorio
    
    do {
        try context.save()
        //movement = movementManaged as Movement
        //Asignar a project proyecto guardado
    } catch let error as NSError {
        print("No se pudo guardar el proyecto: \(error), \(error.userInfo)")
    }
}

func updateEntityRecordatorio (eRecordatorio : Paciente, recordatorio : String) {
        let context = getContext()
        let recordatorioManaged = eRecordatorio as NSManagedObject
        recordatorioManaged.setValue(recordatorio, forKey: "recordatorio")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("No se pudo actualizar: \(error), \(error.userInfo)")
        }
}
*/
