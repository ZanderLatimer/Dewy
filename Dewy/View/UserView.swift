//
//  UserView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

struct UserView: View {
    
    @AppStorage(UserDefaults.Keys.UserView.userName) var userName: String = ""
    @AppStorage(UserDefaults.Keys.UserView.skinType) var userSkinType: SkinType = .normal
    @AppStorage(UserDefaults.Keys.UserView.temperatureUnit) var preferredTemperatureUnit: TemperatureUnit = .celsius
    @AppStorage(UserDefaults.Keys.UserView.timeFormat) var preferredTimeFormat: TimeFormat = .twelveHour
    @AppStorage(UserDefaults.Keys.UserView.appTheme) var appTheme: String = "Light"
    @AppStorage(UserDefaults.Keys.UserView.appIcon) var appIcon: String = "Default"
    @AppStorage(UserDefaults.Keys.UserView.appLanguage) var appLanguage: String = "English (US)"
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    DescriptionTapToTextFieldRowView(
                        title: "Name",
                        description: userName.count > 0 ? userName.capitalized : "...",
                        textFieldTitle: "",
                        textFieldPrompt: "Enter your name...",
                        fieldContents: userName,
                        completion: { newName in userName = newName }
                    )
                    
                    DescriptionTapToActionSheetRowView(
                        title: "Skin Type",
                        description: userSkinType.description,
                        options: SkinType.allCases.map { skinType in
                            return (title: skinType.description, action: { userSkinType = skinType })
                        }
                    )
                }
                Section("Settings") {
                    DescriptionTapToActionSheetRowView(
                        title: "Units",
                        description: preferredTemperatureUnit == .both ? "\(TemperatureUnit.celsius.description) | \(TemperatureUnit.fahrenheit.description)" : preferredTemperatureUnit.description,
                        options: TemperatureUnit.allCases.map { temperatureUnit in
                            return (title: temperatureUnit.description, action: { preferredTemperatureUnit = temperatureUnit })
                        }
                    )
                    DescriptionTapToActionSheetRowView(
                        title: "Time Format",
                        description: preferredTimeFormat.description,
                        options: TimeFormat.allCases.map { timeFormat in
                            return (title: timeFormat.description, action: { preferredTimeFormat = timeFormat })
                        }
                    )
                }
                Section("Theme") {
                    DescriptionTapToActionSheetRowView(title: "Theme", description: appTheme, options: [])
                    DescriptionTapToActionSheetRowView(title: "App Icon", description: appIcon, options: [])
                    DescriptionTapToActionSheetRowView(title: "Language", description: appLanguage, options: [])
                }
                Section("About") {
                    DescriptionTapToActionSheetRowView(title: "Info", description: "", options: [])
                    DescriptionTapToActionSheetRowView(title: "About Dewy", description: "", options: [])
                }
            }
            .navigationTitle("About Me")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
