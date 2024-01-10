//
//  TemperatureUnit.swift
//  Dewy
//
//  Created by Zander Latimer on 10/1/24.
//

import Foundation

/// Defines a 'Temperature Unit' ie. the temperature style to use throughout the app.
enum TemperatureUnit: String, CaseIterable {
    case celsius
    case fahrenheit
    case both
    
    // MARK: UserSettings
    
    init(userDefaultsValue: String?) {
        switch userDefaultsValue {
        case TemperatureUnit.celsius.rawValue: self = .celsius
        case TemperatureUnit.fahrenheit.rawValue: self = .fahrenheit
        case TemperatureUnit.both.rawValue: self = .both
        // If the user has not saved a unit to UserDefaults, then we make a choice
        // based on their location
        default:
            switch Locale.autoupdatingCurrent.measurementSystem {
            case .metric, .uk: self = .celsius
            case .us: self = .fahrenheit
            default: self = .celsius // If we have no information at all, default to celsius
            }
        }
    }
    
    var description: String {
        switch self {
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        case .both: return "Both"
        }
    }
    
    // MARK: Display
    
    /// Returns a `String` representing this `TemperatureUnit` as a whole number.
    func displayString(celcius: Decimal) -> String {
        let fahrenheit = TemperatureHelper.toFahrenheit(celcius: celcius).rounded(decimalPlaces: 0)
        
        return displayString(celcius: celcius, fahrenheit: fahrenheit)
    }
    
    /// Returns a `String` representing this `TemperatureUnit` as a whole number.
    func displayString(fahrenheit: Decimal) -> String {
        let celcius = TemperatureHelper.toCelcius(fahrenheit: fahrenheit).rounded(decimalPlaces: 0)
        
        return displayString(celcius: celcius, fahrenheit: fahrenheit)
    }
    
    private func displayString(celcius: Decimal, fahrenheit: Decimal) -> String {
        switch self {
        case .celsius:
            return "\(celcius)°C"
        case .fahrenheit:
            return "\(fahrenheit)°F"
        case .both:
            return "\(celcius)°C|\(fahrenheit)°F"
        }
    }
}
