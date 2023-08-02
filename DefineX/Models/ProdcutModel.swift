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
    let ratePercentage: Int?

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
