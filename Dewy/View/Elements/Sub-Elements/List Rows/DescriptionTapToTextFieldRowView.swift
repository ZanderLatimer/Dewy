//
//  DescriptionTapToTextFieldRowView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/25/23.
//

import SwiftUI

struct DescriptionTapToTextFieldRowView: View {
    
    private enum FocusedField {
        case textField
    }
    
    var title: String
    var description: String
    
    var textFieldTitle: String
    var textFieldPrompt: String
    
    @State var fieldContents: String = ""
    
    var completion: (String) -> ()
    
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
                    
                    Button("OK") {
                        completion(fieldContents)
                    }
                }
        }
        .onAppear {
            focused = true
        }
    }
    
    
}

struct DescriptionTapToTextFieldRowView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTapToTextFieldRowView(
            title: "Name",
            description: "Ness P.",
            textFieldTitle: "",
            textFieldPrompt: "",
            completion: { _ in })
    }
}
