//
//  APIRequest.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import Foundation

class APIRequest{
    
    var url = URL(string: "https://napoli.fm-testing.com/fmi/odata/v4/ReportCheck")!
    let username = "admin"
    let password = "admin"
    var session: URLSession = .shared
    
    func addHeaderToQuery(request: inout URLRequest, method: String){
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        request.httpMethod = method
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    }
}
