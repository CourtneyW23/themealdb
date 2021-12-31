//
//  ServiceClient.swift
//  themealdb
//
//  Created by Courtney Williams on 12/23/21.
//

import Foundation

final class ServiceClient {
    func get(from url: URL, completion: @escaping (Result<Data, Error>) -> ()) {
   
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let data = data {
            //print(data)
                do {
                //let data = try result.get()
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                }catch {
                    print(error)
                    
                }
            }
            
        }
            session.resume()
    }
}
