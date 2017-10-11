//
//  DescriptionStackView.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/9/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class DescriptionStackView: UIStackView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.spacing = 20.0
        self.axis = .vertical
        self.distribution = .equalSpacing
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addArrangedDescriptionView(descriptionView: DescriptionView) {
        self.addArrangedSubview(descriptionView)
    }
    
    public override func didMoveToSuperview() {
        var totalHeight: CGFloat = 0.0
        for subview in self.arrangedSubviews {
            totalHeight += subview.frame.height
        }
        let buffer = 10.0 * CGFloat(self.arrangedSubviews.count)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: self.frame.size.width).isActive   = true
        self.heightAnchor.constraint(equalToConstant: totalHeight + buffer).isActive = true
    }
    
}
