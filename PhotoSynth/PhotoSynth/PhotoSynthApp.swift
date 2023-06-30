//
//  PhotoSynthApp.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

/*
 Things TODO
 • https://web.plant.id/plant-identification-api/ (DNF has network layer)
 
 • Swift 5.9 / macros simplified swiftUI property Wrappers? Only @State @Environment @Binding ??? Look into this!
 
 • Widget
 • SF Symbol Animation
 • AR?
 
 • Try to see if can get plants in user location and try to have them scan/collect all?
 • Light detector?
 */

import SwiftUI

@main
struct PhotoSynthApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject var theme: ThemeManager = ThemeManager()
   
    var body: some Scene {
        WindowGroup {
            switch theme.preferredStyle {
            case .dark:
                TabNavigationView()
                    .environmentObject(theme)
                    .preferredColorScheme(.dark)
            case .light:
                TabNavigationView()
                    .environmentObject(theme)
                    .preferredColorScheme(.light)
            case .system:
                TabNavigationView()
                    .environmentObject(theme)
                    .preferredColorScheme(.none)
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch scenePhase {
            case .active:
                Logger.log(.action, "Scene active", sender: String(describing: self))
            case .background:
                Logger.log(.action, "Scene backgrounded", sender: String(describing: self))
            case .inactive:
                Logger.log(.action, "Scene inactive", sender: String(describing: self))
            default:
                break
            }
        }
    }
}
