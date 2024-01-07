//
//  NavigationLinkWithDescriptionRowView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/26/23.
//

import SwiftUI

/**
 A `List` row that displays a Title, Description and Disclosure Indicator. Navigates to another screen when tapped.
 */
struct NavigationLinkWithDescriptionRowView<LinkContent: View>: View {
    
    private let title: String
    private let description: String
    
    @ViewBuilder private let linkDestination: () -> LinkContent
    
    var body: some View {
        NavigationLink {
            linkDestination()
        } label: {
            HStack {
                Text(title)
                
                Spacer()
                
                Text(description)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    init(title: String, description: String, @ViewBuilder linkDestination: @escaping () -> LinkContent) {
        self.title = title
        self.description = description
        self.linkDestination = linkDestination
    }
}

struct NavigationLinkWithDescriptionRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationLinkWithDescriptionRowView(
            title: "Title",
            description: "Description",
            linkDestination: { Text("Link Destination") }
        )
    }
}
