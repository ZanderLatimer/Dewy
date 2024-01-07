//
//  PillView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/13/23.
//

import SwiftUI

/**
 A 'pill' shaped view that displays some text and can be coloured.
 */
struct PillView: View {
    
    enum PillSize {
        case small
        case large
    }
    
    private let value: String
    private let colour: Color
    // TODO: Apply this
    private let size: PillSize
    
    var body: some View {
        Text(value)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.black)
            .padding(6)
            .background(colour)
            .clipShape(RoundedRectangle(cornerRadius: 100))
    }
    
    init(value: String, colour: Color, size: PillSize = .small) {
        self.value = value
        self.colour = colour
        self.size = size
    }
}

struct PillView_Previews: PreviewProvider {
    
    static var previews: some View {
        PillView(value: "UVI 10", colour: .indigo)
    }
}
