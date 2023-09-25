//
//  TemperatureSubView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import SwiftUI

struct TemperatureSubView: View {
    
    private enum DisplayType: String {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenhiet"
        case both = "Both"
        
        init(rawValue: String?) {
            switch rawValue {
            case DisplayType.celsius.rawValue: self = .celsius
            case DisplayType.fahrenheit.rawValue: self = .fahrenheit
            case DisplayType.both.rawValue: self = .both
            default:
                switch Locale.autoupdatingCurrent.measurementSystem {
                case .metric, .uk: self = .celsius
                case .us: self = .fahrenheit
                default: self = .celsius // If we have no information at all, default to celsius
                }
            }
        }
    }
    
    private let temperatureCelsius: Double?
    
    var body: some View {
        if let temperatureCelsius = temperatureCelsius {
            let rawDisplayType = UserDefaults.standard.string(forKey: "TemperatureDisplayType")
            
            let displayType = DisplayType(rawValue: rawDisplayType)
            
            switch displayType {
            case .celsius:
                Text("\(Int(temperatureCelsius))°C")
            case .fahrenheit:
                let fahrenheit = TemperatureHelper.toFahrenheit(celcius: temperatureCelsius)
                Text("\(Int(fahrenheit))°F")
            case .both:
                let fahrenheit = TemperatureHelper.toFahrenheit(celcius: temperatureCelsius)
                Text("\(Int(temperatureCelsius))°C|\(Int(fahrenheit))°F")
            }
        }
        else {
            Text("-")
        }
    }
    
    init(temperatureCelsius: Double?) {
        self.temperatureCelsius = temperatureCelsius
    }
}

struct TemperatureSubView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureSubView(temperatureCelsius: 21)
    }
}
