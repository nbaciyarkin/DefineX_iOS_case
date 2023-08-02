//
//  Alert.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 2.08.2023.
//

import Foundation
import SwiftMessages
import UIKit

class Alert {
    
    class func success(title: String?, text: String?) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success)
        view.configureTheme(backgroundColor: Asset.greenStarColor.color, foregroundColor: .white)
        view.button?.isHidden = true
        view.configureDropShadow()
        view.configureContent(title: title ?? "", body: text ?? LocalizationKeys.successfulTitle, iconImage: UIImage(named: "arrow")!)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.backgroundView.layer.cornerRadius = 10
        SwiftMessages.show(view: view)
    }
    
    class func error(title: String?, text: String?) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureTheme(backgroundColor: UIColor.red, foregroundColor: .white)
        view.button?.isHidden = true
        view.configureDropShadow()
        view.configureContent(title: title ?? "", body: text ?? LocalizationKeys.errorTitle, iconImage: Asset.error.image)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.backgroundView.layer.cornerRadius = 10
        SwiftMessages.show(view: view)
    }

    class func warning(title: String?, text: String?) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureTheme(backgroundColor: Asset.darkYellowColor.color, foregroundColor: Asset.warningForegroundColor.color)
        view.button?.isHidden = true
        view.configureDropShadow()
        view.configureContent(title: title ?? "", body: text ?? LocalizationKeys.warningTitle, iconImage: Asset.infoWarning.image)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.backgroundView.layer.cornerRadius = 10
        SwiftMessages.show(view: view)
    }
}
