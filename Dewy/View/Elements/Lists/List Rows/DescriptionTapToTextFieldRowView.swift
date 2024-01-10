//
//  DescriptionTapToTextFieldRowView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/25/23.
//

import SwiftUI

/**
 A `List` row that displays a Title and Description. Presents a `TextField` when tapped.
 */
struct DescriptionTapToTextFieldRowView: View {
    
    private enum FocusedField {
        case textField
    }
    
    private let title: String
    private let description: String
    
    private let textFieldTitle: String
    private let textFieldPrompt: String
    
    private let completion: (String) -> ()
    
    @State private var fieldContents: String = ""
    
    @State private var showingAlert: Bool = false
    @FocusState private var focused: Bool
    
    var body: some View {
        HStack {
            Text(title)
            
            Spacer()
            
            Text(description)
                .foregroundColor(.blue)
                .onTapGesture {
                    showingAlert = true
                }
                .alert(textFieldTitle, isPresented: $showingAlert) {
                    TextField("", text: $fieldContents, prompt: Text(textFieldPrompt))
                        .focused($focused)
                        .autocorrectionDisabled()
                    
                    Button("OK") {
                        completion(fieldContents)
                    }
                }
        }
        .onAppear {
            focused = true
        }
    }
    
    init(
        rowTitle: String,
        rowDescription: String,
        textFieldTitle: String,
        textFieldPrompt: String,
        textFieldContents: String,
        completion: @escaping (String) -> Void) {
        self.title = rowTitle
        self.description = rowDescription
        self.textFieldTitle = textFieldTitle
        self.textFieldPrompt = textFieldPrompt
        self.fieldContents = textFieldContents
        self.completion = completion
    }
}

struct DescriptionTapToTextFieldRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        DescriptionTapToTextFieldRowView(
            rowTitle: "Name",
            rowDescription: "Ness P.",
            textFieldTitle: "",
            textFieldPrompt: "",
            textFieldContents: "",
            completion: { _ in })
    }
}
