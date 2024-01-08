//
//  AppTheme.swift
//  Dewy
//
//  Created by Zander Latimer on 8/1/24.
//

import SwiftUI

/// Defines an 'App Theme' ie. the colour scheme to use throughout the app.
enum AppTheme: String, CaseIterable, UniqueDisplayable {
    
    typealias Content = AnyView
    
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
    
//    var previewColour: String {
//        switch self {
//        case .system:
//            @Environment(\.colorScheme) var colorScheme
//
//            return colorScheme == .dark ? "themeDark-Preview" : "themeLight-Preview"
//        case .light: return "themeLight-Preview"
//        case .dark: return "themeDark-Preview"
//        }
//    }
    
    var descriptionView: Content {
        AnyView(
            HStack {
//                Circle()
//                    .fill(Color(previewColour))
//                    .frame(width: 20, height: 20)
                
                Text(description)
            }
        )
    }
}
