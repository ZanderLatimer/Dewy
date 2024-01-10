//
//  Number+Extensions.swift
//  Dewy
//
//  Created by Zander Latimer on 10/1/24.
//

import Foundation

extension Decimal {
    
    /**
     Rounds the `Decimal` to the specified number of decimal places.
     */
    mutating func round(decimalPlaces: Int, roundingMode: NSDecimalNumber.RoundingMode = .bankers) {
        var localCopy = self
        NSDecimalRound(&self, &localCopy, decimalPlaces, roundingMode)
    }

    /**
     Returns a new `Decimal` rounded to the specified number of decimal places.
     */
    func rounded(decimalPlaces: Int, roundingMode: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var result = Decimal()
        var localCopy = self
        NSDecimalRound(&result, &localCopy, decimalPlaces, roundingMode)
        return result
    }
}

extension Double {
    
    /**
     Rounds the `Double` to the specified number of decimal places.
     */
    mutating func round(decimalPlaces: Int) {
        let multiplier = pow(10, Double(decimalPlaces))
        self = Darwin.round(self * multiplier) / multiplier
    }
    
    /**
     Returns a new `Double` rounded to the specified number of decimal places.
     */
    func rounded(decimalPlaces: Int) -> Double {
        let multiplier = pow(10, Double(decimalPlaces))
        return Darwin.round(self * multiplier) / multiplier
    }
}
