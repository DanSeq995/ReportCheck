//
//  LavorazioniController.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import Foundation

extension LavorazioniView{
    
    func fetchLavorazioni() {
        let finalUrl = APIRequest().url.appendingPathComponent("/Lavorazioni")
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
                for l in try decoder.decode(RootLavorazioni.self, from: data).data {
                    self.lavorazioni.append(l)
                }
                return
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
