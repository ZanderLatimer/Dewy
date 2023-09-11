//
//  InfoCardWrapperView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

struct InfoCardWrapperView<Content: View>: View {
    
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 5)

            VStack {
                content()
            }
            .padding(20)
        }
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}

struct InfoCardWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        InfoCardWrapperView(content: { Text("Hello, world!") })
    }
}
