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

    public init(id: Int, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}

extension Users: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case username = "Username"
        case password = "Password"
    }
}
