//
//  UVIndex.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import SwiftUI

/**
 Models a UV Index reading, such as its value, classification and colour.
 */
struct UVIndex: Codable {
    
    enum UVIndex: String, Codable {
        case low = "Low"
        case moderate = "Moderate"
        case high = "High"
        case veryHigh = "Very High"
        case extreme = "Extreme"
        
        init?(value: Double) {
            switch value {
            case 0..<3: self = .low
            case 3..<6: self = .moderate
            case 6..<8: self = .high
            case 8..<11: self = .veryHigh
            case 11...: self = .extreme
            default: return nil
            }
        }
        
        var classification: String {
            return self.rawValue
        }
        
        var colour: Color {
            switch self {
            case .low: return Color.UVIndex.Low
            case .moderate: return Color.UVIndex.Moderate
            case .high: return Color.UVIndex.High
            case .veryHigh: return Color.UVIndex.VeryHigh
            case .extreme: return Color.UVIndex.Extreme
            }
        }
    }
    
    private let value: Double
    private let uvIndex: UVIndex
    
    init?(value: Double) {
        // The UVIndex should be a representation of the UV Index as a whole number for display purposes
        // For the precise value, use `value` instead
        guard let uvIndex = UVIndex(value: value.rounded(decimalPlaces: 0)) else {
            return nil
        }
        
        self.value = value
        self.uvIndex = uvIndex
    }
    
    var classification: String {
        return uvIndex.classification
    }
    
    var colour: Color {
        return uvIndex.colour
    }
    
    // MARK: Display
    
    var displayValue: String {
        // Only display the UV Index as a whole number
        return "\(Int(value.rounded(decimalPlaces: 0)))"
    }
}
