//
//  AppIcon.swift
//  Dewy
//
//  Created by Zander Latimer on 7/1/24.
//

import SwiftUI

enum AppIcon: String, CaseIterable, UniqueDisplayable {
    
    typealias Content = AnyView
    
    case original = "AppIcon"
    case purple = "AppIconPurple"
    case green = "AppIconGreen"
    case orange = "AppIconOrange"
    case black = "AppIconBlack"
    
    var id: String {
        return rawValue
    }
    
    var iconName: String? {
        switch self {
        case .original: return nil
        default: return id
        }
    }
    
    var preview: Image? {
        Image(id + "-Preview")
    }

    var description: String {
        switch self {
        case .original: return "Original"
        case .purple: return "Purple"
        case .green: return "Green"
        case .orange: return "Orange"
        case .black: return "Black"
        }
    }
    
    var descriptionView: Content {
        AnyView(
            HStack {
                if let preview = preview {
                    preview
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                }
                
                Text(description)
            }
        )
    }
}
