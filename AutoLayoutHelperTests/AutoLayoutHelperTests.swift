//
//  AutoLayoutHelperTests.swift
//  AutoLayoutHelperTests
//
//  Created by Shagun Madhikarmi on 26/10/2014.
//  Copyright (c) 2014 madhikarma. All rights reserved.
//

import UIKit
import XCTest

class AutoLayoutHelperTests: XCTestCase {
    
    var mockView: UIView = UIView(frame: CGRectZero)
    var mockViewSuperview: UIView = UIView(frame: CGRectZero)

    var leftConstraint: NSLayoutConstraint?

    
    // MARK: - Setup / Teardown
    
    override func setUp() {

        super.setUp()
        
        // Given

        self.mockViewSuperview.addSubview(mockView)

        // When
        
        self.leftConstraint = mockView.addLeftConstraint(toView: mockViewSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
    }
    
    override func tearDown() {
        
        super.tearDown()
        
        self.mockView.removeFromSuperview()
        self.mockViewSuperview.removeConstraint(self.leftConstraint!)
    }


    // MARK: - Add Left Constraint
    
    func testAddLeftConstraint_CreatesConstraint() {
        
        // Then
        
        // creates constraint
        
        XCTAssertNotNil(self.leftConstraint, "Error: expected leftConstraint not to be nil but instead it is")
    }
    
    func testAddLeftConstraint_AddsConstraint() {
        
        // Then
        
        // superview contains constraint
        
        var expectedResult: Bool = true
        var actualResult: Bool = ((self.mockViewSuperview.constraints() as! [NSLayoutConstraint]).filter({$0 == self.leftConstraint!}).count == 1)
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain leftConstraint but instead it does not")
    }

    func testAddLeftConstraint_CreatesAndAddsCorrectNumberOfConstraint() {
        
        // Then
        
        // number of constraints
        
        var expectedResult: Int = 1
        var actualResult: Int = mockViewSuperview.constraints().count
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected number of constraints to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectFirstItem() {

        // Then
        
        // constraint firstView is correct
        
        var expectedResult: UIView = self.mockView
        var actualResult: UIView = leftConstraint!.firstItem as! UIView
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstItem to be the mockView but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectFirstAttribute() {

        // Then
        
        // constraint firstAttribute is correct
        
        var expectedResult: NSLayoutAttribute = .Left
        var actualResult: NSLayoutAttribute = self.leftConstraint!.firstAttribute
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
  
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectSecondItem() {
        // And
        
        // constraint secondView is correct
        
        var expectedResult: UIView = mockViewSuperview
        var actualResult: UIView = leftConstraint!.secondItem as! UIView
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstItem to be the mockViewSuperview but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectSecondAttribute() {
      
        // Then
        
        // constraint secondView is correct
        
        var expectedResult: NSLayoutAttribute = .Right
        var actualResult: NSLayoutAttribute = leftConstraint!.secondAttribute
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint secondAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectRelation() {

        // Then
        
        // constraint relation is correct
        
        var expectedResult: NSLayoutRelation = .Equal
        var actualResult: NSLayoutRelation = leftConstraint!.relation
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint relation to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectConstraint() {
        
        // Then
        
        // constraint relation is correct
        
        var expectedResult: CGFloat = 10.0
        var actualResult: CGFloat = leftConstraint!.constant
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint relation to be \(expectedResult) but instead it is \(actualResult)")
    }
}
