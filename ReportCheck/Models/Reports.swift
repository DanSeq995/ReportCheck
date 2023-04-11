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
    var operai: [Operai]
    var mezzi: [Mezzi]?
    var lavorazioni: [Lavorazioni]?
    var nota: String
    var user: [Users]

    public init(id: UUID = UUID(), data: String, cantiere: String, operai: [Operai], mezzi: [Mezzi]? = nil, lavorazioni: [Lavorazioni]? = nil, nota: String, user: [Users]) {
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
