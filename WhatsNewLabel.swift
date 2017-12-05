//
//  WhatsNewTitle.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/4/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class WhatsNewLabel: UILabel {
    
    private var whatsNewTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 48, weight: .heavy)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.text = "What's New"
        self.font = whatsNewTitleFont
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
