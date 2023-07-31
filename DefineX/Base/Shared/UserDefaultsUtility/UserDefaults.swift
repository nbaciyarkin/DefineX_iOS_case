//
//  UserDefaultsUtility.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation

import Foundation
extension UserDefaults {
    
    enum UserDefaultKeys: String {
        case IsAuthanticated
        case AuthToken
    }

    func setAuthanticatedUser(value: Bool){
        set(value,forKey: UserDefaultKeys.IsAuthanticated.rawValue)
        synchronize()
    }
    
    func isUserAuthanticated() -> Bool {
        return bool(forKey: UserDefaultKeys.IsAuthanticated.rawValue)
    }
    
    func setToken(value: String){
        set(value,forKey: UserDefaultKeys.AuthToken.rawValue)
        synchronize()
    }
    
    func getToken() -> String {
        return string(forKey: UserDefaultKeys.AuthToken.rawValue) ?? ""
    }
}
