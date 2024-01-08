//
//  VerticalGridView.swift
//  Dewy
//
//  Created by Zander Latimer on 7/1/24.
//

import SwiftUI

struct VerticalGridView<Content: View>: View {
    
    @ViewBuilder private let content: () -> Content
    
    private let numColumns: Int
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem](repeating: GridItem(.flexible()), count: numColumns)) {
                content()
            }
            .padding()
        }
    }
    
    init(@ViewBuilder content: @escaping () -> Content, numColumns: Int = 3) {
        self.content = content
        self.numColumns = numColumns
    }
}

#Preview {
    VerticalGridView(content: {
        let sampleData = ["checkmark", "person.fill", "sun.and.horizon.fill"]
        
        ForEach(sampleData, id: \.self) { data in
            Image(systemName: data)
        }
    })
}
