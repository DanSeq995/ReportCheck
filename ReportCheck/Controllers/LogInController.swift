//
//  LogInController.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import Foundation

extension LogInView{
    func logIn(username:String, password:String) {
        let finalUrl = APIRequest().url.appendingPathComponent("/Users")
        var request = URLRequest(url: finalUrl)
        APIRequest().addHeaderToQuery(request: &request, method: "GET")
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            guard error == nil, let data else {
                print(error ?? "Error unknown")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .secondsSince1970
                let users = try decoder.decode(RootUsers.self, from: data).data
                
                for user in users {
                    if username == user.username && password == user.password {
                        let user = Users(id: user.id, username: user.username, password: user.password, nome: user.nome, cognome: user.cognome, cNomeCompleto: user.cNomeCompleto)
                        print(user)
                        postUser.append(user)
                        viewState = .cantieri
                    } else {
                        alertWrongCredentials = true
                    }
                }
                return
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
