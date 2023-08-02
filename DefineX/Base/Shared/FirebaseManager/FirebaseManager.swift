//
//  FirebaseManager.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 2.08.2023.
//

import Firebase
import FirebaseRemoteConfig
class FirebaseManager {
    static let shared = FirebaseManager()
    private init() {}
    var remoteConfig = RemoteConfig.remoteConfig()
    
    func setupRemoteConfigDefaults() {
        let defaultValue = ["label_text": "Hello :]" as NSObject]
        remoteConfig.setDefaults(defaultValue)
    }
    
    func trackScreen(viewController: String, params: [String: Any]) {
        Analytics.logEvent(viewController, parameters: params)
    }
}
