//
//  Color+Extensions.swift
//  Dewy
//
//  Created by Zander Latimer on 10/1/24.
//

import SwiftUI

extension Color {
    
    enum UVIndex {
        static var Low: Color {
            return Color("uvIndexLow")
        }
        
        static var Moderate: Color {
            return Color("uvIndexModerate")
        }
        
        static var High: Color {
            return Color("uvIndexHigh")
        }
        
        static var VeryHigh: Color {
            return Color("uvIndexVeryHigh")
        }
        
        static var Extreme: Color {
            return Color("uvIndexExtreme")
        }
    }
}
