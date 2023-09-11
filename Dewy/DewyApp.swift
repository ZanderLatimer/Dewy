//
//  DewyApp.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

@main
struct DewyApp: App {
    
    @StateObject var today = Today()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(today)
                .onAppear(perform: performInitialLoad)
        }
    }
    
    func performInitialLoad() {
        Task {
            let currentWeatherData = await DataManager.shared.fetchCurrentWeatherData()
            let currentWeather = try currentWeatherData?.decode(type: Weather.self)
            
            today.currentWeather = currentWeather
        }
    }
}
