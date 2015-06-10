//
//  AutoLayoutHelperTests.swift
//  AutoLayoutHelperTests
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit
import XCTest


class UIViewLayoutConstraintsTestCase: XCTestCase {
    
    private var mockView: UIView!
    private var mockSuperview: UIView!

    
    // MARK: - Setup / Teardown
    
    override func setUp() {

        super.setUp()
        
        // Given
        self.mockSuperview = UIView(frame: CGRectZero)
        self.mockView = UIView(frame: CGRectZero)
        self.mockView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.mockSuperview.addSubview(mockView)
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        self.mockView.removeFromSuperview()
        self.mockView = nil
        self.mockSuperview = nil
    }

    
    // MARK: - Test - Fill Superview
    
    func testFillSuperview_ReturnsCorrectNumberOfConstraints() {
        
        // When
        var constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsZero)
        
        // Then
        let actualResult = constraints.count
        let expectedResult = 4
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints count to be \(expectedResult) constraints but instead it is \(expectedResult)")
    }

    func testFillSuperview_AddsConstraints() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsZero)
        
        // Then
        let expectedResult = self.mockSuperview.constraints() as! [NSLayoutConstraint]
        let actualResult: [NSLayoutConstraint] = constraints
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to be \(expectedResult) constraints but instead it is \(expectedResult)")
    }
    
    func testFillSuperview_CreatesTopConstraint() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsZero)
        
        // Then

        var constraint = constraints[0]
        
        var actualResult = constraint.firstAttribute
        var expectedResult = NSLayoutAttribute.Top
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected first constraint's firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
        
        self.verify(constraint, firstView: self.mockView, firstAttribute: .Top, secondView: self.mockSuperview, secondAttribute: .Top, relation: .Equal, constant: 0.0)
    }
    
    func testFillSuperview_CreatesLeftConstraint() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsZero)
        
        // Then
        
        var constraint = constraints[1]
        
        var actualResult = constraint.firstAttribute
        var expectedResult = NSLayoutAttribute.Left
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected first constraint's firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testFillSuperview_CreatesBottomConstraint() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsZero)
        
        // Then
        
        var constraint = constraints[2]
        
        var actualResult = constraint.firstAttribute
        var expectedResult = NSLayoutAttribute.Bottom
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected first constraint's firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
        
        self.verify(constraint, firstView: self.mockView, firstAttribute: .Bottom, secondView: self.mockSuperview, secondAttribute: .Bottom, relation: .Equal, constant: 0.0)
    }

    func testFillSuperview_CreatesRightConstraint() {
        
        // When
        let constraints: [NSLayoutConstraint] = self.mockView.fillSuperView(UIEdgeInsetsZero)
        
        // Then
        
        var constraint = constraints[3]
        
        var actualResult = constraint.firstAttribute
        var expectedResult = NSLayoutAttribute.Right
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected first constraint's firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
        
        self.verify(constraint, firstView: self.mockView, firstAttribute: .Right, secondView: self.mockSuperview, secondAttribute: .Right, relation: .Equal, constant: 0.0)
    }

    
    // MARK: - Test - Add Left Constraint methods
    
    func testAddLeftConstraint_AddsConstraint() {
        
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then

        let expectedResult = self.mockSuperview.constraints() as! [NSLayoutConstraint]
        let actualResult: [NSLayoutConstraint] = [leftConstraint]
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain just the leftConstraint but instead it does not it containts \(expectedResult.count) constraints")
    }

    func testAddLeftConstraint_CreatesConstraintWithCorrectFirstItem() {

        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: UIView = self.mockView
        
        var actualResult: UIView = leftConstraint.firstItem as! UIView

        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstItem to be the mockView but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesConstraintWithCorrectFirstAttribute() {

        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: NSLayoutAttribute = .Left
        var actualResult: NSLayoutAttribute = leftConstraint.firstAttribute
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
  
    func testAddLeftConstraint_CreatesConstraintWithCorrectSecondItem() {
        
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: UIView = self.mockSuperview
        var actualResult: UIView = leftConstraint.secondItem as! UIView
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstItem to be the mockSuperview but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesConstraintWithCorrectSecondAttribute() {
      
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: NSLayoutAttribute = .Right
        var actualResult: NSLayoutAttribute = leftConstraint.secondAttribute
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint secondAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesConstraintWithCorrectRelation() {

        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: NSLayoutRelation = .Equal
        var actualResult: NSLayoutRelation = leftConstraint.relation
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint relation to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesConstraintWithCorrectConstant() {
       
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 10.0);
        
        // Then
        var expectedResult: CGFloat = 10.0
        var actualResult: CGFloat = leftConstraint.constant
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint relation to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    
    // MARK: - Verify 
    
    private func verify(constraint: NSLayoutConstraint, firstView: UIView?, firstAttribute: NSLayoutAttribute, secondView: UIView?, secondAttribute: NSLayoutAttribute, relation: NSLayoutRelation?, constant: CGFloat?) {
        
        // First view
        
        if (firstView != nil) {
            
            XCTAssertEqual(constraint.firstItem as! UIView, firstView!, "Error: expected constraint's firstItem to be \(firstView!) but instead it is \(constraint.firstItem)")
            
        } else {
            
            XCTAssertNil(constraint.firstItem, "Error: expected constraint's firstItem to be nil but instead it is not \(constraint.firstItem)")
        }
        
        // Second view
        
        if (secondView != nil) {
            
            XCTAssertEqual(constraint.secondItem as! UIView, secondView!, "Error: expected constraint's secondItem to be \(secondView!) but instead it is \(constraint.secondItem)")
            
        } else {
            
            XCTAssertNil(constraint.secondItem, "Error: expected constraint's secondItem to be nil but instead it is not \(constraint.secondItem)")
        }
        
        XCTAssertEqual(constraint.firstAttribute, firstAttribute, "Error: expected constraint's firstAttribute to be \(firstAttribute) but instead it is \(constraint.firstAttribute)")
        
        XCTAssertEqual(constraint.secondAttribute, secondAttribute, "Error: expected constraint's firstAttribute to be \(secondAttribute) but instead it is \(constraint.firstAttribute.rawValue)")
        
        if let constraintRelation = relation {

            XCTAssertEqual(constraint.relation, constraintRelation, "Error: expected constraint's relation to be \(constraintRelation) but instead it is \(constraint.relation.rawValue)")
        }
        
        if let constraintConstant = constant {

            XCTAssertEqual(constraint.constant, constraintConstant, "Error: expected constraint's constant to be \(constraintConstant) but instead it is \(constraint.constant)")
        }
    }
}
