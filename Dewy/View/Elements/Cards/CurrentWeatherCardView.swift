//
//  CurrentWeatherCardView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import SwiftUI

/**
 A card view that displays the current weather.
 */
struct CurrentWeatherCardView: View {
    
    private let weather: Weather?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Current: ")
                TemperatureSubView(temperatureCelsius: weather?.temperatureCelsius)
                
                if let value = weather?.uvIndex?.displayValue,
                   let colour = weather?.uvIndex?.colour {
                    PillView(value: "UVI \(value)", colour: colour)
                }
            }
            Text("Test")
        }
    }
    
    init(weather: Weather?) {
        self.weather = weather
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
