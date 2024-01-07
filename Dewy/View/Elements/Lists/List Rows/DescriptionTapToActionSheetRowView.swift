//
//  DescriptionTapToActionSheetRowView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/13/23.
//

import SwiftUI

struct DescriptionTapToActionSheetRowView: View {
    
    private var title: String
    private var description: String
    
    private var options: [(title: String, action: () -> ())]
    
    @State private var showingActionSheet: Bool = false
    
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
    
    init(
        rowTitle: String,
        rowDescription: String,
        actionSheetOptions: [(title: String, action: () -> Void)]) {
        self.title = rowTitle
        self.description = rowDescription
        self.options = actionSheetOptions
    }
}

struct DescriptionTapToActionSheetRowView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTapToActionSheetRowView(
            rowTitle: "Title",
            rowDescription: "Description",
            actionSheetOptions: [("Option A", {})]
        )
    }
}
