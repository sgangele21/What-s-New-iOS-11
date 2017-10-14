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
    var whatsNewLabel: WelcomeToLabel!
    var button: ClosePageButton!
    var descriptionViewOne: DescriptionView!
    var descriptionViewTwo: DescriptionView!
    var descriptionViewThree: DescriptionView!
    var stackView: DescriptionStackView!
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.width
        let customWidth = screenWidth - (screenWidth / 8.0)
        
        // Label
        whatsNewLabel = WelcomeToLabel(frame: CGRect(x: 0, y: 0, width: customWidth + 10.0, height: 100), title: "Podcasts", tintColor: self.purpleColor)
        whatsNewLabel.font = UIFont.systemFont(ofSize: 40.0, weight: .heavy)
        whatsNewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whatsNewLabel)
        whatsNewLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90).isActive = true
        whatsNewLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Button
        button = ClosePageButton(frame: CGRect(x: 0, y: 0, width: 300, height: 55), backgroundColor: self.purpleColor, buttonTitle: "Start Listening")
        self.view.addSubview(button)
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -35).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Description One
        let frame = CGRect(x: 0, y: 0, width: 400, height: 100)
        descriptionViewOne = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Listen Anytime, Anywhere", description: "Listen to all the entertainment at your finger tips from music, to news, to even live sport eventsahilgangele", image: #imageLiteral(resourceName: "Music"))
        
        // Description Two
        descriptionViewTwo = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Connect with Friends", description: "With built in social media, let the world know what you're listetning to. Whether it's Kanye West or J. Cole, you can listen to anyone you want! Just with a click of a button!", image: #imageLiteral(resourceName: "Human"))
        
        // Description Three
        descriptionViewThree = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Download for later", description: "Play podcasts offline by saving them for later.", image: #imageLiteral(resourceName: "Download"))
        
        // Description Stack View
        stackView = DescriptionStackView(frame: CGRect(x: 0, y: 0, width: customWidth, height: (frame.height * 3) + 30.0))
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewOne)
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewTwo)
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewThree)
        
        self.view.addSubview(stackView)
        stackView.allignInMiddle(view: self.view)
        
        whatsNewLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
    }
    
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

