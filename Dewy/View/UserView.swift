//
//  UserView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

/**
 Defines the 'User' aka 'About Me' screen.
 */
struct UserView: View {
    
    @AppStorage(UserDefaults.Keys.UserView.userName) private var userName: String = ""
    @AppStorage(UserDefaults.Keys.UserView.skinType) private var userSkinType: SkinType = .normal
    @AppStorage(UserDefaults.Keys.UserView.temperatureUnit) private var preferredTemperatureUnit: TemperatureUnit = .celsius
    @AppStorage(UserDefaults.Keys.UserView.timeFormat) private var preferredTimeFormat: TimeFormat = .twelveHour
    @AppStorage(UserDefaults.Keys.UserView.appTheme) private var appTheme: AppTheme = .system
    @AppStorage(UserDefaults.Keys.UserView.appLanguage) private var appLanguage: String = "English (US)"
    
    @StateObject private var changeAppIconViewModel = ChangeAppIconViewModel()
    
    @State private var appIcon: AppIcon?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    DescriptionTapToTextFieldRowView(
                        rowTitle: "Name",
                        rowDescription: userName.count > 0 ? userName.capitalized : "...",
                        textFieldTitle: "",
                        textFieldPrompt: "Enter your name...",
                        textFieldContents: userName,
                        completion: { newName in userName = newName }
                    )
                    
                    DescriptionTapToActionSheetRowView(
                        rowTitle: "Skin Type",
                        rowDescription: userSkinType.description,
                        actionSheetOptions: SkinType.allCases.map { skinType in
                            return (title: skinType.description, action: { userSkinType = skinType })
                        }
                    )
                }
                Section("Settings") {
                    DescriptionTapToActionSheetRowView(
                        rowTitle: "Units",
                        rowDescription: preferredTemperatureUnit == .both ? "\(TemperatureUnit.celsius.description) | \(TemperatureUnit.fahrenheit.description)" : preferredTemperatureUnit.description,
                        actionSheetOptions: TemperatureUnit.allCases.map { temperatureUnit in
                            return (title: temperatureUnit.description, action: { preferredTemperatureUnit = temperatureUnit })
                        }
                    )
                    DescriptionTapToActionSheetRowView(
                        rowTitle: "Time Format",
                        rowDescription: preferredTimeFormat.description,
                        actionSheetOptions: TimeFormat.allCases.map { timeFormat in
                            return (title: timeFormat.description, action: { preferredTimeFormat = timeFormat })
                        }
                    )
                }
                Section("App") {
                    NavigationLinkWithDescriptionRowView(
                        title: "Theme",
                        description: appTheme.description,
                        linkDestination: {
                            SingleSelectionListView<AppTheme>(
                                listItems: AppTheme.allCases,
                                selectedListItem: Binding<AppTheme?>($appTheme),
                                selectionChangedAction: { newValue in
                                    // TODO: Change the theme here
                                }
                            )
                            .navigationTitle("Theme")
                                
                        }
                    )
                    
                    NavigationLinkWithDescriptionRowView(
                        title: "App Icon",
                        description: nil,
                        linkDestination: {
                            SingleSelectionListView<AppIcon>(
                                listItems: AppIcon.allCases,
                                selectedListItem: Binding<AppIcon?>(projectedValue: $appIcon),
                                selectionChangedAction: { newValue in
                                    if let newValue = newValue {
                                        changeAppIconViewModel.updateAppIcon(to: newValue)
                                    }
                                })
                            .navigationTitle("App Icon")
                        })
                    
                    DescriptionTapToActionSheetRowView(rowTitle: "Language", rowDescription: appLanguage, actionSheetOptions: [])
                }
                Section("About") {
                    DescriptionTapToActionSheetRowView(rowTitle: "Info", rowDescription: "", actionSheetOptions: [])
                    DescriptionTapToActionSheetRowView(rowTitle: "About Dewy", rowDescription: "", actionSheetOptions: [])
                }
            }
            .navigationTitle("About Me")
        }
        .onAppear() {
            appIcon = changeAppIconViewModel.selectedAppIcon
        }
    }
}

struct UserView_Previews: PreviewProvider {
    
    static var previews: some View {
        UserView()
    }
}
