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
            return .blue
        case .clear, .percent, .back:
            return Color(.lightGray)
        case .convert:
            return Color(.systemYellow)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, substract, multiply, divide, none
}
