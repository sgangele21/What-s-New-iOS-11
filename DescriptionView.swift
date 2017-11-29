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
    
    var appDescriptionTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 18.0) {
        didSet {
            let attributedText = self.descriptionLabel.attributedText as! NSMutableAttributedString
            attributedText.addAttribute(.font, value: self.appDescriptionTitleFont, range: self.fullDescription.range(string: self.appDescriptionTitle))
        }
    }
    
    var appDescriptionFont: UIFont = UIFont.systemFont(ofSize: 16.0, weight: .regular) {
        didSet {
            let attributedText = self.descriptionLabel.attributedText as! NSMutableAttributedString
            attributedText.addAttribute(.font, value: self.appDescriptionFont, range: self.fullDescription.range(string: self.appDescription))
        }
    }
    
    var appDescriptionTitle = ""
    var appDescription = ""
    var fullDescription : String {
        return "\(self.appDescriptionTitle)\n\(self.appDescription)"
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("aDecoder was called damnit!")
    }
    
    public static func loadFromNib(frame: CGRect, descriptionTitle: String, description: String, image: UIImage) -> DescriptionView {
        let bundle = Bundle.main
        let nib = UINib(nibName: "DescriptionView", bundle: bundle)
        let descriptionView = nib.instantiate(withOwner: self, options: nil)[0] as! DescriptionView
        
        descriptionView.frame            = frame
        descriptionView.appDescriptionTitle = descriptionTitle
        descriptionView.appDescription   = description
        descriptionView.imageView.image  = image
        descriptionView.setupLabel()
        
        return descriptionView
    }
    
    public func setupLabel(descriptionTitle: String, description: String) {
        self.appDescriptionTitle = descriptionTitle
        self.appDescription      = description
        let fullText             = self.fullDescription
        
        let attributedText           = NSMutableAttributedString(string: fullText)
        let paragraphStyle           = NSMutableParagraphStyle()
        paragraphStyle.alignment     = .left
        paragraphStyle.lineBreakMode = .byTruncatingTail
        
        attributedText.addAttribute(.font, value: self.appDescriptionTitleFont, range: fullText.range(string: descriptionTitle))
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: fullText.range(string: fullText))
        attributedText.addAttribute(.font, value: self.appDescriptionFont, range: fullText.range(string: description))
        
        self.descriptionLabel.attributedText = attributedText
    }
    
    public func setupLabel() {
        self.setupLabel(descriptionTitle: self.appDescriptionTitle, description: self.appDescription)
    }
    
}

extension String {

    func range(string: String) -> NSRange {
        return NSString(string: self).range(of: string)
    }
    
}
