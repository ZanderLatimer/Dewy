//
//  ChangeAppIconViewModel.swift
//  Dewy
//
//  Created by Zander Latimer on 8/1/24.
//

import SwiftUI

class ChangeAppIconViewModel: ObservableObject {
    
    @Published private(set) var selectedAppIcon: AppIcon
    
    init() {
        if let iconName = UIApplication.shared.alternateIconName,
           let appIcon = AppIcon(rawValue: iconName) {
            self.selectedAppIcon = appIcon
        } else {
            self.selectedAppIcon = .original
        }
    }
    
    func updateAppIcon(to icon: AppIcon) {
        let previousAppIcon = selectedAppIcon
        selectedAppIcon = icon
        
        Task { @MainActor in
            guard UIApplication.shared.alternateIconName != icon.iconName else {
                // Already using the chosen icon
                return
            }
            
            do {
                try await UIApplication.shared.setAlternateIconName(icon.iconName)
            } 
            catch {
                // Log the error to catch in development. Should not happen in production!
                print("Updating icon to \(String(describing: icon.iconName)) failed.")
                
                selectedAppIcon = previousAppIcon
            }
        }
    }
}
