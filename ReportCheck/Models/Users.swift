//
//  Cantieri.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import Foundation

struct RootUsers: Decodable {
    let data: [Users]
    enum CodingKeys: String, CodingKey{
        case data = "value"
    }
}

public struct Users: Identifiable {
    public var id: Int
    var username: String
    var password: String
    var nome: String
    var cognome: String
    var cNomeCompleto: String
    var oreLavorate: String = ""

    public init(id: Int, username: String, password: String, nome: String, cognome: String, cNomeCompleto: String) {
        self.id = id
        self.username = username
        self.password = password
        self.nome = nome
        self.cognome = cognome
        self.cNomeCompleto = cNomeCompleto
    }
}

extension Users: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case username = "Username"
        case password = "Password"
        case nome = "Nome"
        case cognome = "Cognome"
        case cNomeCompleto = "cNomecompleto"
    }
}
