//
//  NetworkRequest.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import Foundation
import SwiftUI

class NetworkRequest: ObservableObject {
    @Published var cantieri = [Cantiere]()
    
    func loadCantieri() async throws{
        
        let finalUrl = APIRequest().url.appendingPathComponent("/Cantieri")
        var request = URLRequest(url: finalUrl)
        APIRequest().addHeaderToQuery(request: &request)
        
        let task = URLSession.shared.dataTask(with: request) {[weak self](data, response, error) in
            
            guard self != nil else {
                print(error as Any)
                return
            }
            
            guard error == nil, let data else {
                print(error ?? "Error unknown")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .secondsSince1970
                for c in try decoder.decode(Root.self, from: data).data {
                    self!.cantieri.append(c)
                }
                return
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
