//
//  ViewControllerActualizarRecordatorio.swift
//  Dentalia
//
//  Created by Master Pain on 10/06/22.
//

import UIKit

class ViewControllerActualizarRecordatorio: UIViewController {
    @IBOutlet weak var tfRecordatorio: UITextField!
    @IBOutlet weak var tfDia: UITextField!
    @IBOutlet weak var tfMes: UITextField!
    @IBOutlet weak var tfAnio: UITextField!
    var pRecordatorioActualizar: EntidadRecordatorio?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func actualizarRecordatorio(_ sender: Any) {
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
