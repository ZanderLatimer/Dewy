//
//  UserSettings.swift
//  Dewy
//
//  Created by Zander Latimer on 9/13/23.
//

import Foundation

extension UserDefaults {
    
    enum Keys {
        enum UserView {
            static let userName = "userName"
            static let skinType = "skinType"
            
            static let temperatureUnit = "temperatureUnit"
            static let timeFormat = "timeFormat"
            
            static let appTheme = "appTheme"
            static let appIcon = "appIcon"
            static let appLanguage = "appLanguage"
        }
    }
    
    // MARK: Accessors
    
    // MARK: UserView
    
    var userName: String {
        return string(forKey: Keys.UserView.userName) ?? ""
    }
    
    var userSkinType: SkinType {
        let rawSkinType = string(forKey: Keys.UserView.skinType)
        
        return SkinType(userDefaultsValue: rawSkinType)
    }
    
    var preferredTemperatureUnit: TemperatureUnit {
        let rawTemperatureUnit = string(forKey: Keys.UserView.temperatureUnit)
        
        return TemperatureUnit(userDefaultsValue: rawTemperatureUnit)
    }
    
    var preferredTimeFormat: TimeFormat {
        let rawTimeFormat = string(forKey: Keys.UserView.timeFormat)
        
        return TimeFormat(userDefaultsValue: rawTimeFormat)
    }
    
    var appTheme: AppTheme {
        let rawAppTheme = string(forKey: Keys.UserView.appTheme)
        
        return AppTheme(userDefaultsValue: rawAppTheme)
    }
}

enum SkinType: String, CaseIterable {
    case normal
    case oily
    case dry
    
    init(userDefaultsValue: String?) {
        switch userDefaultsValue {
        case SkinType.normal.rawValue: self = .normal
        case SkinType.oily.rawValue: self = .oily
        case SkinType.dry.rawValue: self = .dry
        default: self = .normal
        }
    }
    
    var description: String {
        switch self {
        case .normal: return "Normal"
        case .oily: return "Oily"
        case .dry: return "Dry"
        }
    }
}

enum TemperatureUnit: String, CaseIterable {
    case celsius
    case fahrenheit
    case both
    
    init(userDefaultsValue: String?) {
        switch userDefaultsValue {
        case TemperatureUnit.celsius.rawValue: self = .celsius
        case TemperatureUnit.fahrenheit.rawValue: self = .fahrenheit
        case TemperatureUnit.both.rawValue: self = .both
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
}

enum TimeFormat: String, CaseIterable {
    case twelveHour
    case twentyFourHour
    
    init(userDefaultsValue: String?) {
        switch userDefaultsValue {
        case TimeFormat.twelveHour.rawValue: self = .twelveHour
        case TimeFormat.twentyFourHour.rawValue: self = .twentyFourHour
        default: self = .twelveHour
        }
    }
    
    var description: String {
        switch self {
        case .twelveHour: return "12h"
        case .twentyFourHour: return "24h"
        }
    }
}

enum AppTheme: String, CaseIterable, UniqueDescribable {
    case system
    case light
    case dark
    
    init(userDefaultsValue: String?) {
        switch userDefaultsValue {
        case AppTheme.system.rawValue: self = .system
        case AppTheme.light.rawValue: self = .light
        case AppTheme.dark.rawValue: self = .dark
        default: self = .system
        }
    }
    
    var id: String {
        return rawValue
    }
    
    var description: String {
        switch self {
        case .system: return "System"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }
}