//
//  Cantieri.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 07/04/23.
//

import Foundation

struct Root: Decodable {
    let data: [Cantiere]
    enum CodingKeys: String, CodingKey{
        case data = "value"
    }
}

public struct Cantiere: Identifiable {
    public var id: Int
    var nazione: String
    var città: String
    var zona: String
    var località: String
    
    public init(id: Int, nazione: String, città: String, zona: String, località: String) {
        self.id = id
        self.nazione = nazione
        self.città = città
        self.zona = zona
        self.località = località
    }
}

extension Cantiere: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case nazione = "Nazione"
        case città = "Città"
        case zona = "Zona"
        case località = "cLocalità"
    }
}
