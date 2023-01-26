//
//  CurrencyApiCall.swift
//  CurrencyConverter
//
//  Created by Patrick Chen on 2023/1/26.
//

import SwiftUI

///Conversation Logic
class CurrencyApiManager: ObservableObject {
    
    @Published var currentCountry = flagConversion.usd
    @Published var otherCountry = flagConversion.twd
    @Published var convertedAmount = ""
    @Published var symbols = [String]()
    
    
    let popularCurrency = [flagConversion.usd,
                           flagConversion.eur,
                           flagConversion.jpy,
                           flagConversion.twd,
                           flagConversion.cad,
                           flagConversion.aud,
                           flagConversion.hkd,
                           flagConversion.cny,
                           flagConversion.sgd,
                           flagConversion.krw]
    
    var semaphore = DispatchSemaphore (value: 1)
    let decodder = JSONDecoder()
    

    func convertCurrency(currencyAmount: String){
        let curAmount = Float(currencyAmount) ?? 0
        let url = "https://api.apilayer.com/exchangerates_data/convert?to=\(otherCountry)&from=\(currentCountry)&amount=\(curAmount)"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("s1bQ54D0VFsFqICQDQKitUmlWX6TAdWG", forHTTPHeaderField: "apikey")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let result = try self.decodder.decode(ConvertionRate.self, from: data)
                DispatchQueue.main.async {
                    self.convertedAmount = String("\(round(result.result * 100)/100)")
                }
                print(self.convertedAmount)
            } catch {
                print(error)
            }
            self.semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
    
    func getSymbols() {
        let url = "https://api.apilayer.com/exchangerates_data/symbols"
        var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue("s1bQ54D0VFsFqICQDQKitUmlWX6TAdWG", forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let result = try self.decodder.decode(SymbolData.self, from: data)
                DispatchQueue.main.async {
                    self.symbols = result.symbols.map({$0.0})
                }
                print(String(data: data, encoding: .utf8)!)
                //print(self.$symbols.values)
            } catch {
                print(error)
            }
            self.semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
}
