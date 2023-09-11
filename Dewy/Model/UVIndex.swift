//
//  UVIndex.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import Foundation

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
        
        var description: String {
            return self.rawValue
        }
        
        var colour: String {
            switch self {
            case .low: return "uv_index_low"
            case .moderate: return "uv_index_moderate"
            case .high: return "uv_index_high"
            case .veryHigh: return "uv_index_very_high"
            case .extreme: return "uv_index_extreme"
            }
        }
    }
    
    let value: Double
    let uvIndex: UVIndex
    
    var name: String {
        return uvIndex.description
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