//
//  WhatsNewViewController.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/11/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class WhatsNewViewController: UIViewController {
    
    let purpleColor = UIColor(displayP3Red: 113.0/255.0, green: 35.0/255.0, blue: 216.0/255.0, alpha: 1.0)
    var whatsNewLabel:        WelcomeToLabel!
    var button:               ClosePageButton!
    var descriptionViewOne:   DescriptionView!
    var descriptionViewTwo:   DescriptionView!
    var descriptionViewThree: DescriptionView!
    var stackView:            DescriptionStackView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        MiniLogger.shared.log(type: .Short, message: "Here's a test log!!!")
        
        let screenWidth = self.view.frame.width
        let customWidth = screenWidth - (screenWidth / 5.0)
        
        // Label
        whatsNewLabel = WelcomeToLabel(frame: CGRect(x: 0, y: 0, width: customWidth + 10.0, height: 100), title: "Podcasts", tintColor: self.purpleColor)
        whatsNewLabel.font = UIFont.systemFont(ofSize: 40.0, weight: .heavy)
        whatsNewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whatsNewLabel)
        whatsNewLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90).isActive = true
        whatsNewLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Button
        button = ClosePageButton(frame: CGRect(x: 0, y: 0, width: customWidth, height: 55), backgroundColor: self.purpleColor, buttonTitle: "Start Listening Now")
        self.view.addSubview(button)
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -35).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Description One
        let frame = CGRect(x: 0, y: 0, width: 400, height: 100)
        descriptionViewOne = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Listen Anytime, Anywhere", description: "Discover free audio stories that entertain, inform, and inspire the world.", image: #imageLiteral(resourceName: "Podcast"))
        
        // Description Two
        descriptionViewTwo = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Connect with Friends", description: "Explore shows you'll love, from entertainment and comedy to news and sports.", image: #imageLiteral(resourceName: "Playlists"))
        
        // Description Three
        descriptionViewThree = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Download for later", description: "Listen now, download for later and subscribe to get every new episode.", image: #imageLiteral(resourceName: "Play"))
        
        // Description Stack View
        stackView = DescriptionStackView(frame: CGRect(x: 0, y: 0, width: customWidth, height: (frame.height * 3) + 30.0))
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewOne)
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewTwo)
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewThree)
        
        self.view.addSubview(stackView)
        stackView.allignInMiddle(view: self.view)
        
        whatsNewLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        MiniLogger.shared.log(type: .Todo, message: "Need to fix stack view issues")
    }
    
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MiniLogger.shared.log(type: .Short, message: "Log in viewDidAppear")
        self.button.reloadInputViews()
        self.stackView.didMoveToSuperview()
    }
    
}

extension UIView {
    
    func allignInMiddle(view: UIView, constant: CGFloat = 0.0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
}

