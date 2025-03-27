//
//  MainTabView.swift
//  MovieApp-iOS
//
//  Created by Allan Viana on 26/03/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(Color.black)
        appearance.stackedLayoutAppearance.selected.iconColor = .white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]

        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
            
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
                .tag(1)
        }
        .accentColor(.white)
    }
}
