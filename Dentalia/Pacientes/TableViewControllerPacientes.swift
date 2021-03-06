//
//  TableViewControllerPacientes.swift
//  Dentalia
//
//  Created by Master Pain on 28/04/22.
//

import UIKit

class CeldaPaciente:  UITableViewCell{
    
    @IBOutlet weak var lnNombre: UILabel!

}

class TableViewControllerPacientes: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscarPacientes()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        buscarPacientes()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    func buscarPacientes() {
        do{
            aPacientes = try contexto.fetch(EntidadPaciente.fetchRequest())
        } catch {
            mostrarMensaje("Error en la base de datos", "No se pudieron obtener los pacientes")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aPacientes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celdaMenuPacientes = tableView.dequeueReusableCell(withIdentifier: "TableViewCellPacientes") as! CeldaPaciente
        
        tableView.backgroundColor = UIColor(red: 36/255, green: 153/255, blue: 255/255, alpha: 1)
        celdaMenuPacientes.backgroundColor = UIColor(red: 36/255, green: 153/255, blue: 255/255, alpha: 1)
        
        celdaMenuPacientes.lnNombre.text = aPacientes[indexPath.item].sNombre
        
        
        return celdaMenuPacientes
    }
    func mostrarMensaje(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
            //alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                            //Sign out action
            //}))
            self.present(alert, animated: true, completion: nil)
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //if indexPath.row <= 0 || indexPath.row > 0 {
        let VCActualizar = storyboard?.instantiateViewController (identifier: "VCActualizarPaciente") as? ViewControllerActualizarPaciente
        VCActualizar?.pPacienteActualizar = aPacientes[indexPath.row]
        navigationController?.pushViewController(VCActualizar!, animated: true)
        
        //}
        
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar", handler: {(_, _, completionHandle) in

            contexto.delete(aPacientes[indexPath.row])
            do{
                try contexto.save()
                self.buscarPacientes()
                self.tableView.reloadData()
            } catch {
                self.mostrarMensajeAlerta("Error", "No se borr?? el paciente")
            }

        })
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        /*if segue.identifier == "ActualizarPaciente"{
            let VCActualizar = storyboard?.instantiateViewController (identifier: "VCActualizarPaciente") as? ViewControllerActualizarPaciente
            navigationController?.pushViewController(VCActualizar!, animated: true)
        }*/
    }
    func mostrarMensajeAlerta(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
            //alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                            //Sign out action
            //}))
        self.present(alert, animated: true, completion: nil)
    }
    
}
