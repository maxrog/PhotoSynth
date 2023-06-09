//
//  TabView.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import SwiftUI

struct TabNavigationView: View {
    
    @EnvironmentObject var theme: ThemeManager
    @StateObject var tabs = TabViewModel()
    
    var body: some View {
        TabView(selection: $tabs.selectedTabIndex) {
            Text("Discover")
                .background(theme.backgroundColor)
                .foregroundColor(theme.textColor)
                .tabItem {
                    Image(systemName: "camera.macro.circle")
                }
                .tag(Tabs.discover.rawValue)
            Text("Log")
                .background(theme.backgroundColor)
                .foregroundColor(theme.textColor)
                .tabItem {
                    Image(systemName: "backpack.fill")
                }
                .tag(Tabs.log.rawValue)
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                }
                .tag(Tabs.settings.rawValue)
        }
        .background(theme.backgroundColor)
        .accentColor(theme.accentColor)
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
