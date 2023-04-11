//
//  Mezzi Controller.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import Foundation

extension MezziView{
    
    func fetchMezzi() {
        let finalUrl = APIRequest().url.appendingPathComponent("/Mezzi")
        print(finalUrl)
        var request = URLRequest(url: finalUrl)
        APIRequest().addHeaderToQuery(request: &request, method: "GET")
        
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
                for m in try decoder.decode(RootMezzi.self, from: data).data {
                    self.mezzi.append(m)
                }
                return
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
