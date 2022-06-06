//
//  ViewController.swift
//  Dentalia
//
//  Created by Master Pain on 31/03/22.
//

import UIKit
let contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var aPacientes:[EntidadPaciente] = []
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var TableViewPrincipal: UITableView!
    let opcionesMenuPrincipal: [String] = ["Agenda", "Pacientes", "Tratamiento", "Historia Clínica", "Presupuesto", "Recordatorios"]
    let imagenesMenuPrincipal: [String] = ["calendar", "person.circle", "square.and.pencil", "waveform.path.ecg.rectangle", "dollarsign.circle.fill", "note"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewPrincipal.delegate = self
        TableViewPrincipal.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcionesMenuPrincipal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaMenuPrincipal:UITableViewCell=UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "celdaMenuPrincipal")
        //Icono para cada opcion del menu
        celdaMenuPrincipal.imageView!.image = UIImage(systemName: imagenesMenuPrincipal[indexPath.row])!
        //celdaMenuPrincipal.imageView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        
        //celdaMenuPrincipal.imageView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        //Texto para cada opcion del menu
        celdaMenuPrincipal.textLabel?.text  = opcionesMenuPrincipal[indexPath.row]
        celdaMenuPrincipal.backgroundColor = UIColor(red: 36/255, green: 153/255, blue: 255/255, alpha: 1)
        
        celdaMenuPrincipal.textLabel?.textColor = UIColor.white
        
        return celdaMenuPrincipal
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
            case 0: let VCCalendario = storyboard?.instantiateViewController (identifier: "Calendario") as? ViewControllerCalendario
                navigationController?.pushViewController(VCCalendario!, animated: true)
                break
            case 1: let TBCPacientes = storyboard?.instantiateViewController(withIdentifier: "TBCPacientes")//UITableViewController
                navigationController?.pushViewController(TBCPacientes!, animated: true)
                break
            case 2: let VCPacientes = storyboard?.instantiateViewController (identifier: "VCPacientes") as? ViewControllerCalendario
                navigationController?.pushViewController(VCPacientes!, animated: true)
                break
            case 3: let VCPacientes = storyboard?.instantiateViewController (identifier: "VCPacientes") as? ViewControllerCalendario
                navigationController?.pushViewController(VCPacientes!, animated: true)
                break
            case 4: let VCPacientes = storyboard?.instantiateViewController (identifier: "VCPacientes") as? ViewControllerCalendario
                navigationController?.pushViewController(VCPacientes!, animated: true)
                break
            case 5: let VCPacientes = storyboard?.instantiateViewController (identifier: "VCPacientes") as? ViewControllerCalendario
                navigationController?.pushViewController(VCPacientes!, animated: true)
                break
            default:
                print("Sin selección")
        }
    }
 
}



