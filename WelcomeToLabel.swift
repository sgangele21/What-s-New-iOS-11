//
//  WelcomeToLabel.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/6/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit
import Foundation

public class WelcomeToLabel: UILabel {
    
    var title: String = "Company"
    private var lineAllignment: CGFloat = 1.0
    
    private var fullTitle: String {
        return "Welcome \nto \(title)"
    }
    
    private var fullTitleRange: NSRange {
        let fullTitle = NSString(string: self.fullTitle)
        return fullTitle.range(of: self.fullTitle)
    }
    
    private var titleRange: NSRange {
        let fullTitle = NSString(string: self.fullTitle)
        return fullTitle.range(of: self.title)
    }
    
    private var paragraphStyle: NSMutableParagraphStyle {
        let paragraphStyle                = NSMutableParagraphStyle()
        paragraphStyle.alignment          = .left
        paragraphStyle.lineBreakMode      = .byWordWrapping
        paragraphStyle.lineHeightMultiple = self.lineAllignment
        
        return paragraphStyle
    }
    
    private var whatsNewTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 48, weight: .heavy)
    }
    
    public var customAttributedText: NSMutableAttributedString? {
        let attrText = NSMutableAttributedString(string: self.fullTitle)
        
        attrText.addAttribute(.foregroundColor, value: self.tintColor , range: self.titleRange)
        attrText.addAttribute(.font, value: self.whatsNewTitleFont, range: self.fullTitleRange)
        attrText.addAttribute(.paragraphStyle, value: self.paragraphStyle, range: self.fullTitleRange)
        
        return attrText
    }
    
    public override var tintColor: UIColor! {
        didSet {
            self.attributedText = self.customAttributedText
        }
    }
    
    public init(frame: CGRect, title: String, tintColor: UIColor) {
        super.init(frame: frame)
        self.title          = title
        self.lineAllignment = 0.85
        self.tintColor      = tintColor
        self.attributedText = self.customAttributedText
        self.numberOfLines  = 2
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.lineAllignment = 0.85
        self.attributedText = self.customAttributedText
        self.numberOfLines  = 2
    }

}
