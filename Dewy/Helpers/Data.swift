//
//  Data.swift
//  Dewy
//
//  Created by Zander Latimer on 9/5/23.
//

import Foundation

extension Data {
    
    func decode<T: Decodable>(type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(type, from: self)
    }
}
