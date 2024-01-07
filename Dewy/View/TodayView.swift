//
//  TodayView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

/**
 Defines the 'Today' screen.
 */
struct TodayView: View {
    
    @EnvironmentObject private var today: Today
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Today is hot! 🔥")
                    
                ScrollView {
                    LazyVStack {
                        ForEach(0...2, id: \.self) { _ in
                            InfoCardWrapperView<CurrentWeatherCardView>(content: { CurrentWeatherCardView(weather: today.currentWeather) })
                        }
                        .padding(10)
                    }
                    .padding(10)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Welcome to Dewy 💦")
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    
    static var previews: some View {
        TodayView().environmentObject(Today())
    }
}
