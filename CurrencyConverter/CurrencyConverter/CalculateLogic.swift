//
//  CalculateLogic.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2022/12/22.
//

import Foundation

/// Calculator Logic
class CalculateLogic: ObservableObject {
    @Published var currentValue = "0"
    @Published var savedValue: Float = 0
    @Published var currentOp: Operation = .none
    @Published var isConvert: Bool = false
    
    @Published var savedData = UserDefaults.standard
    
    func roundedValue(_ value: Float) -> Float {
        return round(value * 100) / 100
    }
    
    func processCommand(button: CalcButton) {
        switch button {
        case .add:
            currentOp = .add
            savedValue = Float(currentValue) ?? 0
            currentValue = "0"
        case .substract:
            currentOp = .substract
            savedValue = Float(currentValue) ?? 0
            currentValue = "0"
        case .multiply:
            currentOp = .multiply
            savedValue = Float(currentValue) ?? 0
            currentValue = "0"
        case .divide:
            currentOp = .divide
            savedValue = Float(currentValue) ?? 0
            currentValue = "0"
        case .percent:
            let curr = Float(currentValue) ?? 0
            currentValue = "\(Float(curr)/100.0)"
        case .equal:
            let current = Float(currentValue) ?? 0
            switch currentOp {
            case .add:
                currentValue = "\(roundedValue(savedValue + current))"
                savedValue = 0
            case .substract:
                currentValue = "\(roundedValue(savedValue - current))"
                savedValue = 0
            case .multiply:
                currentValue = "\(roundedValue(savedValue * current))"
                savedValue = 0
            case .divide:
                currentValue = "\(roundedValue(Float(savedValue) / Float(current)))"
                savedValue = 0
            case .none:
                break
            }
        case .back:
            if currentValue == "0" {
                break
            } else if currentValue.count == 1 && currentValue != "0" {
                currentValue = "0"
            } else {
                currentValue.removeLast()
            }
        case .clear:
            currentValue = "0"
            savedValue = 0
        case .convert:
            savedValue = Float(currentValue) ?? 0
            isConvert = true
        default:
            if currentValue == "0" {
                if button == .decimal {
                    currentValue += button.rawValue
                } else {
                    currentValue = button.rawValue
                }
            } else {
                currentValue += button.rawValue
            }
        }
    }
}
