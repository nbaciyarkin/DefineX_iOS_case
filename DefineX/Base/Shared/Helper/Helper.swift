//
//  Class Helper.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import UIKit

class CircularBlackView: UIView {
    let r: CGFloat = 2.0

    override func draw(_ rect: CGRect) {
        // Get the center point of the view
        let center = CGPoint(x: rect.width / 2.0, y: rect.height / 2.0)
        
        // Calculate the radius based on the smaller dimension (width or height)
        let radius = min(rect.width, rect.height) / r
        
        // Create a circular path
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        
        // Set the fill color to black
        UIColor.black.setFill()
        
        // Fill the path
        path.fill()
    }
}

import Foundation


class Helper {
    
}
