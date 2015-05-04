UIView AutoLayout Helper
=======================

A lightweight UIView extension providing helper methods for creating / adding NSLayoutConstraint objects programatically.

### Instructions
- Add the single file UIView+LayoutHelper.swift file to your Xcode project

### The Problem

#### Creating NSLayoutConstraints programatically can be quite repetitive 

For example to relate a label's left, right, top and bottom to its superview with some offsets

        let leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Left, relatedBy: .Equal, toItem: self.label.superview, attribute: .Left, multiplier: 1.0, constant: 10.0)
        self.label.superview.addConstraint(leftConstraint)
        
        let rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Right, relatedBy: .Equal, toItem: self.label.superview, attribute: .Right, multiplier: 1.0, constant: -10.0)
        self.label.superview.addConstraint(rightConstraint)
        
        let topConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Top, relatedBy: .Equal, toItem: self.label.superview, attribute: .Top, multiplier: 1.0, constant: 10.0)
        self.label.superview.addConstraint(topConstraint)
        
        let bottomConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Bottom, relatedBy: .Equal, toItem: self.label.superview, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        self.label.superview.addConstraint(bottomConstraint)

### Solution 

DRY up the code for relating views via NSLayoutConstraint objects into a reusable, set of methods

### Usage

#### Adding constraints

For example to relate a label's left, right, top and bottom to its superview with some offsets

        self.titleLabel.addTopConstraint(toView: self.titleLabel.superview, attribute: .Bottom, relation: .Equal, constant: 10.0)
        self.titleLabel.addBottomConstraint(toView: self.titleLabel.superview, relation: .Equal, constant: -10.0)
        self.titleLabel.addLeftConstraint(toView: self.titleLabel.superview, relation: .Equal, constant: 10.0)
        self.titleLabel.addRightConstraint(toView: self.titleLabel.superview, relation: .Equal, constant: -10.0)

or more succintly using this contribution from <a href="https://github.com/danieladias">@danieladias</a>

<code>self.titleLabel.fillSuperView(UIEdgeInsetsMake(10.0, 10.0, -10.0, -10.0))</code>

To center a view in both X and Y to its superview

        self.someView.addCenterXConstraint(toView: self.someView.superview, relation: .Equal, constant: 0)
        self.someView.addCenterYConstraint(toView: self.someView.superview, relation: .Equal, constant: 0)

#### Modifying constraints

Each method returns the NSLayoutConstraint object that it adds e.g. so that you can modify the constant or remove  e.g. 

      heightConstraint = self.customView.addHeightConstraint(relation: .Equal, constant: 150.0)

(where heightConstraint is a local or instance variable)

### TODO:
- Document public methods
- Add unit tests to public methods
- More sample project use cases

### Screenshots

![Alt text](screen1.png "Optional title")

### Team
* Development: [Shagun Madhikarmi](mailto:shagun@ustwo.com?subject=autolayout-helper), [Daniela Dias](mailto:daniela@ustwo.com?subject=autolayout-helper)
