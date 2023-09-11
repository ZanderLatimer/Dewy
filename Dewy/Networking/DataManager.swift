//
//  DataManager.swift
//  Dewy
//
//  Created by Zander Latimer on 9/7/23.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func fetchCurrentWeatherData() async -> Data? {
        try? await Task.sleep(nanoseconds: UInt64(5 * Double(NSEC_PER_SEC)))
        
        let url = Bundle.main.url(forResource: "getWeatherExample", withExtension: "json")!
        
        let data = try? Data(contentsOf: url)
        
        return data
    }
}
