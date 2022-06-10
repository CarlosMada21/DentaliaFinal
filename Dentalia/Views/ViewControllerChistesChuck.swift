//
//  ViewControllerChistesChuck.swift
//  Dentalia
//
//  Created by Master Pain on 09/06/22.
//

import UIKit

class ViewControllerChistesChuck: UIViewController {

    @IBOutlet weak var lbChiste: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbChiste.text = buscarChiste()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cargarChiste(_ sender: Any) {
        self.lbChiste.text = buscarChiste()
    }
    func buscarChiste() -> String {
        var chiste_chuck=""
        let urlString = "https://api.chucknorris.io/jokes/random"

        if let url = URL(string: urlString){

            if let data = try? Data(contentsOf: url){

                let decodificador = JSONDecoder()

                if let chiste = try? decodificador.decode(chiste.self, from: data){
                    chiste_chuck=chiste.chiste_aleatorio
                }
            }
        }
        return chiste_chuck
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
//https://api.chucknorris.io/jokes/categories
//["animal","career","celebrity","dev","explicit","fashion","food","history","money","movie","music","political","religion","science","sport","travel"]



struct chiste: Codable{
    var chiste_aleatorio: String
//    var temperatura = 20.0
//    var descripcion = "Soleado"

    enum CodingKeys: String, CodingKey{
        case chiste_aleatorio = "value"
//        case temperatura = "main"
//        case descripcion = "weather"
    }
}
