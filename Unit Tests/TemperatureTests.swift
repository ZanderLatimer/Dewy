//
//  TemperatureTests.swift
//  Unit Integration Tests
//
//  Created by Zander Latimer on 9/7/23.
//

import XCTest

@testable import Dewy

class TemperatureTests: XCTestCase {
    
    func test_temperatureHelper_toFahrenheit_shouldConvertCorrectly() {
        var result = TemperatureHelper.toFahrenheit(celcius: 0)
        XCTAssertEqual(result, 32)
        
        result = TemperatureHelper.toFahrenheit(celcius: 20)
        XCTAssertEqual(result, 68)
        
        result = TemperatureHelper.toFahrenheit(celcius: 50)
        XCTAssertEqual(result, 122)
        
        result = TemperatureHelper.toFahrenheit(celcius: -20)
        XCTAssertEqual(result, -4)
        
        result = TemperatureHelper.toFahrenheit(celcius: -50)
        XCTAssertEqual(result, -58)
        
        result = TemperatureHelper.toFahrenheit(celcius: 5.5)
        XCTAssertEqual(result, 41.9)
        
        result = TemperatureHelper.toFahrenheit(celcius: -5.5)
        XCTAssertEqual(result, 22.1)
    }
}
