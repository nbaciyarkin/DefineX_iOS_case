//
//  ServiceManager.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
import Alamofire
import Combine

class ServiceManager {
    static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    func fetch<T>(path: String, token: String, onSuccess: @escaping (T) -> Void, onError: @escaping (AFError) -> Void) where T: Codable {
        var headers: HTTPHeaders = [:]
        // Assuming you want to set the token as a header
        headers["token"] = UserDefaults.standard.getToken()

        AF.request(path, method: .get, headers: headers).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let model):
                onSuccess(model)
            case .failure(let error):
                onError(error)
            }
        }
    }

    func post<T: Codable>(path: String, parameters: Parameters) -> AnyPublisher<T, AFError> {
        return AF.request(path, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .eraseToAnyPublisher()
    }
}
