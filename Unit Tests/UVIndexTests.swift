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
        
        XCTAssertEqual(unwrappedSut.value, 0)
        XCTAssertEqual(unwrappedSut.uvIndex, .low)
        XCTAssertEqual(unwrappedSut.name, "Low")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexLow")
    }
    
    func test_uvIndex_withUpperBoundLowValue_shouldInitialiseAsLow() throws {
        let sut = UVIndex(value: 2.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 2.9)
        XCTAssertEqual(unwrappedSut.uvIndex, .low)
        XCTAssertEqual(unwrappedSut.name, "Low")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexLow")
    }
    
    func test_uvIndex_withLowerBoundModerateValue_shouldInitialiseAsModerate() throws {
        let sut = UVIndex(value: 3)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 3)
        XCTAssertEqual(unwrappedSut.uvIndex, .moderate)
        XCTAssertEqual(unwrappedSut.name, "Moderate")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexModerate")
    }
    
    func test_uvIndex_withUpperBoundModerateValue_shouldInitialiseAsModerate() throws {
        let sut = UVIndex(value: 5.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 5.9)
        XCTAssertEqual(unwrappedSut.uvIndex, .moderate)
        XCTAssertEqual(unwrappedSut.name, "Moderate")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexModerate")
    }
    
    func test_uvIndex_withLowerBoundHighValue_shouldInitialiseAsHigh() throws {
        let sut = UVIndex(value: 6)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 6)
        XCTAssertEqual(unwrappedSut.uvIndex, .high)
        XCTAssertEqual(unwrappedSut.name, "High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexHigh")
    }
    
    func test_uvIndex_withUpperBoundHighValue_shouldInitialiseAsHigh() throws {
        let sut = UVIndex(value: 7.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 7.9)
        XCTAssertEqual(unwrappedSut.uvIndex, .high)
        XCTAssertEqual(unwrappedSut.name, "High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexHigh")
    }
    
    func test_uvIndex_withLowerBoundVeryHighValue_shouldInitialiseAsVeryHigh() throws {
        let sut = UVIndex(value: 8)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 8)
        XCTAssertEqual(unwrappedSut.uvIndex, .veryHigh)
        XCTAssertEqual(unwrappedSut.name, "Very High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexVeryHigh")
    }
    
    func test_uvIndex_withUpperBoundVeryHighValue_shouldInitialiseAsVeryHigh() throws {
        let sut = UVIndex(value: 10.9)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 10.9)
        XCTAssertEqual(unwrappedSut.uvIndex, .veryHigh)
        XCTAssertEqual(unwrappedSut.name, "Very High")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexVeryHigh")
    }
    
    func test_uvIndex_withLowerBoundExtremeValue_shouldInitialiseAsExtreme() throws {
        let sut = UVIndex(value: 11)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 11)
        XCTAssertEqual(unwrappedSut.uvIndex, .extreme)
        XCTAssertEqual(unwrappedSut.name, "Extreme")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexExtreme")
    }
    
    func test_uvIndex_withUspperBoundExtremeValue_shouldInitialiseAsExtreme() throws {
        let sut = UVIndex(value: 20)
        
        let unwrappedSut = try XCTUnwrap(sut)
        
        XCTAssertEqual(unwrappedSut.value, 20)
        XCTAssertEqual(unwrappedSut.uvIndex, .extreme)
        XCTAssertEqual(unwrappedSut.name, "Extreme")
        XCTAssertEqual(unwrappedSut.colour, "uvIndexExtreme")
    }
}
