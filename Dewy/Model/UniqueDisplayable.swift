//
//  UniqueDescribable.swift
//  Dewy
//
//  Created by Zander Latimer on 6/1/24.
//

import SwiftUI

/**
 A `UniqueDisplayable` has both a unique identifier as well providing a view to display itself.
 */
protocol UniqueDisplayable: Identifiable, Hashable {
    
    associatedtype Content: View
    
    var description: String { get }
    var descriptionView: Content { get }
}
