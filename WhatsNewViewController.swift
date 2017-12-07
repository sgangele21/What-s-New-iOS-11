//
//  WhatsNewViewController.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/11/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class WhatsNewViewController: UIViewController {
    
    @IBOutlet weak var whatsNewLabel: WhatsNewLabel!
    @IBOutlet weak var stackView: DescriptionStackView!
    @IBOutlet weak var closePageButton: ClosePageButton!
    
    // Create Description Views
    private var sampleDescriptionViews: [DescriptionView] {
        // Description One
        let descriptionViewFrame = CGRect(x: 0, y: 0, width: 400, height: 100)
        let descriptionViewOne = DescriptionView.loadFromNib(frame: descriptionViewFrame, descriptionTitle: "Drag & Drop", description: "Drag and drop all items to any place on your iOS Device by long pressing on any item.", image: #imageLiteral(resourceName: "Drag And Drop Icon"))
        
        // Description Two
        let descriptionViewTwo = DescriptionView.loadFromNib(frame: descriptionViewFrame, descriptionTitle: "Search for more", description: "Searching allows you to find all items instantly, using a binary search algorithm.", image: #imageLiteral(resourceName: "SearchIcon"))
        
        // Description Three
        let descriptionViewThree = DescriptionView.loadFromNib(frame: descriptionViewFrame, descriptionTitle: "Save for later", description: "Save items, to read them at a later time of your choosing. Visit the respective tab bar to see all your saved items.", image: #imageLiteral(resourceName: "HeartIcon"))
        
        return [descriptionViewOne,descriptionViewTwo,descriptionViewThree]
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.closePageButton.backgroundColor = UIColor.bluberryBlue
        self.closePageButton.setTitle("Listen Now", for: .normal)
        
        // Add Description Views
        for descriptionView in self.sampleDescriptionViews {
            stackView.addArrangedDescriptionView(descriptionView: descriptionView)
        }
        

    }
    
}

extension UIView {
    
    /**
    * Function that adds self to given `view`, and alligns in middle
    * translatesAutoresizingMaskIntoConstraints will be set to true
    */
    func allignInMiddle(view: UIView, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
}

extension UIColor {
    
    static var podcastPurple: UIColor {
        return UIColor(displayP3Red: 113.0/255.0, green: 35.0/255.0, blue: 216.0/255.0, alpha: 1.0)
    }
    
    static var bluberryBlue: UIColor {
        return UIColor(displayP3Red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0)
    }
    
}

