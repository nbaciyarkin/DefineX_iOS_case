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
        let vc2 = UINavigationController(rootViewController: UIViewController())
        let vc3 = UINavigationController(rootViewController: UIViewController())
        let vc4 = UINavigationController(rootViewController: UIViewController())

        vc1.tabBarItem.image = Asset.discoverTabIcon.image
        vc2.tabBarItem.image = Asset.bookTabIcon.image
        vc3.tabBarItem.image = Asset.tagTabIcon.image
        vc4.tabBarItem.image = Asset.accountTabIcon.image

        vc1.title = LocalizationKeys.tabbarFirstItemTitle

        let titleFont = UIFont.boldSystemFont(ofSize: 13)
        let attributes = [NSAttributedString.Key.font: titleFont]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)

        tabBar.tintColor = Asset.loginSelectedColor.color
        tabBar.backgroundColor = .white

        setViewControllers([vc1, vc2, vc3, vc4], animated: true)

    }

}
