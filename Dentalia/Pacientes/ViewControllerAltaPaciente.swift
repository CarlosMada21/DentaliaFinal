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
    
    let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var aPacientes:[EntidadPaciente] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardarPaciente(_ sender: Any) {
        
        let epNuevoPaciente = EntidadPaciente(context: self.contexto)
        epNuevoPaciente.sNombre = self.nombre.text!
        epNuevoPaciente.eEdad = Int16(self.edad.text!) ?? 0
        epNuevoPaciente.sTratamiento = self.tratamiento.text!
        
        do{
            try self.contexto.save()
            mostrarMensaje("Guardado exitoso", "El paciente fue registrado con éxito")
            self.nombre.text = ""
            self.edad.text = ""
            self.tratamiento.text = ""
        } catch {
            
            mostrarMensaje("No se pudo guardar", "El paciente no fue registrado")
        }
        
        let VCPacientes = storyboard?.instantiateViewController (identifier: "VCAgregarPaciente") as? TableViewControllerPacientes
        tabBarController?.navigationController?.pushViewController(VCPacientes!, animated: true)
    }
    func mostrarMensaje(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        
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
