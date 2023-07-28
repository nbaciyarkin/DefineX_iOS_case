//
//  LoginRouter.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 27.07.2023.
//

import Foundation
import UIKit

class LoginRouter {
    
    static func startModule(navigationController: UINavigationController, viewController: UIViewController) {
    
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(TabBarController())
      
    }
    
}
