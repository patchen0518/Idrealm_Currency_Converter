//
//  CalcButton.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/25.
//

import SwiftUI

enum CalcButton: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case add = "+"
    case substract = "-"
    case divide = "÷"
    case multiply = "x"
    case equal = "="
    case clear = "C"
    case percent = "%"
    case decimal = "."
    case convert = "$"
    case back = "←"
    
    var buttonColor: Color {
        switch self {
        case .divide, .multiply, .substract, .add, .equal:
            return Color(uiColor: UIColor(red: 0.29, green: 0.37, blue: 0.99, alpha: 1.00))
        case .clear, .percent, .back:
            return Color(uiColor: UIColor(red: 0.31, green: 0.31, blue: 0.37, alpha: 1.00))
        case .convert:
            return Color(uiColor: UIColor(red: 1.00, green: 0.54, blue: 0.00, alpha: 1.00))
        default:
            return Color(UIColor(red: 0.18, green: 0.18, blue: 0.22, alpha: 1.00))
        }
    }
}

enum Operation {
    case add, substract, multiply, divide, none
}

enum flagConversion: String {
    case usd = "🇺🇸 USD"
    case twd = "🇹🇼 TWD"
    case eur = "🇪🇺 EUR"
    case jpy = "🇯🇵 JPY"
    case cad = "🇨🇦 CAD"
    case aud = "🇦🇺 AUD"
    case hkd = "🇭🇰 HKD"
    case cny = "🇨🇳 CNY"
    case sgd = "🇸🇬 SGD"
    case krw = "🇰🇷 KRW"
}
