//
//  Weather.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import Foundation

class Today: ObservableObject {
    
    @Published var currentWeather: Weather?
}

/**
 Models weather information for a particular time and place, such as the temperature and UV index.
 */
struct Weather: Codable {
    
    let requestTimestamp: Date
    let requestLocation: Location
    
    let forecastTimestamp: Date?
    let forecastLocation: Location?
    let temperatureCelsius: Decimal?
    let uvIndex: UVIndex?
    
    enum CodingKeys: String, CodingKey {
        case requestTimestamp = "request_timestamp"
        case requestLocation = "request_location"
        case forecastTimestamp = "forecast_timestamp"
        case forecastLocation = "forecast_location"
        case temperatureCelsius = "temperature_celsius"
        case uvIndex = "uv_index"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requestTimestamp = try container.decode(Date.self, forKey: .requestTimestamp)
        self.requestLocation = try container.decode(Location.self, forKey: .requestLocation)
        self.forecastTimestamp = try container.decode(Date.self, forKey: .forecastTimestamp)
        self.forecastLocation = try container.decode(Location.self, forKey: .forecastLocation)
        self.temperatureCelsius = try container.decode(Decimal.self, forKey: .temperatureCelsius)
        
        let rawUVIndex = try container.decode(Double.self, forKey: .uvIndex)
        self.uvIndex = UVIndex(value: rawUVIndex)
    }
    
    init(
        requestTimestamp: Date,
        requestLocation: Location,
        forecastTimestamp: Date?,
        forecastLocation: Location?,
        temperatureCelsius: Decimal?,
        uvIndex: UVIndex?) {
            self.requestTimestamp = requestTimestamp
            self.requestLocation = requestLocation
            self.forecastTimestamp = forecastTimestamp
            self.forecastLocation = forecastLocation
            self.temperatureCelsius = temperatureCelsius
            self.uvIndex = uvIndex
    }
}
