//
//  CheckmarkListRow.swift
//  Dewy
//
//  Created by Zander Latimer on 9/26/23.
//

import SwiftUI

struct CheckmarkListRow<ListItem: UniqueDescribable>: View {
    
    @Binding private var selectedListItem: ListItem?
    
    private var listItem: ListItem
    
    var body: some View {
        HStack {
            Text(listItem.description)
            Spacer()
            if selectedListItem?.id == listItem.id {
                Image(systemName: "checkmark")
                    .foregroundStyle(.blue)
            }
        }
        .onTapGesture {
            selectedListItem = listItem
        }
    }
    
    init(listItem: ListItem, selectedListItem: Binding<ListItem?>) {
        self.listItem = listItem
        self._selectedListItem = selectedListItem
    }
}

struct CheckmarkListRow_Previews: PreviewProvider {
    static var previews: some View {
        let listItemA = AppTheme.light
        let listItemB = AppTheme.dark
        
        VStack {
            CheckmarkListRow(listItem: listItemA, selectedListItem: .constant(listItemA))
            CheckmarkListRow(listItem: listItemB, selectedListItem: .constant(listItemA))
        }
    }
}
