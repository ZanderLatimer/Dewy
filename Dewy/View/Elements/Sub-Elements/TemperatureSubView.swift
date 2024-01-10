//
//  TemperatureSubView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import SwiftUI

struct TemperatureSubView: View {
    
    private let temperatureCelsius: Decimal?
    
    var body: some View {
        if let temperatureCelsius = temperatureCelsius {
            let temperatureUnit = UserDefaults.standard.preferredTemperatureUnit
            
            let displayString = temperatureUnit.displayString(celcius: temperatureCelsius)
            
            Text(displayString)
        }
        else {
            Text("-")
        }
    }
    
    init(temperatureCelsius: Decimal?) {
        self.temperatureCelsius = temperatureCelsius
    }
}

struct TemperatureSubView_Previews: PreviewProvider {
    
    static var previews: some View {
        TemperatureSubView(temperatureCelsius: 21)
    }
}
