//
//  Main.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2022/12/22.
//

import SwiftUI

struct MainView: View {
    
    ///Calculator Object
    @StateObject var calcLogic: CalculateLogic = CalculateLogic()
    ///Currency Logic Object
    @StateObject var currencyObject: CurrencyApiManager = CurrencyApiManager()
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack {
                    //Claculation Section
                        VStack {
                            HStack {
                                Spacer()
                                Text(String(calcLogic.savedValue))
                                    .bold()
                                    .font(.system(size: 50))
                                    .foregroundColor(Color.gray.opacity(0.5))
                            }
                            .padding(.horizontal)
                            HStack {
                                Spacer()
                                Text(calcLogic.currentValue)
                                    .bold()
                                    .font(.system(size: 100))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                        .ignoresSafeArea()
                    
                    //Calculator panel
                    VStack {
                        ButtonLayoutView(processCommand: calcLogic)
                    }
                }
            }
        }
        .sheet(isPresented: $calcLogic.isConvert) {
            ConversionView(currencyObject: currencyObject, calcLogic: calcLogic)
        }
        .task {
            currencyObject.getSymbols()
//            guard let data = calcLogic.savedData.object(forKey: "savedSymbol") as? [String] else {
//                currencyObject.getSymbols()
//                calcLogic.savedData.set(currencyObject.symbols, forKey: "savedSymbol")
//                return
//            }
//            currencyObject.symbols = data
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
