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
      //  buscarPacientes()
        //cargarPacienteBuscado()
        // Do any additional setup after loading the view.
        self.tratamiento.text = self.pPacienteActualizar?.sTratamiento
        self.edad.text = "\(self.pPacienteActualizar?.eEdad ?? 00)"
        self.tfNombre.text = self.pPacienteActualizar?.sNombre
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
