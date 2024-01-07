//
//  UniqueDescribable.swift
//  Dewy
//
//  Created by Zander Latimer on 6/1/24.
//

import Foundation

protocol UniqueDescribable: Identifiable, Hashable {
    var description: String { get }
}
