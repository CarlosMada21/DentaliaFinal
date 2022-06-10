//
//  TableViewControllerRecordatorio.swift
//  Dentalia
//
//  Created by Master Pain on 10/06/22.
//

import UIKit

class CeldaRecordatorio: UITableViewCell {
    
    @IBOutlet weak var lbRecordatorio: UILabel!
    
}

class TableViewControllerRecordatorio: UITableViewController {

    let contextoRecordatorio = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var aRecordatorios:[EntidadRecordatorio] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscarRecordatorios()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        self.buscarRecordatorios()
        self.tableView.reloadData()
    }
    func buscarRecordatorios() {
        do{
            aRecordatorios = try self.contextoRecordatorio.fetch(EntidadRecordatorio.fetchRequest())
        } catch {
            mostrarMensaje("Error en la base de datos", "No se pudieron obtener los recordatorios")
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celdaRecordatorio = tableView.dequeueReusableCell(withIdentifier: "TableViewCellRecordatorio") as! CeldaRecordatorio
        
        tableView.backgroundColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1)
        
        celdaRecordatorio.backgroundColor = UIColor(red: 52/255, green: 199/255, blue: 89/255, alpha: 1)
        
        
        celdaRecordatorio.lbRecordatorio.text = aRecordatorios[indexPath.item].sNota
        
        
        return celdaRecordatorio
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return aRecordatorios.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar", handler: {(_, _, completionHandle) in

            self.contextoRecordatorio.delete(self.aRecordatorios[indexPath.row])
            do{
                try self.contextoRecordatorio.save()
                self.buscarRecordatorios()
                self.tableView.reloadData()
            } catch {
                self.mostrarMensajeAlerta("Error", "No se borró el paciente")
            }

        })
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func mostrarMensaje(_ titulo: String, _ mensaje: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
            //alert.addAction(UIAlertAction(title: "Sign out", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in
                                            //Sign out action
            //}))
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
