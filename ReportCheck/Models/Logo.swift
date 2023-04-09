//
//  Logo.swift
//  ReportCheck
//
//  Created by Danilo Sequino on 09/04/23.
//

import Foundation
import SwiftUI

struct RootLogo: Decodable {
    let data: [Logo]
    enum CodingKeys: String, CodingKey{
        case data = "value"
    }
}

public struct Logo: Identifiable {
    public var id: Int
    var image: Data
    
    public init(id: Int, image: Data) {
        self.id = id
        self.image = image
    }
}

extension Logo: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case image = "Image"
    }
}
