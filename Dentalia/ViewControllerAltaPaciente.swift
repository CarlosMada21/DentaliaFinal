//
//  ViewControllerAltaPaciente.swift
//  Dentalia
//
//  Created by Master Pain on 29/04/22.
//

import UIKit

class ViewControllerAltaPaciente: UIViewController {

    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var tratamiento: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardarPaciente(_ sender: Any) {
        
        var p1: Paciente = Paciente(edad: Int(edad.text!) ?? 0, nombre: nombre.text!, tratamiento: tratamiento.text!)
        
        if (aPacientes.count == 0){
        
            p1.eID = 1
        
        } else {
            
            p1.eID = (aPacientes[(aPacientes.count) - 1].eID) + 1
            
        }
        
        aPacientes.append(p1)
        mostrarGuardado()
        let VCPacientes = storyboard?.instantiateViewController (identifier: "VCAgregarPaciente") as? TableViewControllerPacientes
        tabBarController?.navigationController?.pushViewController(VCPacientes!, animated: true)
    }
    
    func mostrarGuardado() {
        let alert = UIAlertController(title: "Guardado exitoso", message: "El paciente fue registrado", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
            //alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                            //Sign out action
            //}))
            self.present(alert, animated: true, completion: nil)
        
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
