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
        self.spacing = 25.0
        self.axis         = .vertical
        self.distribution = .fillEqually
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        self.spacing = 25.0
        self.axis         = .vertical
        self.distribution = .fillEqually
    }
    
    public func addArrangedDescriptionView(descriptionView: DescriptionView) {
        self.addArrangedSubview(descriptionView)
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
    }
    
}
