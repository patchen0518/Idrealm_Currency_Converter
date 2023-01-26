//
//  ConversionView.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/26.
//

import SwiftUI

struct ConversionView: View {
    
    @StateObject var currencyObject: CurrencyApiManager = CurrencyApiManager()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Picker("Current currency", selection: $currencyObject.currentCountry) {
                    
                }
                .pickerStyle(.automatic)
                
                Text("Selected Option: \(currencyObject.currentCountry)")
            }
        }
        .task {
            currencyObject.getSymbols()
        }
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
