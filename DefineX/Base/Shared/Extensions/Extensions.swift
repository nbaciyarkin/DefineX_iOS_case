//
//  Extensions.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 26.07.2023.
//

import Foundation
import UIKit

extension UITextField {
    private struct AssociatedKeys {
        static var titleFormatterKey: UInt8 = 0
    }
    
    func setTitleFormatter(_ formatter: ((String) -> String)?) {
        addTarget(self, action: #selector(formatTitle), for: .editingChanged)
        objc_setAssociatedObject(self, &AssociatedKeys.titleFormatterKey, formatter, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        formatTitle()
    }
    
    @objc private func formatTitle() {
        guard let formatter = objc_getAssociatedObject(self, &AssociatedKeys.titleFormatterKey) as? (String) -> String else {
            return
        }
        text = formatter(text ?? "")
    }
}


extension UIColor {
    static func gradientColor(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) -> UIColor {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, false, 0.0)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return UIColor(patternImage: image!)
    }
}


extension UILabel {
    func applyGradientText(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        
        let textImage = UIGraphicsImageRenderer(size: bounds.size).image { _ in
            layer.render(in: UIGraphicsGetCurrentContext()!)
        }
        
        let gradientMaskLayer = CALayer()
        gradientMaskLayer.frame = bounds
        gradientMaskLayer.contents = textImage.cgImage
        gradientMaskLayer.mask = gradientLayer
        
        layer.addSublayer(gradientMaskLayer)
    }
}

extension UIView {
    func applyGradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UILabel {
    func setMiddleLineView(label: UILabel){
        // Add a strikethrough attribute to the text
        let strikeThroughAttribute = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.baselineOffset: -3 // Adjust this value to pull the line down
        ]
        let strikethroughAttributedString = NSAttributedString(string: label.text ?? "", attributes: strikeThroughAttribute)

        label.attributedText = strikethroughAttributedString
    }
}


