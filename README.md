UIView+LayoutConstraints
=======================

UIView extension to ease creating Auto Layout Constraints

### The Problem

Relating UIView's using Auto Layout programatically can either be quite verbose e.g. 

        let leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Left, relatedBy: .Equal, toItem: self.label.superview, attribute: .Left, multiplier: 1.0, constant: 10.0)
        self.label.superview.addConstraint(leftConstraint)
        
        let rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Right, relatedBy: .Equal, toItem: self.label.superview, attribute: .Right, multiplier: 1.0, constant: -10.0)
        self.label.superview.addConstraint(rightConstraint)
        
        let topConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Top, relatedBy: .Equal, toItem: self.label.superview, attribute: .Top, multiplier: 1.0, constant: 10.0)
        self.label.superview.addConstraint(topConstraint)
        
        let bottomConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.label, attribute: .Bottom, relatedBy: .Equal, toItem: self.label.superview, attribute: .Bottom, multiplier: 1.0, constant: -10.0)
        self.label.superview.addConstraint(bottomConstraint)

or error prone e.g. (using Visual Format Language):

        var views = NSDictionaryOfVariableBindings(_label);
        self.label.superview.addConstraints(NSLayoutConstraint constraintsWithVisualFormat:@"V:|_label|" options:0 metrics:nil views:views]
        self.label.superview.addConstraints(NSLayoutConstraint constraintsWithVisualFormat:@"H:|_label|" options:0 metrics:nil views:views]        

### A Solution

We can make adding NSLayoutConstraint relations into some common reusable methods that you call on any UIView you're trying to relate (via an Extension). This extension means you can relate a view you have create to another in a way that looks like its part of its setup and helps ensure we keep the NSLayoutConstraint creation code as DRY as possible.

### Setup
- Add the UIView+LayoutConstraints.swift file to your project. That's it!
- 
### Usage

#### Adding constraints

For example using this extension then to relate a label's left, right, top and bottom to its superview with some offsets you can now write:

        self.titleLabel?.addTopConstraint(toView: self.titleLabel?.superview, attribute: .Bottom, relation: .Equal, constant: 10.0)
        self.titleLabel?.addBottomConstraint(toView: self.titleLabel?.superview, relation: .Equal, constant: -10.0)
        self.titleLabel?.addLeftConstraint(toView: self.titleLabel?.superview, relation: .Equal, constant: 10.0)
        self.titleLabel?.addRightConstraint(toView: self.titleLabel?.superview, relation: .Equal, constant: -10.0)

or more succintly using this contribution from <a href="https://github.com/danieladias">@danieladias</a>

        self.titleLabel?.fillSuperView(UIEdgeInsetsMake(10.0, 10.0, -10.0, -10.0))

Or to center a view in both X and Y to its superview

        self.someView.addCenterXConstraint(toView: self.someView.superview, relation: .Equal, constant: 0)
        self.someView.addCenterYConstraint(toView: self.someView.superview, relation: .Equal, constant: 0)

#### Modifying the Constraints

Each method returns the NSLayoutConstraint object that it creates and adds so that you can store or modify it  

e.g. 

      let heightConstraint = self.customView.addHeightConstraint(relation: .Equal, constant: 150.0)

(where heightConstraint is a local or instance variable)

### TODO:
- [X] Document public methods
- [ ] Unit tests
 - [ ] addLeft... methods
 - [ ] addRight... methods
 - [ ] addTop... methods
 - [ ] addBottom... methods
 - [ ] addCenterX... methods
 - [ ] addCenterY... methods
 - [ ] addWidth... methods
 - [ ] addHeight... methods
- [ ] Make into a Swift Framework project for iOS 8+


### Team
* Development: [Shagun Madhikarmi](mailto:shagun@ustwo.com?subject=autolayout-helper), [Daniela Dias](mailto:daniela@ustwo.com?subject=autolayout-helper)
