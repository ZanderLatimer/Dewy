//
//  TemperatureHelper.swift
//  Dewy
//
//  Created by Zander Latimer on 9/7/23.
//

import Foundation

/**
 A series of temperature related convenience functions.
 */
struct TemperatureHelper {
    
    /// Converts a given celcius value into fahrenheit.
    static func toFahrenheit(celcius: Decimal) -> Decimal {
        return (celcius * 9/5) + 32
    }
    
    /// Converts a given fahrenheit value into celcius.
    static func toCelcius(fahrenheit: Decimal) -> Decimal {
        return (fahrenheit - 32) * 5/9
    }
}
