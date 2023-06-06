//
//  TabView.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import SwiftUI

struct TabNavigationView: View {
    
    @StateObject var settings = SettingsViewModel()
    
    var body: some View {
        TabView(selection: $settings.selectedTabIndex) {
            Text("Discover")
                .background(settings.theme.backgroundColor)
                .foregroundColor(settings.theme.textColor)
                .tabItem {
                    Image(systemName: "point.3.connected.trianglepath.dotted")
                        .foregroundColor(settings.theme.accentColor)
                }
                .tag(Tabs.discover.rawValue)
            Text("Journal")
                .background(settings.theme.backgroundColor)
                .foregroundColor(settings.theme.textColor)
                .tabItem {
                    Image(systemName: "point.3.connected.trianglepath.dotted")
                        .foregroundColor(settings.theme.accentColor)
                }
                .tag(Tabs.journal.rawValue)
            SettingsView()
                .tabItem {
                    Image(systemName: "point.3.connected.trianglepath.dotted")
                        .foregroundColor(settings.theme.accentColor)
                }
                .tag(Tabs.settings.rawValue)
        }
        .environmentObject(settings)
    }
    
    /// Tabs
    private enum Tabs: Int {
        case discover = 0
        case journal
        case settings
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
