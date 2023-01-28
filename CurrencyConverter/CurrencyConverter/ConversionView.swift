//
//  ConversionView.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/26.
//

import SwiftUI

struct ConversionView: View {
    
    @ObservedObject var calcLogic: CalculateLogic
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                List {
                    Picker("Current currency", selection: $calcLogic.currentCountry) {
                        ForEach(calcLogic.popularCurrency, id: \.self) {symbol in
                            Text("\(symbol.rawValue)")
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    Picker("Other currency", selection: $calcLogic.otherCountry) {
                        ForEach(calcLogic.popularCurrency, id: \.self) {symbol in
                            Text("\(symbol.rawValue)")
                        }
                    }
                    .pickerStyle(.automatic)
                }
            }
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
