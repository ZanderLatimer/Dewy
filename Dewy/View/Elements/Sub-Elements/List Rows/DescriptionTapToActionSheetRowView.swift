//
//  DescriptionTapToActionSheetRowView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/13/23.
//

import SwiftUI

struct DescriptionTapToActionSheetRowView: View {
    
    var title: String
    var description: String
    
    var options: [(title: String, action: () -> ())]
    
    @State var showingActionSheet: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(description)
                .foregroundColor(.blue)
                .onTapGesture {
                    showingActionSheet = true
                }
                .confirmationDialog("", isPresented: $showingActionSheet, titleVisibility: .hidden) {
                    ForEach(options, id: \.title) { option in
                        Button(option.title, action: option.action)
                    }
                }
        }
    }
}

struct DescriptionTapToActionSheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTapToActionSheetRowView(title: "Title", description: "Description", options: [("Option A", {})])
    }
}
