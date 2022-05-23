//
//  ViewControllerPacientes.swift
//  Dentalia
//
//  Created by Master Pain on 28/04/22.
//

import UIKit

class ViewControllerPacientes: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var aPacientes: [Paciente] = [Paciente(), Paciente(edad: 21, nombre: "Carlos", tratamiento: "")]
    
    
    @IBOutlet weak var tvPacientes: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aPacientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaMenuPacientes = tableView.dequeueReusableCell(withIdentifier: "TableViewCellPacientes") as! CeldaPacientes
        /*let p1: Paciente = aPacientes[indexPath.item]
        
        celdaMenuPacientes.lbNombre.text = p1.sNombre
        celdaMenuPacientes.lbEdad.text = String(p1.eEdad)
        celdaMenuPacientes.lbTratamiento.text = p1.tTratamiento.sNombre
        */
        /*celdaMenuPacientes.lbNombre.text = "lop"
        celdaMenuPacientes.lbEdad.text = "po"
        celdaMenuPacientes.lbTratamiento.text = ""
        */
        return celdaMenuPacientes
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tvPacientes.dataSource = self
        tvPacientes.delegate = self
        // Do any additional setup after loading the view.
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

class CeldaPacientes: UITableViewCell{
   
}
