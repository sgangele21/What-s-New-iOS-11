//
//  WhatsNewViewController.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/11/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

public class WhatsNewViewController: UIViewController {
    
    public var welcomeToLabel:       WelcomeToLabel!
    public var button:               ClosePageButton!
    public var stackView:            DescriptionStackView!
    
    private var screenWidth: CGFloat {
        return self.view.frame.width
    }
    
    private var customWidth: CGFloat {
        return screenWidth - (screenWidth / CGFloat(5.0))
    }
    
    private var sampleDescriptionViews: [DescriptionView] {
        // Description One
        let descriptionViewFrame = CGRect(x: 0, y: 0, width: 400, height: 100)
        let descriptionViewOne = DescriptionView.loadFromNib(frame: descriptionViewFrame, descriptionTitle: "Listen Anytime, Anywhere", description: "Discover free audio stories that entertain, inform, and inspire the world.", image: #imageLiteral(resourceName: "Podcast"))
        
        // Description Two
        let descriptionViewTwo = DescriptionView.loadFromNib(frame: descriptionViewFrame, descriptionTitle: "Connect with Friends", description: "Explore shows you'll love, from entertainment and comedy to news and sports.", image: #imageLiteral(resourceName: "Playlists"))
        
        // Description Three
        let descriptionViewThree = DescriptionView.loadFromNib(frame: descriptionViewFrame, descriptionTitle: "Download for later", description: "Listen now, download for later and subscribe to get every new episode.", image: #imageLiteral(resourceName: "Play"))
        
        return [descriptionViewOne,descriptionViewTwo,descriptionViewThree]
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.welcomeToLabel = self.createWelcomToLabel()
        self.button         = self.createButton()
        self.stackView      = self.createDescriptionStackView()
        
        for descriptionView in self.sampleDescriptionViews {
            stackView.addArrangedDescriptionView(descriptionView: descriptionView)

        }

    }
    
    func createWelcomToLabel() -> WelcomeToLabel {
        // Label
        let welcomeToLabel = WelcomeToLabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: 100), title: "Podcasts", tintColor: UIColor.podcastPurple)
        welcomeToLabel.font = UIFont.systemFont(ofSize: 40.0, weight: .heavy)
        welcomeToLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(welcomeToLabel)
        welcomeToLabel.topAnchor.constraint    (equalTo: self.view.topAnchor, constant: 90).isActive  = true
        welcomeToLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive            = true
        welcomeToLabel.widthAnchor.constraint  (equalToConstant: welcomeToLabel.frame.width).isActive = true
        
        return welcomeToLabel
    }
    
    func createButton() -> ClosePageButton {
        // Button
        let button = ClosePageButton(frame: CGRect(x: 0, y: 0, width: customWidth, height: 55), backgroundColor: UIColor.podcastPurple, buttonTitle: "Start Listening Now")
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint (equalTo: self.view.bottomAnchor, constant: -35).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive               = true
        button.widthAnchor.constraint  (equalToConstant: button.frame.size.width).isActive       = true
        button.heightAnchor.constraint (equalToConstant: button.frame.size.height).isActive      = true
        
        return button
    }
    
    func createDescriptionStackView() -> DescriptionStackView {
        // Height of stack view is dynamically adjusted based on items in stack
        let stackView = DescriptionStackView(frame: CGRect(x: 0, y: 0, width: customWidth, height: 0))
        stackView.allignInMiddle(view: self.view)
        stackView.widthAnchor.constraint(equalToConstant: stackView.frame.size.width).isActive = true
        
        return stackView
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
    
}

