//
//  CalculateLogic.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2022/12/22.
//

import Foundation

class CalculateLogic: ObservableObject {
    @Published var currentValue = "0"
    @Published var savedValue: Float = 0
    @Published var currentOp: Operation = .none
    
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
                currentValue = "\(savedValue + current)"
                savedValue = 0
            case .substract:
                currentValue = "\(savedValue - current)"
                savedValue = 0
            case .multiply:
                currentValue = "\(savedValue * current)"
                savedValue = 0
            case .divide:
                currentValue = "\(round(Float(savedValue) / Float(current) * 100) / 100)"
                savedValue = 0
            case .none:
                break
            }
        case .back:
            currentValue.removeLast()
        case .clear:
            currentValue = "0"
        case .convert:
            savedValue = Float(currentValue) ?? 0
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
