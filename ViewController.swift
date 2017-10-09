//
//  ViewController.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/4/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let purpleColor = UIColor(displayP3Red: 113.0/255.0, green: 35.0/255.0, blue: 216.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        let whatsNewLabel = WelcomeToLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), title: "Podcasts", tintColor: self.purpleColor)
        whatsNewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(whatsNewLabel)
        whatsNewLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70).isActive = true
        whatsNewLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -40).isActive = true
        
        // Button
        let button = ClosePageButton(frame: CGRect(x: 0, y: 0, width: 300, height: 55), backgroundColor: self.purpleColor, buttonTitle: "Start Listening")
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 300).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // Description One
        let frame = CGRect(x: 0, y: 0, width: 400, height: 100)
        let descriptionViewOne = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Listen Anytime, Anywhere", description: "Listen to all the entertainment at your finger tips from music, to news, to even live sport events.", image: #imageLiteral(resourceName: "Music"))
        //descriptionViewOne.allignInMiddle(view: self.view)
        
        // Description Two
        let descriptionViewTwo = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Connect with Friends", description: "With built in social media, let the world know what you're listetning to.", image: #imageLiteral(resourceName: "Human"))
        //descriptionViewTwo.allignInMiddle(view: self.view, constant: 120.0)
        
        // Description Three
        let descriptionViewThree = DescriptionView.loadFromNib(frame: frame, descriptionTitle: "Download for later", description: "Play podcasts offline by saving them for later.", image: #imageLiteral(resourceName: "Download"))
        //descriptionViewThree.allignInMiddle(view: self.view, constant: -110.0)
        
        let stackView = DescriptionStackView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 10.0, height: frame.height * 3))
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewOne)
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewTwo)
        stackView.addArrangedDescriptionView(descriptionView: descriptionViewThree)
        self.view.addSubview(stackView)
        stackView.allignInMiddle(view: self.view, constant: 10.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
