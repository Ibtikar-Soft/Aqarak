//
//  StringFunc.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import Foundation


// chang arabic Number to En Number
class StringFunction{
    func numberStrToEnglish(numberStr: String )->String{
           let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
           let final = formatter.number(from: numberStr)
           return "\(final!)"
    }
}
