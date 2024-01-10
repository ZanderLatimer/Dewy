//
//  UserSettings.swift
//  Dewy
//
//  Created by Zander Latimer on 9/13/23.
//

import Foundation

// UserDefaults convenience functions.
extension UserDefaults {
    
    /// Defined keys for accessing data saved in `UserDefaults`.
    enum Keys {
        
        /// Defined keys for accessing data saved for the `UserView` in `UserDefaults`.
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
    
    /// Returns the 'User Name' entered on the `UserView` from `UserDefaults`.
    var userName: String {
        return string(forKey: Keys.UserView.userName) ?? ""
    }
    
    /// Returns the 'Skin Type' entered on the `UserView` from `UserDefaults`.
    var userSkinType: SkinType {
        let rawSkinType = string(forKey: Keys.UserView.skinType)
        
        return SkinType(userDefaultsValue: rawSkinType)
    }
    
    /// Returns the 'Temperature Unit' entered on the `UserView` from `UserDefaults`.
    var preferredTemperatureUnit: TemperatureUnit {
        let rawTemperatureUnit = string(forKey: Keys.UserView.temperatureUnit)
        
        return TemperatureUnit(userDefaultsValue: rawTemperatureUnit)
    }
    
    /// Returns the 'Time Format' entered on the `UserView` from `UserDefaults`.
    var preferredTimeFormat: TimeFormat {
        let rawTimeFormat = string(forKey: Keys.UserView.timeFormat)
        
        return TimeFormat(userDefaultsValue: rawTimeFormat)
    }
    
    /// Returns the 'App Theme' entered on the `UserView` from `UserDefaults`.
    var appTheme: AppTheme {
        let rawAppTheme = string(forKey: Keys.UserView.appTheme)
        
        return AppTheme(userDefaultsValue: rawAppTheme)
    }
}

/// Defines a 'Skin Type' ie. a user selectable value for the type of skin that they have.
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

/// Defines a 'Time Format' ie. the time format to use throughout the app.
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


