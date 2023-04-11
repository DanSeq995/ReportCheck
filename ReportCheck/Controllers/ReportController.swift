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
//        let report = Reports(data: postDate,
//                             cantiere: postCantiere,
//                             operai: postOperai,
//                             mezzi: postMezzi ?? [Mezzi](),
//                             lavorazioni: postLavorazioni ?? [Lavorazioni](),
//                             nota: postNote ?? "", user: postUser)
        for operai in postOperai {
            let castString = "\(operai.cNomeCompleto) ha lavorato \(operai.oreLavorate) ore\n"
            operaiString += castString
        }
        print(operaiString)
    }
    
    func sendReport(report: Reports) {
        let finalUrl = APIRequest().url.appendingPathComponent("/Reports")
        print(finalUrl)
        var request = URLRequest(url: finalUrl)
        APIRequest().addHeaderToQuery(request: &request, method: "POST")
        request.httpBody = try? JSONSerialization.data(withJSONObject: report)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, resoponse, error in
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
            
            print("Status code: \(resoponse.statusCode)")
            print("Response body: \(String(data: data, encoding: .utf8) ?? "")")
        }
        task.resume()
    }
}
