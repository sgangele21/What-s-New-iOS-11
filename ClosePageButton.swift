//
//  ClosePageButton.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/7/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import Foundation
import UIKit

public class ClosePageButton: UIButton {
    
    var buttonTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    var attributedStringAttributes: [NSAttributedStringKey : Any] {
        return [.foregroundColor:UIColor.white, .font:self.buttonTitleFont]
    }
    
    
    public init(frame: CGRect, backgroundColor: UIColor, buttonTitle: String) {
        super.init(frame: frame)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 8.0

        let attributedString = NSAttributedString(string: buttonTitle, attributes: self.attributedStringAttributes)
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    public override func didMoveToSuperview() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: self.frame.size.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: self.frame.size.height).isActive = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
