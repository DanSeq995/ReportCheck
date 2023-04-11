//
//  Reports.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 11/04/23.
//

import Foundation

public struct Reports: Identifiable {
    public var id = UUID()
    var data: String
    var cantiere: String
    var operai: String
    var mezzi: String?
    var lavorazioni: String?
    var nota: String
    var user: String

    public init(id: UUID = UUID(), data: String, cantiere: String, operai: String, mezzi: String? = nil, lavorazioni: String? = nil, nota: String, user: String) {
        self.id = id
        self.data = data
        self.cantiere = cantiere
        self.operai = operai
        self.mezzi = mezzi
        self.lavorazioni = lavorazioni
        self.nota = nota
        self.user = user
    }
}

extension Reports: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case data = "Data"
        case cantiere = "Cantiere"
        case operai = "Operai"
        case mezzi = "Mezzi"
        case lavorazioni = "Lavorazioni"
        case nota = "Nota"
        case user = "User"
    }
}

