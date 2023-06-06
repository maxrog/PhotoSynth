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
                    Image(systemName: "camera.macro.circle")
                        .foregroundColor(settings.theme.accentColor)
                }
                .tag(Tabs.discover.rawValue)
            Text("Log")
                .background(settings.theme.backgroundColor)
                .foregroundColor(settings.theme.textColor)
                .tabItem {
                    Image(systemName: "backpack.fill")
                        .foregroundColor(settings.theme.accentColor)
                }
                .tag(Tabs.log.rawValue)
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .foregroundColor(settings.theme.accentColor)
                }
                .tag(Tabs.settings.rawValue)
        }
        .environmentObject(settings)
    }
    
    /// Tabs
    private enum Tabs: Int {
        case discover = 0
        case log
        case settings
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
