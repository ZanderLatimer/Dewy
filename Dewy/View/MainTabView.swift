//
//  MainTabView.swift
//  Dewy
//
//  Created by Zander Latimer on 9/1/23.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "sun.and.horizon.fill")
                }
            UserView()
                .tabItem {
                    Label("About Me", systemImage: "person.fill")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
