//
//  Webservice.swift
//  CryptoRxSwift
//
//  Created by Ömer on 29.09.2025.
//

import Foundation


enum WebserviceError: Error {
    case serverError
    case parsingError
    
}


class Webservice {
    
    
    func fetchData(url: URL,completion: @escaping (Result<[Crypto],Error>)->() ){
        
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let _ =  error {
                completion(.failure(WebserviceError.serverError))
            } else if let data = data {
                do {
                    let cryptoData = try JSONDecoder().decode([Crypto].self, from: data)
                    completion(.success(cryptoData))
                } catch {
                    completion(.failure(WebserviceError.parsingError))
                }
            }
        }
        
        
        
    }
    
    
    
}
