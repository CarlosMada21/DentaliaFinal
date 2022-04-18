//
//  Calendario.swift
//  Dentalia
//
//  Created by Master Pain on 18/04/22.
//

import Foundation
import UIKit

class Calendario{
    let calendario = Calendar.current
    func plusMonth(date: Date) -> Date{
        return calendario.date(byAdding: .month, value: 1, to: date)!
    }
    func minusMonth(date: Date) -> Date{
        return calendario.date(byAdding: .month, value: -1, to: date)!
    }
    func monthString(date: Date) -> String {
        let formatoFecha = DateFormatter()
        formatoFecha.dateFormat = "LLLL"
        return formatoFecha.string(from: date)
    }
    func yearString(date: Date) -> String {
        let formatoFecha = DateFormatter()
        formatoFecha.dateFormat = "yyyy"
        return formatoFecha.string(from: date)
    }
    func daysInMonth(date: Date) -> Int {
        let rango = calendario.range(of: .day, in: .month, for: date)!
        return rango.count
    }
    func dayOfMonth(date: Date) -> Int {
        let componentes = calendario.dateComponents([.day], from: date)
        return componentes.day!
    }
    func firstOfMonth(date: Date) -> Date {
        let componentes = calendario.dateComponents([.year, .month], from: date)
        return calendario.date(from: componentes)!
    }
    func weekDay(date: Date) -> Int {
        let componentes = calendario.dateComponents([.weekday], from: date)
        return componentes.weekday! - 1
    }
}
