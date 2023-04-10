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
    var targa: String

    public init(id: Int, targa: String) {
        self.id = id
        self.targa = targa
    }
}

extension Mezzi: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case targa = "Targa"
    }
}
