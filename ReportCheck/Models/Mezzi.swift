//
//  Mezzi.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 10/04/23.
//

import Foundation

struct RootMezzi: Decodable {
    let data: [Mezzi]
    enum CodingKeys: String, CodingKey{
        case data = "value"
    }
}

public struct Mezzi: Identifiable {
    public var id: Int
    var nome: String
    var cognome: String
    var cNomeCompleto: String
    var oreLavorate: String = ""

    public init(id: Int, nome: String, cognome: String, cNomeCompleto: String) {
        self.id = id
        self.nome = nome
        self.cognome = cognome
        self.cNomeCompleto = cNomeCompleto
    }
}

extension Mezzi: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case nome = "Nome"
        case cognome = "Cognome"
        case cNomeCompleto = "cNomecompleto"
    }
}
