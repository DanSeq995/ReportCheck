//
//  Lavorazioni.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import Foundation

struct RootLavorazioni: Decodable {
    let data: [Lavorazioni]
    enum CodingKeys: String, CodingKey{
        case data = "value"
    }
}

public struct Lavorazioni: Identifiable {
    public var id: Int
    var nome: String
    var tipo: String
    var quantità: String

    public init(id: Int, nome: String, tipo: String, quantità: String) {
        self.id = id
        self.nome = nome
        self.tipo = tipo
        self.quantità = quantità
    }
}

extension Lavorazioni: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case nome = "Nome"
        case tipo = "Tipo"
        case quantità = "Quantità"
    }
}
