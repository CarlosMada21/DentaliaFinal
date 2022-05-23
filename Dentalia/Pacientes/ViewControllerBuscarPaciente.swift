//
//  ViewControllerBuscarPaciente.swift
//  Dentalia
//
//  Created by UNAM FCA 15 on 20/05/22.
//

import UIKit

class ViewControllerBuscarPaciente: UIViewController {

    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfID: UITextField!
    var personaBuscada = Paciente()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BuscarPacienteActualizar"{
            
            /*let actualizarPaciente = segue.destination as? ViewControllerActualizarPaciente
            
            if tfNombre.text != nil {
                actualizarPaciente.tfNombre =  tfNombre.text?.lowercased().trimmingCharacters(in: .whitespaces)
            } else if tfID.text != nil {
                var eID = Int64(tfID.text!) ?? 0
            }*/
        }
    }
    
    @IBAction func buscarPaciente(_ sender: Any) {
        
        if tfNombre.text != nil {
            
            tfNombre.text?.lowercased().trimmingCharacters(in: .whitespaces)
            
        } else if tfID.text != nil {
            
            
            
        }
        
    }
    

}
