//
//  ViewControllerRecordatorio.swift
//  Dentalia
//
//  Created by Master Pain on 10/06/22.
//

import UIKit

class ViewControllerRecordatorio: UIViewController {

    @IBOutlet weak var lbRecordatorio: UITextField!
    @IBOutlet weak var lbAnio: UITextField!
    @IBOutlet weak var lbMes: UITextField!
    @IBOutlet weak var lbDia: UITextField!
    let contextoRecordatorio = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var aRecordatorios:[EntidadRecordatorio] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func agregarRecordatorio(_ sender: Any) {
        let erNuevoRecordatorio = EntidadRecordatorio(context: self.contextoRecordatorio)
        erNuevoRecordatorio.sNota = self.lbRecordatorio.text!
        erNuevoRecordatorio.sFecha = "\(self.lbDia.text!)/\(self.lbMes.text!)/\(self.lbAnio.text!)"
        do{
            try self.contextoRecordatorio.save()
            mostrarMensaje("Guardado exitoso", "El recordatorio fue registrado con éxito")
            self.lbRecordatorio.text = ""
            self.lbDia.text = ""
            self.lbMes.text = ""
            self.lbAnio.text = ""
        } catch {
            
            mostrarMensaje("No se pudo guardar", "El recordatorio no fue registrado")
        }
        
    }
    
    func mostrarMensaje(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
            //alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                            //Sign out action
            //}))
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func listarRecordatorios(_ sender: Any) {
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
