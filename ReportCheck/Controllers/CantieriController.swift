//
//  CantieriController.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import Foundation

extension CantieriView{
    func fetchCantieri() {
        let finalUrl = APIRequest().url.appendingPathComponent("/Cantieri")
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
                
                for c in try decoder.decode(RootCantiere.self, from: data).data {
                    self.cantieri.append(c)
                }
                return
            }catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func formatDateToString() -> String {
        let today = date
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        formatter1.dateFormat = "dd-MM-yyyy"
        let finalDate = formatter1.string(from: today)
        return finalDate
    }
}
