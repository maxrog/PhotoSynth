//
//  SettingsView.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import SwiftUI

/// A settings view for various app settings / user preferences
struct SettingsView: View {
    
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                } header: {
                    Text("App")
                }
                .headerProminence(.increased)
                Section {
                    HStack {
                        Text("TODO Toggles")
                    }
                    HStack {
                        Text("TODO Toggles")
                    }
                } header: {
                    Text("Theme")
                } footer: {
                    Text("Go ahead and theme your app!")
                }
                .headerProminence(.increased)
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
