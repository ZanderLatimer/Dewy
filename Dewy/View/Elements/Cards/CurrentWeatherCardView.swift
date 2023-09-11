//
//  CurrentWeatherCardView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import SwiftUI

struct CurrentWeatherCardView: View {
    
    let weather: Weather?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Current: ")
                TemperatureSubView(temperatureCelsius: weather?.temperatureCelsius)
            }
            Text("Test")
        }
    }
}

struct CurrentWeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        let weather = Weather(
            requestTimestamp: Date.now,
            requestLocation: Location(latitude: 1.0, longitude: 1.0),
            forecastTimestamp: Date.now,
            forecastLocation: Location(latitude: 1.5, longitude: 2.5),
            temperatureCelsius: 21.0,
            uvIndex: UVIndex(value: 5.3))
        
        CurrentWeatherCardView(weather: weather)
    }
}
