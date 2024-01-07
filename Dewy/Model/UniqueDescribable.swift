//
//  UniqueDescribable.swift
//  Dewy
//
//  Created by Zander Latimer on 6/1/24.
//

import Foundation

/**
 A `UniqueDescribable` has both a unique identifier as well as a human readable description.
 */
protocol UniqueDescribable: Identifiable, Hashable {
    
    var description: String { get }
}
