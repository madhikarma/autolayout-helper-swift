//
//  UIView+LayoutConstraints.swift
//
//
//  Created by Shagun Madhikarmi on 09/10/2014.
//
//

import Foundation
import UIKit

/**
*  Extension of UIView to help create and add common NSLayoutConstraint relation instances
*/
extension UIView {
    
    // MARK: - Constraints
    
    // MARK: Fill
    
    /**
    Creates and adds an array of NSLayoutConstraint objects that relates this view's top, left, bottom and right to its superview (given an optional UIEdgeInsets for each side)
    
    @discussion Note. The constraints are also added to this view's superview for you.
    
    :param: edges An amount insets to apply to the top, left, bottom and right constraint
    
    :returns: An array of 4 x NSLayoutConstraint objects (top, left, bottom , right) if the superview exists (otherwise an empty array)
    */
    func fillSuperView(edges: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        var constraints: [NSLayoutConstraint] = []
        
        if let superview = self.superview {
        
            var topConstraint: NSLayoutConstraint = self.addTopConstraint(toView: superview, relation: .Equal, constant: edges.top)
            var leftConstraint: NSLayoutConstraint = self.addLeftConstraint(toView: superview, relation: .Equal, constant: edges.left)
            var bottomConstraint: NSLayoutConstraint = self.addBottomConstraint(toView: superview, relation: .Equal, constant: edges.bottom)
            var rightConstraint: NSLayoutConstraint = self.addRightConstraint(toView: superview, relation: .Equal, constant: edges.right)
            
            constraints = [topConstraint, leftConstraint, bottomConstraint, rightConstraint]
        }
        
        return constraints
    }
    
    
    // MARK: Left

