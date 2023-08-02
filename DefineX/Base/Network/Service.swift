//
//  Service.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
import Alamofire
import Combine

enum APIError: Error {
    case requestFailed
    case decodingFailed
    // Add more error cases as needed
}

class Service {

    // MARK: - DiscoverPage Get Methods
        static func getFirstHorizontalList(onSucces: @escaping (Page?) -> Void, onError: @escaping (AFError) -> Void) {
            ServiceManager.shared.fetch(path: ApiCaller.ServiceEndPoint.getFirstHorizontalList(), token: UserDefaults.standard.getToken()) { (response: Page) in
                onSucces(response)
            } onError: { error in
                onError(error)
            }
        }

    static func getSecondHorizontalList(onSucces: @escaping (Page?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: ApiCaller.ServiceEndPoint.getSecondHorizontalList(), token: UserDefaults.standard.getToken()) { (response: Page) in
            onSucces(response)
        } onError: { error in
            onError(error)
        }
    }

    static func getThirthTwoColumnList(onSucces: @escaping (Page?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: ApiCaller.ServiceEndPoint.getThirthTwoColumnList(), token: UserDefaults.standard.getToken()) { (response: Page) in
            onSucces(response)
        } onError: { error in
            onError(error)
        }
    }
}
