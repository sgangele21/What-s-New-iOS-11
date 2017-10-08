//
//  DescriptionView.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/7/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class DescriptionView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionTitleFont: UIFont {
        return UIFont.boldSystemFont(ofSize: 20.0)
    }
    
    var appDescriptionFont: UIFont {
        return UIFont.systemFont(ofSize: 19.0, weight: .regular)
    }
    
    var descriptionTitle = ""
    var appDescription = ""
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("aDecoder was called damnit!")
    }
    
    public override func didMoveToSuperview() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: self.frame.size.width).isActive   = true
        self.heightAnchor.constraint(equalToConstant: self.frame.size.height).isActive = true
    }
    
    public static func loadFromNib(frame: CGRect, descriptionTitle: String, description: String, image: UIImage) -> DescriptionView {
        let bundle = Bundle.main
        let nib = UINib(nibName: "DescriptionView", bundle: bundle)
        let descriptionView = nib.instantiate(withOwner: self, options: nil)[0] as! DescriptionView
        
        descriptionView.frame            = frame
        descriptionView.descriptionTitle = descriptionTitle
        descriptionView.appDescription   = description
        descriptionView.imageView.image  = image
        descriptionView.setupLabel()
        
        return descriptionView
    }
    
    public func setupLabel(descriptionTitle: String, description: String) {
        self.descriptionTitle = descriptionTitle
        self.appDescription   = description
        let fullText          = "\(descriptionTitle)\n\(description)"
        
        let attributedText       = NSMutableAttributedString(string: fullText)
        let paragraphStyle       = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        attributedText.addAttribute(.font, value: self.descriptionTitleFont, range: fullText.range(string: descriptionTitle))
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: fullText.range(string: fullText))
        attributedText.addAttribute(.font, value: self.appDescriptionFont, range: fullText.range(string: description))
        
        self.descriptionLabel.attributedText = attributedText
    }
    
    public func setupLabel() {
        self.setupLabel(descriptionTitle: self.descriptionTitle, description: self.appDescription)
    }
    
    
    
}

extension String {

    func range(string: String) -> NSRange {
        return NSString(string: self).range(of: string)
    }
    
}
