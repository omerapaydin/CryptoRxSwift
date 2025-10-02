//
//  CryptoViewModel.swift
//  CryptoRxSwift
//
//  Created by Ömer on 3.10.2025.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {
    
    
    let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
  
    func RequestData() {
        
        self.loading.onNext(true)
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Webservice().downloadCurrencies(url: url) { cryptoResult in
            self.loading.onNext(false)
            switch cryptoResult {
            case .success(let cryptos):
                self.cryptos.onNext(cryptos)
              
            case .failure(let error):
                switch error {
                case .parsingError:
                    self.error.onNext("Parsing Error")
                case .serverError:
                    self.error.onNext("Server Error")
                
                }
            }
        }
    }
    
    
    
    
    
}
