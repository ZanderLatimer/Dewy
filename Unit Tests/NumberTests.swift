//
//  NumberTests.swift
//  Unit Integration Tests
//
//  Created by Zander Latimer on 10/1/24.
//

import Foundation

import XCTest

@testable import Dewy

class NumberTests: XCTestCase {
    
    func test_doubleRounded_roundsToCorrectDecimalPlaces() {
        var double = Double(0)
        XCTAssertEqual(double.rounded(decimalPlaces: 3), 0.000)
        
        double = Double(0)
        XCTAssertEqual(double.rounded(decimalPlaces: 0), 0)
        
        double = Double(0.0)
        XCTAssertEqual(double.rounded(decimalPlaces: 0), 0)
        
        double = Double(0.1)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), 0.1)
        
        double = Double(0.001)
        XCTAssertEqual(double.rounded(decimalPlaces: 2), 0.00)
        
        double = Double(0.09)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), 0.1)
        
        double = Double(10)
        XCTAssertEqual(double.rounded(decimalPlaces: 3), 10.000)
        
        double = Double(10)
        XCTAssertEqual(double.rounded(decimalPlaces: 0), 10)
        
        double = Double(10.0)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), 10)
        
        double = Double(10.1)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), 10.1)
        
        double = Double(10.001)
        XCTAssertEqual(double.rounded(decimalPlaces: 2), 10.00)
        
        double = Double(10.09)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), 10.1)
        
        double = Double(-10)
        XCTAssertEqual(double.rounded(decimalPlaces: 3), -10.000)
        
        double = Double(-10)
        XCTAssertEqual(double.rounded(decimalPlaces: 0), -10)
        
        double = Double(-10.0)
        XCTAssertEqual(double.rounded(decimalPlaces: 0), -10)
        
        double = Double(-10.1)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), -10.1)
        
        double = Double(-10.001)
        XCTAssertEqual(double.rounded(decimalPlaces: 2), -10.00)
        
        double = Double(-10.09)
        XCTAssertEqual(double.rounded(decimalPlaces: 1), -10.1)
        
        double = Double(10.8)
        XCTAssertEqual(double.rounded(decimalPlaces: 0), 11)
    }
    
    func test_doubleRound_roundsToCorrectDecimalPlaces() {
        var double = Double(0)
        double.round(decimalPlaces: 3)
        XCTAssertEqual(double, 0.000)
        
        double = Double(0)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, 0)
        
        double = Double(0.0)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, 0)
        
        double = Double(0.1)
        double.round(decimalPlaces: 1)
        XCTAssertEqual(double, 0.1)
        
        double = Double(0.001)
        double.round(decimalPlaces: 2)
        XCTAssertEqual(double, 0.00)
        
        double = Double(0.09)
        double.round(decimalPlaces: 1)
        XCTAssertEqual(double, 0.1)
        
        double = Double(10)
        double.round(decimalPlaces: 3)
        XCTAssertEqual(double, 10.000)
        
        double = Double(10)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, 10)
        
        double = Double(10.0)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, 10)
        
        double = Double(10.1)
        double.round(decimalPlaces: 1)
        XCTAssertEqual(double, 10.1)
        
        double = Double(10.001)
        double.round(decimalPlaces: 2)
        XCTAssertEqual(double, 10.00)
        
        double = Double(10.09)
        double.round(decimalPlaces: 1)
        XCTAssertEqual(double, 10.1)
        
        double = Double(-10)
        double.round(decimalPlaces: 3)
        XCTAssertEqual(double, -10.000)
        
        double = Double(-10)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, -10)
        
        double = Double(-10.0)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, -10)
        
        double = Double(-10.1)
        double.round(decimalPlaces: 1)
        XCTAssertEqual(double, -10.1)
        
        double = Double(-10.001)
        double.round(decimalPlaces: 2)
        XCTAssertEqual(double, -10.00)
        
        double = Double(-10.09)
        double.round(decimalPlaces: 1)
        XCTAssertEqual(double, -10.1)
        
        double = Double(-10.8)
        double.round(decimalPlaces: 0)
        XCTAssertEqual(double, -11)
    }
    
    func test_decimalRounded_roundsToCorrectDecimalPlaces() {
        var decimal = Decimal(0)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 3), 0.000)
        
        decimal = Decimal(0)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), 0)
        
        decimal = Decimal(0.0)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), 0)
        
        decimal = Decimal(0.1)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 1), 0.1)
        
        decimal = Decimal(0.001)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 2), 0.00)
        
        decimal = Decimal(0.09)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 1), 0.1)
        
        decimal = Decimal(10)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 3), 10.000)
        
        decimal = Decimal(10)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), 10)
        
        decimal = Decimal(10.0)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), 10)
        
        decimal = Decimal(10.1)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 1), 10.1)
        
        decimal = Decimal(10.001)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 2), 10.00)
        
        decimal = Decimal(10.09)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 1), 10.1)
        
        decimal = Decimal(-10)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 3), -10.000)
        
        decimal = Decimal(-10)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), -10)
        
        decimal = Decimal(-10.0)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), -10)
        
        decimal = Decimal(-10.1)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 1), -10.1)
        
        decimal = Decimal(-10.001)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 2), -10.00)
        
        decimal = Decimal(-10.09)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 1), -10.1)
        
        decimal = Decimal(10.8)
        XCTAssertEqual(decimal.rounded(decimalPlaces: 0), 11)
    }
    
    func test_decimalRound_roundsToCorrectDecimalPlaces() {
        var decimal = Decimal(0)
        decimal.round(decimalPlaces: 3)
        XCTAssertEqual(decimal, 0.000)
        
        decimal = Decimal(0)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, 0)
        
        decimal = Decimal(0.0)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, 0)
        
        decimal = Decimal(0.1)
        decimal.round(decimalPlaces: 1)
        XCTAssertEqual(decimal, 0.1)
        
        decimal = Decimal(0.001)
        decimal.round(decimalPlaces: 2)
        XCTAssertEqual(decimal, 0.00)
        
        decimal = Decimal(0.09)
        decimal.round(decimalPlaces: 1)
        XCTAssertEqual(decimal, 0.1)
        
        decimal = Decimal(10)
        decimal.round(decimalPlaces: 3)
        XCTAssertEqual(decimal, 10.000)
        
        decimal = Decimal(10)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, 10)
        
        decimal = Decimal(10.0)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, 10)
        
        decimal = Decimal(10.1)
        decimal.round(decimalPlaces: 1)
        XCTAssertEqual(decimal, 10.1)
        
        decimal = Decimal(10.001)
        decimal.round(decimalPlaces: 2)
        XCTAssertEqual(decimal, 10.00)
        
        decimal = Decimal(10.09)
        decimal.round(decimalPlaces: 1)
        XCTAssertEqual(decimal, 10.1)
        
        decimal = Decimal(-10)
        decimal.round(decimalPlaces: 3)
        XCTAssertEqual(decimal, -10.000)
        
        decimal = Decimal(-10)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, -10)
        
        decimal = Decimal(-10.0)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, -10)
        
        decimal = Decimal(-10.1)
        decimal.round(decimalPlaces: 1)
        XCTAssertEqual(decimal, -10.1)
        
        decimal = Decimal(-10.001)
        decimal.round(decimalPlaces: 2)
        XCTAssertEqual(decimal, -10.00)
        
        decimal = Decimal(-10.09)
        decimal.round(decimalPlaces: 1)
        XCTAssertEqual(decimal, -10.1)
        
        decimal = Decimal(10.8)
        decimal.round(decimalPlaces: 0)
        XCTAssertEqual(decimal, 11)
    }
}
