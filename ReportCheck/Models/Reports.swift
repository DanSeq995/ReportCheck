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

    public init(id: UUID = UUID(), data: String, cantiere: String, operai: [Operai], mezzi: [Mezzi], lavorazioni: [Lavorazioni], nota: String) {
        self.id = id
        self.data = data
        self.cantiere = cantiere
        self.operai = operai
        self.mezzi = mezzi
        self.lavorazioni = lavorazioni
        self.nota = nota
    }
}
