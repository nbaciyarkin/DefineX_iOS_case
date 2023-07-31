//
//  ApiCaller.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
class ApiCaller {
    
}
extension ApiCaller {
    enum ServiceEndPoint: String {
        case Base_URL = "https://teamdefinex-mobile-auth-casestudy.vercel.app"
        case logIn = "/login"
        case discoverFirstHorizontalList = "/discoverFirstHorizontalList"
        case discoverSecondHorizontalList = "/discoverSecondHorizontalList"
        case discoverThirthTwoColumnList = "/discoverThirthTwoColumnList"
        case Token = "XXX"
        
        static func logIn() -> String {
            return  "\(Base_URL.rawValue)\(logIn.rawValue)"
        }
        
        static func getFirstHorizontalList() -> String {
            let token = UserDefaults.standard.getToken()
            return "\(Base_URL.rawValue)\(discoverFirstHorizontalList.rawValue)?token=\(token)"
        }
        
        static func getSecondHorizontalList() -> String {
            return  "\(Base_URL.rawValue)\(discoverSecondHorizontalList.rawValue)"
        }
        
        static func getThirthTwoColumnList() -> String {
            return  "\(Base_URL.rawValue)\(discoverThirthTwoColumnList.rawValue)"
        }
    }
    
    
    
}
