//
//  ViewControllerMateAPI.swift
//  Dentalia
//
//  Created by Master Pain on 09/06/22.
//

import UIKit

class ViewControllerMateAPI: UIViewController {

    @IBOutlet weak var lbCurioso: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbCurioso.text = buscarCurioso()
        
    }
    @IBAction func cargarChiste(_ sender: Any) {
        self.lbCurioso.text = buscarCurioso()
    }
    func buscarCurioso() -> String {
        var datoRegresado=""
        let urlString = "http://numbersapi.com/random/trivia?json"

        if let url = URL(string: urlString){

            if let data = try? Data(contentsOf: url){

                let decodificador = JSONDecoder()
                print("los")
                if let datoCuriosoMate = try? decodificador.decode(datoMate.self, from: data){
                    datoRegresado = datoCuriosoMate.curioso
                    print(datoRegresado)
                    print("Holaaa")
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

struct datoMate: Codable{
    var curioso: String

    enum CodingKeys: String, CodingKey{
        case curioso = "text"
    }
}




