//
//  SymbolData.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/26.
//

import Foundation

struct SymbolData: Codable, Identifiable{
    let id = UUID()
    let success: Bool
    //let symbols: [detailSymbol]
    let symbols: [String:String]
}

//struct detailSymbol: Codable, Identifiable {
//    let id = UUID()
//    let shortName : String
//    let longName : String
//}
