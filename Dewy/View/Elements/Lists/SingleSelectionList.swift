//
//  SingleSelectionList.swift
//  Dewy
//
//  Created by Zander Latimer on 9/26/23.
//

import SwiftUI

struct SingleSelectionList<ListItem: UniqueDescribable>: View {
    
    @Binding private var selectedListItem: ListItem?
    
    private let listItems: [ListItem]
    private let selectionChangedAction: ((ListItem?) -> ())?
    
    var body: some View {
        List {
            ForEach(listItems, id: \.self) { listItem in
                CheckmarkListRowView<ListItem>(listItem: listItem, selectedListItem: $selectedListItem)
            }
        }
        .onChange(of: selectedListItem) { newValue in
            selectionChangedAction?(newValue)
        }
    }
    
    init(listItems: [ListItem], selectedListItem: Binding<ListItem?>, selectionChangedAction: ((ListItem?) -> ())? = nil) {
            
        self.listItems = listItems
        self._selectedListItem = selectedListItem
        self.selectionChangedAction = selectionChangedAction
    }
}

struct ThemeSelectView_Previews: PreviewProvider {
    static var previews: some View {
        let listItemA = AppTheme.system
        let listItemB = AppTheme.light
        let listItemC = AppTheme.dark
        
        SingleSelectionList(
            listItems: [
                listItemA,
                listItemB,
                listItemC
            ],
            selectedListItem: .constant(listItemA)
        )
    }
}
