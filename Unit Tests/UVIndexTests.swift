//
//  UVIndexTests.swift
//  Unit Integration Tests
//
//  Created by Zander Latimer on 9/5/23.
//

import XCTest

@testable import Dewy

class UVIndexTests: XCTestCase {
    
    // MARK: Tests
    
    // MARK: Initialisation Tests
    
    func test_uvIndex_withInvalidValue_shouldNotInitialise() {
        let sut = UVIndex(value: -1)
        
        XCTAssertNil(sut)
    }
    
    func test_uvIndex_withLowerBoundLowValue_shouldInitialiseAsLow() throws {
        let sut = UVIndex(value: 0)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "0")
        XCTAssertEqual(unwrappedSut.classification, "Low")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexLow")
    }
    
    func test_uvIndex_withUpperBoundLowValue_shouldInitialiseAsLow() throws {
        let sut = UVIndex(value: 2.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "2.9")
        XCTAssertEqual(unwrappedSut.classification, "Low")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexLow")
    }
    
    func test_uvIndex_withLowerBoundModerateValue_shouldInitialiseAsModerate() throws {
        let sut = UVIndex(value: 3)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "3")
        XCTAssertEqual(unwrappedSut.classification, "Moderate")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexModerate")
    }
    
    func test_uvIndex_withUpperBoundModerateValue_shouldInitialiseAsModerate() throws {
        let sut = UVIndex(value: 5.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "5.9")
        XCTAssertEqual(unwrappedSut.classification, "Moderate")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexModerate")
    }
    
    func test_uvIndex_withLowerBoundHighValue_shouldInitialiseAsHigh() throws {
        let sut = UVIndex(value: 6)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "6")
        XCTAssertEqual(unwrappedSut.classification, "High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexHigh")
    }
    
    func test_uvIndex_withUpperBoundHighValue_shouldInitialiseAsHigh() throws {
        let sut = UVIndex(value: 7.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "7.9")
        XCTAssertEqual(unwrappedSut.classification, "High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexHigh")
    }
    
    func test_uvIndex_withLowerBoundVeryHighValue_shouldInitialiseAsVeryHigh() throws {
        let sut = UVIndex(value: 8)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "8")
        XCTAssertEqual(unwrappedSut.classification, "Very High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexVeryHigh")
    }
    
    func test_uvIndex_withUpperBoundVeryHighValue_shouldInitialiseAsVeryHigh() throws {
        let sut = UVIndex(value: 10.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "10.9")
        XCTAssertEqual(unwrappedSut.classification, "Very High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexVeryHigh")
    }
    
    func test_uvIndex_withLowerBoundExtremeValue_shouldInitialiseAsExtreme() throws {
        let sut = UVIndex(value: 11)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "11")
        XCTAssertEqual(unwrappedSut.classification, "Extreme")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexExtreme")
    }
    
    func test_uvIndex_withUspperBoundExtremeValue_shouldInitialiseAsExtreme() throws {
        let sut = UVIndex(value: 20)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.displayValue, "20")
        XCTAssertEqual(unwrappedSut.classification, "Extreme")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexExtreme")
    }
}
