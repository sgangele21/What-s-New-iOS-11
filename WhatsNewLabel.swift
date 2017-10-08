//
//  WhatsNewTitle.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/4/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class WhatsNewLabel: UILabel {
    
    var whatsNewTitle: UIFont {
        return UIFont.systemFont(ofSize: 48, weight: .heavy)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.text = "What's New"
        self.font = whatsNewTitle
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}