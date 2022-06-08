//
//  ViewControllerActualizarPaciente.swift
//  Dentalia
//
//  Created by UNAM FCA 15 on 20/05/22.
//

import UIKit

class ViewControllerActualizarPaciente: UIViewController {

    @IBOutlet weak var tratamiento: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var tfNombre: UITextField!
    var pPacienteActualizar: EntidadPaciente?
    //let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //var aPacientes:[EntidadPaciente] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.viewControllers.forEach({ vc in
            print(vc.self)
        })
      //  buscarPacientes()
        //cargarPacienteBuscado()
        // Do any additional setup after loading the view.
        self.tratamiento.text = self.pPacienteActualizar?.sTratamiento
        self.edad.text = "\(self.pPacienteActualizar?.eEdad ?? 00)"
        self.tfNombre.text = self.pPacienteActualizar?.sNombre
    }
    
    @IBAction func actualizarPaciente(_ sender: Any) {
        mensajeConfirmacionActualizar("Actualizar Paciente", "Se actualizarán los datos")
    }
    @IBAction func borrarPaciente(_ sender: Any) {
        
        mensajeConfirmacionBorrar("Borrar paciente", "¿Segura que quiere borrar al paciente?")
    }
    func mensajeConfirmacionBorrar(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: { _ in }))
        alert.addAction(UIAlertAction(title: "Confirmar", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                contexto.delete(self.pPacienteActualizar!)
                do{
                    try contexto.save()
                    let VCAltaPaciente = self.navigationController?.viewControllers[2]
                    self.navigationController?.popToViewController(VCAltaPaciente!, animated: true)
                } catch {
                    self.mostrarMensajeAlerta("Error", "No se borró el paciente")
                }//Accion para confirmar
                //let VCAltaPaciente = self.navigationController?.viewControllers[0]
                
            }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func mensajeConfirmacionActualizar(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: { _ in }))
        alert.addAction(UIAlertAction(title: "Confirmar", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                self.pPacienteActualizar?.sNombre = self.tfNombre.text!
                self.pPacienteActualizar?.sTratamiento = self.tratamiento.text!
                self.pPacienteActualizar?.eEdad = Int16(self.edad.text!)!
                do{
                    try contexto.save()
                    let VCAltaPaciente = self.navigationController?.viewControllers[2]
                    self.navigationController?.popToViewController(VCAltaPaciente!, animated: true)
                } catch {
                    self.mostrarMensajeAlerta("Error", "No se actualizaron los datos")
                }//Accion para confirmar
                //let VCAltaPaciente = self.navigationController?.viewControllers[0]
                
            }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func mostrarMensajeAlerta(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
            //alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                            //Sign out action
            //}))
        self.present(alert, animated: true, completion: nil)
    }
    /*func cargarPacienteBuscado(){
        aPacientes[indexPath.item].sNombre
    }
    func buscarPacientes() {
        do{
            self.aPacientes = try contexto.fetch(EntidadPaciente.fetchRequest())
        } catch {
            mostrarMensaje("Error en la base de datos", "No se pudieron obtener los pacientes")
        }
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
