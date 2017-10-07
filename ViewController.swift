//
//  ViewController.swift
//  What's New Page
//
//  Created by Sahil Gangele on 10/4/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let whatsNewLabel = WelcomeToLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100), title: "Podcasts", tintColor: UIColor.purple)
        //whatsNewLabel.tintColor = UIColor.green
        whatsNewLabel.allignInMiddle(view: self.view)
        
        
        let button = ClosePageButton(frame: CGRect(x: 0, y: 0, width: 300, height: 55), backgroundColor: UIColor.purple, buttonTitle: "Start Listening")
        //button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 300).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIView {
    
    func allignInMiddle(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
