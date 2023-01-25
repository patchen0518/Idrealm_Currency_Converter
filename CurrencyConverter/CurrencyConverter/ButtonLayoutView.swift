//
//  ButtonLayoutView.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2022/12/22.
//

import SwiftUI

struct ButtonLayoutView: View {
    
    var processCommand: CalculateLogic
    
    let buttonLayout:[[CalcButton]] = [
        [.clear, .percent, .back, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .substract],
        [.one, .two, .three, .add],
        [.decimal, .zero, .convert, .equal]
    ]
    
    var body: some View {
        VStack {
            ForEach(buttonLayout, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button {
                            processCommand.processCommand(button: item)
                        } label: {
                            Text(item.rawValue)
                                .foregroundColor(Color.white)
                                .font(.system(size: 48))
                                .frame(width: (UIScreen.main.bounds.width - 60) / 4, height: (UIScreen.main.bounds.width - 120) / 4)
                                .background(item.buttonColor)
                                .cornerRadius(24)
                        }
                    }
                }
            }
        }
    }
}

struct ButtonLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
