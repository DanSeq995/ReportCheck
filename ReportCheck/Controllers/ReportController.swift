//
//  ReportController.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import SwiftUI

extension ReportView{
    
    func createReport() {
        var operaiString: String = ""
        var mezziString: String = ""
        var lavorazioniString: String = ""
        var userString: String = ""
        
        for operai in postOperai {
            let castString = "\(operai.cNomeCompleto) ha lavorato \(operai.oreLavorate) ore ---"
            operaiString += castString
        }
        for user in postUser {
            let castString = "\(user.cNomeCompleto) ha lavorato \(user.oreLavorate) ore"
            userString += castString
        }
        
        guard let postMezzi = postMezzi, let postLavorazioni = postLavorazioni else {
            print("No mezzi")
            return
        }
        for mezzi in postMezzi {
            let castString = "Mezzo: \(mezzi.targa)"
            mezziString += castString
        }
        
        for lavorazioni in postLavorazioni {
            let castString = "Effettuata \(lavorazioni.nome) per \(lavorazioni.quantità) \(lavorazioni.tipo) ---"
            lavorazioniString += castString
        }
        
        let report: Dictionary<String, String> = [
            "Id" : "\(UUID())",
            "Data" : postDate,
            "Cantiere" : postCantiere,
            "Operai" : operaiString,
            "Mezzi" : mezziString,
            "Lavorazioni" : lavorazioniString,
            "Nota" : postNote ?? "",
            "User" : userString
        ]
        
        self.report = report
    }
    
    func sendReport(report: Dictionary<String, String>) {
        
        let finalUrl = APIRequest().url.appendingPathComponent("/Reports")
        var request = URLRequest(url: finalUrl)
        APIRequest().addHeaderToQuery(request: &request, method: "POST")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonEncoder: JSONEncoder = JSONEncoder.init()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        let body: Data  = try! jsonEncoder.encode(report)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, resoponse, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data else {
                print("No data")
                return
            }

            guard let resoponse = resoponse as? HTTPURLResponse else {
                print("Error: not a valid HTTP response")
                return
            }

            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }

            print("Status code: \(resoponse.statusCode)")
            print("Response body: \(String(data: data, encoding: .utf8) ?? "")")
        }
        task.resume()
    }
}
