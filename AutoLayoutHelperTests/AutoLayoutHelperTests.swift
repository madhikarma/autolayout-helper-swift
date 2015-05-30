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
    
    var mockView: UIView!
    var mockSuperview: UIView!

    
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


    // MARK: - Add Left Constraint
    
    func testAddLeftConstraint_CreatesConstraint() {
        
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        XCTAssertNotNil(leftConstraint, "Error: expected leftConstraint not to be nil but instead it is")
    }
    
    func testAddLeftConstraint_AddsConstraint() {
        
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: Bool = true
        var actualResult: Bool = ((self.mockSuperview.constraints() as! [NSLayoutConstraint]).filter({$0 == leftConstraint}).count == 1)
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected constraints to contain leftConstraint but instead it does not")
    }

    func testAddLeftConstraint_CreatesAndAddsCorrectNumberOfConstraint() {
        
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: Int = 1
        var actualResult: Int = self.mockSuperview.constraints().count
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected number of constraints to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectFirstItem() {

        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: UIView = self.mockView
        
        var actualResult: UIView = leftConstraint.firstItem as! UIView

        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstItem to be the mockView but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectFirstAttribute() {

        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: NSLayoutAttribute = .Left
        var actualResult: NSLayoutAttribute = leftConstraint.firstAttribute
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
  
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectSecondItem() {
        
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: UIView = self.mockSuperview
        var actualResult: UIView = leftConstraint.secondItem as! UIView
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint firstItem to be the mockSuperview but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectSecondAttribute() {
      
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: NSLayoutAttribute = .Right
        var actualResult: NSLayoutAttribute = leftConstraint.secondAttribute
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint secondAttribute to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectRelation() {

        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 0.0);
        
        // Then
        var expectedResult: NSLayoutRelation = .Equal
        var actualResult: NSLayoutRelation = leftConstraint.relation
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint relation to be \(expectedResult) but instead it is \(actualResult)")
    }
    
    func testAddLeftConstraint_CreatesAndAddsConstraintWithCorrectConstant() {
       
        // When
        var leftConstraint: NSLayoutConstraint = self.mockView.addLeftConstraint(toView: self.mockSuperview, attribute: .Right, relation: .Equal, constant: 10.0);
        
        // Then
        var expectedResult: CGFloat = 10.0
        var actualResult: CGFloat = leftConstraint.constant
        
        XCTAssertEqual(expectedResult, actualResult, "Error: expected leftConstraint relation to be \(expectedResult) but instead it is \(actualResult)")
    }
}
