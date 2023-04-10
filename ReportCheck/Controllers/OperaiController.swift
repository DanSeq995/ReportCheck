//
//  CantieriController.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import Foundation

extension OperaiView{
    
    func fetchOperai() {
        let finalUrl = APIRequest().url.appendingPathComponent("/Personale")
        print(finalUrl)
        var request = URLRequest(url: finalUrl)
        APIRequest().addHeaderToQuery(request: &request)
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            guard error == nil, let data else {
                print(error ?? "Error unknown")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .secondsSince1970
                print(data)
                for o in try decoder.decode(RootOperai.self, from: data).data {
                    self.operai.append(o)
                }
                return
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
