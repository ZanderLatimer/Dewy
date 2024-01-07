//
//  UVIndex.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import Foundation

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
        
        var colour: String {
            switch self {
            case .low: return "uvIndexLow"
            case .moderate: return "uvIndexModerate"
            case .high: return "uvIndexHigh"
            case .veryHigh: return "uvIndexVeryHigh"
            case .extreme: return "uvIndexExtreme"
            }
        }
    }
    
    private let value: Double
    private let uvIndex: UVIndex
    
    var stringValue: String {
        return "\(value)"
    }
    
    var classification: String {
        return uvIndex.classification
    }
    
    var colour: String {
        return uvIndex.colour
    }
    
    init?(value: Double) {
        guard let uvIndex = UVIndex(value: value) else {
            return nil
        }
        
        self.value = value
        self.uvIndex = uvIndex
    }
}
