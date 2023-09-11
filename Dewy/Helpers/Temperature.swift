//
//  Temperature.swift
//  Dewy
//
//  Created by Zander Latimer on 9/7/23.
//

import Foundation

struct TemperatureHelper {
    
    static func toFahrenheit(celcius: Double) -> Double {
        return (celcius * 9/5) + 32
    }
}
