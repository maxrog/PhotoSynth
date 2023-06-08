//
//  SettingsView.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import SwiftUI

/// A settings view for various app settings / user preferences
struct SettingsView: View {
    
    @EnvironmentObject var theme: ThemeManager

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    
                } header: {
                    Text("App")
                }
                .headerProminence(.increased)
                Section {
                    ColorPicker(selection: $theme.accentColor, supportsOpacity: false) {
                        Text("Accent Color")
                    }
                } header: {
                    Text("Theme")
                } footer: {
                    Text("Go ahead and theme your app!")
                }
                .headerProminence(.increased)
                
                Button("Accent") {
                    theme.accentColor = .red
                }
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
