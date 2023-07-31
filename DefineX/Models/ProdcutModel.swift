//
//  ProdcutModel.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
// MARK: - Welcome
struct Page: Codable {
    let isSuccess: Bool?
    let message, statusCode: String?
    let list: [Product]?
}

// MARK: - List
struct Product: Codable {
    let imageUrl: String?
    let description: String?
    let price, oldPrice: Price?
    let discount: String?
    let ratePercentage: JSONNull?

    enum CodingKeys: String, CodingKey {
        case imageUrl
        case description, price, oldPrice, discount, ratePercentage
    }
}

// MARK: - Price
struct Price: Codable {
    let value: Double?
    let currency: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

