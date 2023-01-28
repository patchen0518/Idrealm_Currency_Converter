//
//  SymbolData.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/26.
//

import Foundation

struct SymbolData: Codable{
    let success: Bool
    let symbols: [String:String]
}

struct ConvertionRate: Codable {
    let result: Double
}
