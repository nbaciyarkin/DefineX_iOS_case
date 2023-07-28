//
//  MockViewController.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import Foundation
import UIKit

class MockViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 30))
        label.text = "Strikethrough Text"

        // Add a strikethrough attribute to the text
        let strikeThroughAttribute = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.baselineOffset: -3 // Adjust this value to pull the line down
        ]
        let strikethroughAttributedString = NSAttributedString(string: label.text ?? "", attributes: strikeThroughAttribute)

        label.attributedText = strikethroughAttributedString
        view.addSubview(label)
    }
}
