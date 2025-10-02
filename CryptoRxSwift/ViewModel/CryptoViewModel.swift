//
//  CryptoViewModel.swift
//  CryptoRxSwift
//
//  Created by Ömer on 3.10.2025.
//

import Foundation

class CryptoViewModel {
    
  
    func RequestData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { cryptoResult in
            
            switch cryptoResult {
            case .success(let cryptos):
                print(cryptos)
              
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
}