    /**
    Creates and adds an NSLayoutConstraint that relates this view's left to the left of another view.
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's left from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this left attribute relation
    */
    func addLeftConstraint(toView view: UIView, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addLeftConstraint(toView: view, attribute: .Left, relation: relation, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's left to some specified edge of another view.
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: attribute The other view's layout attribute to relate this view's left to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's left from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this Left attribute relation
    */
    func addLeftConstraint(toView view: UIView, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Left, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: Right
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's right to the right of another view.
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's right from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this right attribute relation
    */
    func addRightConstraint(toView view: UIView, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addRightConstraint(toView: view, attribute: .Right, relation: relation, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's right to some specified edge of another view, given a relation and offset
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: attribute The other view's layout attribute to relate this view's right to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's right from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this right attribute relation
    */
    func addRightConstraint(toView view: UIView, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Right, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: Top
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's top to the top of another view.
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's top from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this top attribute relation
    */
    func addTopConstraint(toView view: UIView, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addTopConstraint(toView: view, attribute: .Top, relation: relation, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's top to some specified edge of another view, given a relation and offset
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: attribute The other view's layout attribute to relate this view's top to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's top from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this top attribute relation
    */
    func addTopConstraint(toView view: UIView, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Top, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }

    
    // MARK: Bottom
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's bottom to the bottom edge of another view
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's bottom from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this bottom attribute relation
    */
    func addBottomConstraint(toView view: UIView, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addBottomConstraint(toView: view, attribute: .Bottom, relation: relation, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's bottom to some specified edge of another view, given a relation and offset
    
    @discussion Note. The new constraint is added to this view's superview for you.
    
    :param: view      The other view to relate this view to
    :param: attribute The other view's layout attribute to relate this view's bottom to
    :param: relation  The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's bottom from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this bottom attribute relation
    */
    func addBottomConstraint(toView view: UIView, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Bottom, toView: view, attribute: attribute, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: Center X
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's centerX coordinate to centerX coordinate of another view.
    
    :param: view The other view to relate this view to
    
    :returns: The created NSLayoutConstraint for this center X coordinate attribute relation
    */
    func addCenterXConstraint(toView view: UIView) -> NSLayoutConstraint {
        
        return self.addCenterXConstraint(toView: view, relation: .Equal, constant: 0)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's center X coordinate attribute to the center X coordinate attribute of another view given an offset.
    
    :param: view     The other view to relate this view to
    :param: constant An amount by which to offset this view's bottom from the other view's specified edge
    
    :returns: The created NSLayoutConstraint for this center X coordinate attribute relation
    */
    func addCenterXConstraint(toView view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addCenterXConstraint(toView: view, relation: .Equal, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's center X coordinate to the center X coordinate of another view, given a relation and offset
    
    :param: view     The other view to relate this view to
    :param: relation The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant An amount by which to offset this view's center X coordinate attribute from the other view's center X coordinate attribute
    
    :returns: The created NSLayoutConstraint for this center X coordinate attribute relation
    */
    func addCenterXConstraint(toView view: UIView, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .CenterX, toView: view, attribute: .CenterX, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: Center Y
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's center Y coordinate to the center Y coordinate of another view, given a relation and offset
    
    :param: view The other view to relate this view to
    
    :returns: The created NSLayoutConstraint for this center Y coordinate attribute relation
    */
    func addCenterYConstraint(toView view: UIView) -> NSLayoutConstraint {
        
        return self.addCenterYConstraint(toView: view, relation: .Equal, constant: 0)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's center Y coordinate to the center Y coordinate of another view, given a relation and offset
    
    :param: view     The other view to relate this view to
    :param: constant An amount by which to offset this view's center X coordinate attribute from the other view's center X coordinate attribute
    
    :returns: The created NSLayoutConstraint for this center Y coordinate attribute relation
    */
    func addCenterYConstraint(toView view: UIView, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addCenterYConstraint(toView: view, relation: .Equal, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's center Y coordinate to the center Y coordinate of another view, given a relation and offset
    
    :param: view     The other view to relate this view to
    :param: relation The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant An amount by which to offset this view's center X coordinate attribute from the other view's center X coordinate attribute
    
    :returns: The created NSLayoutConstraint for this center Y coordinate attribute relation
    */
    func addCenterYConstraint(toView view: UIView, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .CenterY, toView: view, attribute: .CenterY, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: Width
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's width to the width of another view, given a relation and offset
    
    :param: relation The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant  An amount by which to offset this view's width from the other view's width amount
    
    :returns: The created NSLayoutConstraint for this width attribute relation
    */
    func addWidthConstraint(relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addWidthConstraint(toView: nil, relation: relation, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's width to the width of another view, given a relation and offset
    
    :param: view     The other view to relate this view to
    :param: relation The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant An amount by which to offset this view's width from the other view's width amount
    
    :returns: The created NSLayoutConstraint for this width attribute relation
    */
    func addWidthConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Width, toView: view, attribute: .Width, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    
    
    // MARK: Height
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's height to the height of another view, given a relation and offset
    
    :param: relation The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant An amount by which to offset this view's height from the other view's height amount
    
    :returns: The created NSLayoutConstraint for this height attribute relation
    */
    func addHeightConstraint(relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        return self.addHeightConstraint(toView: nil, relation: relation, constant: constant)
    }
    
    /**
    Creates and adds an NSLayoutConstraint that relates this view's height to the height of another view, given a relation and offset
    
    :param: view     The other view to relate this view to
    :param: relation The relation of the constraint e.g. .Equal, .GreaterThanOrEqual, LessThanOrEqual
    :param: constant An amount by which to offset this view's height from the other view's height amount
    
    :returns: The created NSLayoutConstraint for this height attribute relation
    */
    func addHeightConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.createConstraint(attribute: .Height, toView: view, attribute: .Height, relation: relation, constant: constant)
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
    

    // MARK: - Private
    
    /// Creates and adds an NSLayoutConstraint using its factory method given both views, attributes a relation and offset
    private func createConstraint(attribute attr1: NSLayoutAttribute, toView: UIView?, attribute attr2: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attr1,
            relatedBy: relation,
            toItem: toView,
            attribute: attr2,
            multiplier: 1.0,
            constant: constant)
        
        return constraint
    }
}
