
//http://numbersapi.com/random/trivia?json
//  ViewControllerMateCuriosas.swift
//  Dentalia
//
//  Created by Master Pain on 09/06/22.
//

import UIKit

class ViewControllerMateCuriosas: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.lbChiste.text = buscarCurioso()
        // Do any additional setup after loading the view.
    }
    @IBAction func cargarChiste(_ sender: Any) {
        //self.lbChiste.text = buscarCurioso()
    }
    func buscarCurioso() -> String {
        var datoRegresado=""
        let urlString = "http://numbersapi.com/random/trivia?json"

        if let url = URL(string: urlString){

            if let data = try? Data(contentsOf: url){

                let decodificador = JSONDecoder()

                if let datoCuriosoMate = try? decodificador.decode(datoMate.self, from: data){
                    datoRegresado = datoCuriosoMate.curioso
                }
            }
        }
        return datoRegresado
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



struct datoMate: Codable{
    var curioso: String
//    var temperatura = 20.0
//    var descripcion = "Soleado"

    enum CodingKeys: String, CodingKey{
        case curioso = "text"
//        case temperatura = "main"
//        case descripcion = "weather"
    }
}
