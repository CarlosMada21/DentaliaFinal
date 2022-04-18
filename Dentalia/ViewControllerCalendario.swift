//
//  ViewControllerCalendario.swift
//  Dentalia
//
//  Created by Master Pain on 18/04/22.
//

import UIKit

class ViewControllerCalendario: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var lbMes: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fechaSeleccionada = Date()
    var cuadradosTotales = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
        // Do any additional setup after loading the view.
    }
    
    func setCellsView() {
        let ancho = (collectionView.frame.size.width - 2) / 8
        let altura = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: ancho, height: altura)
        
    }
    
    func setMonthView(){
        cuadradosTotales.removeAll()
        let diasEnMes = Calendario().daysInMonth(date: fechaSeleccionada)
        let primerDiaDelMes = Calendario().firstOfMonth(date: fechaSeleccionada)
        let espaciosInicio = Calendario().weekDay(date: primerDiaDelMes)
        var count : Int = 1
        
        while(count <= 42){
            if(count <= espaciosInicio || count - espaciosInicio > diasEnMes){
                cuadradosTotales.append("")
            } else {
                cuadradosTotales.append(String(count - espaciosInicio))
            }
            count += 1
        }
        
        lbMes.text = Calendario().monthString(date: fechaSeleccionada) + " " + Calendario().yearString(date: fechaSeleccionada)
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarioCell
        cell.lbDiaMes.text = cuadradosTotales[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cuadradosTotales.count
    }
    
    @IBAction func mesAnterior(_ sender: Any) {
        fechaSeleccionada = Calendario().minusMonth(date: fechaSeleccionada)
        setMonthView()
    }
    
    @IBAction func mesSiguiente(_ sender: Any) {
        fechaSeleccionada = Calendario().plusMonth(date: fechaSeleccionada)
        setMonthView()
    }
    override open var shouldAutorotate: Bool{
        return false
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
