//
//  UserView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

struct UserView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("My Info #1")
                    Text("My Info #2")
                    Text("My Info #3")
                    Text("My Info #4")
                }
                Section("Settings") {
                    Text("Setting #1")
                }
            }
            .navigationTitle("About Me")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
