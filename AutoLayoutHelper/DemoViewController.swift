//
//  ViewController.swift
//  AutoLayoutHelper
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit

private let kMargin: CGFloat = 20

class DemoViewController: UIViewController {

    var label: UILabel?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.label = UILabel(frame: CGRectZero)
        self.label?.numberOfLines = 0
        self.label?.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.label?.textAlignment = NSTextAlignment.Center
        self.label?.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.label!)
        
        self.label?.fillSup
        self.label?.addCenterYConstraint(toView: self.label?.superview)
        self.label?.addLeftConstraint(toView: self.label?.superview, relation: .Equal, constant: kMargin)
        self.label?.addRightConstraint(toView: self.label?.superview, relation: .Equal, constant: -kMargin)
    }
    
    override func viewDidAppear(animated: Bool) {

        super.viewDidAppear(animated)

        self.label?.text = "Hello there! This piece of text centered vertically with left and right margin's horizontally using some helper methods I made for adding Auto Layout constraints in code"
    }
}

