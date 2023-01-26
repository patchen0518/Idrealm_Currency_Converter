//
//  ConversionView.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/26.
//

import SwiftUI

struct ConversionView: View {
    
    @ObservedObject var currencyObject: CurrencyApiManager
    @ObservedObject var calcLogic: CalculateLogic
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                List {
                    Picker("Current currency", selection: $currencyObject.currentCountry) {
                        ForEach(currencyObject.popularCurrency, id: \.self) {symbol in
                            Text("\(symbol.rawValue)")
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    Picker("Other currency", selection: $currencyObject.otherCountry) {
                        ForEach(currencyObject.popularCurrency, id: \.self) {symbol in
                            Text("\(symbol.rawValue)")
                        }
//                        ForEach(currencyObject.symbols.sorted(by: <), id: \.self) {symbol in
//                            Text("\(symbol)")
//                        }
                    }
                    .pickerStyle(.automatic)
                    
                    Button {
                        currencyObject.convertCurrency(currencyAmount: calcLogic.currentValue)
                    } label: {
                        Text("Convert")
                    }
                    
                    Text("Convertion result: $\(currencyObject.convertedAmount) dollars")
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
