//
//  TabBarController.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 27.07.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: DiscoverViewController())
        let vc2 = UINavigationController(rootViewController: MockViewController())
        let vc3 = UINavigationController(rootViewController: UIViewController())
        let vc4 = UINavigationController(rootViewController: UIViewController())
       
        vc1.tabBarItem.image = UIImage(named: "discover_tab_icon")
        vc2.tabBarItem.image = UIImage(named: "book_tab_icon")
        vc3.tabBarItem.image = UIImage(named: "tag_tab_icon")
        vc4.tabBarItem.image = UIImage(named: "account_tab_icon")

        
        vc1.title = "Discover"


        let titleFont = UIFont.boldSystemFont(ofSize: 13)
        let attributes = [NSAttributedString.Key.font: titleFont]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)

        tabBar.tintColor = UIColor(named: "login_selectedColor")
        tabBar.backgroundColor = .white
    
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)

        
    }
    
    
}
