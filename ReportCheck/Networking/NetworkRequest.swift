//
//  NetworkRequest.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import Foundation
import SwiftUI

class NetworkRequest: ObservableObject {
    @Published var isLog: Bool!
    @Published var cantieri = [Cantiere]()
    
    func logIn(username:String, password:String) async throws {
        let finalUrl = APIRequest().url.appendingPathComponent("/Users")
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
                let users = try decoder.decode(RootUsers.self, from: data).data
                
                for user in users {
                    if username == user.username && password == user.password {
                        self?.isLog = true
                    } else {
                        self?.isLog = false
                    }
                }
                return
            }catch {
                print(error)
            }
            
        }
        task.resume()
    }
    
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
                for c in try decoder.decode(RootCantiere.self, from: data).data {
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
