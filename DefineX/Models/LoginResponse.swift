//
//  LoginResponse.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
struct LoginResponse: Codable {
    let isSuccess: Bool?
    let message: String?
    let statusCode: Int?
    let token: String?
}
