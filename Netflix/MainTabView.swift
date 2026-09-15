//
//  MainTabView.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI


struct MainTabView: View {
    @State private var selectedTab: Tabs = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                    .tabItem {
                      CustomTabLabel(title: "Home", icon: "house")
                    }
                    .tag(Tabs.home)

          SearchView()
                    .tabItem {
                      CustomTabLabel(title: "Search", icon: "magnifyingglass")
                    }
                    .tag(Tabs.search)

            NewAndHotView()
                    .tabItem {
                      CustomTabLabel(title: "New and Hot", icon: "play.rectangle.on.rectangle")
                    }
                    .tag(Tabs.comingSoon)

            DownloadsView()
                    .tabItem {
                      CustomTabLabel(title: "Downloads", icon: "arrow.down.to.line")
                    }
                    .tag(Tabs.downloads)
        }
        .accentColor(.primaryFontColor)
        .preferredColorScheme(.dark)

    }
}

// MARK: - Custom TabBar Labels
struct CustomTabLabel: View {
    var title: String
    var icon: String

    var body: some View {
        Label {
            Text(title)
            .font(.bodyFont)
//                .foregroundColor(.white)
        } icon: {
            Image(systemName: icon)
//                .foregroundColor(.white)
        }
    }
}

enum Tabs {
    case home
    case search
    case comingSoon
    case downloads
}

#Preview {
    MainTabView()
    .preferredColorScheme(.dark)
}
