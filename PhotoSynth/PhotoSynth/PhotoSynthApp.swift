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
    
    var body: some Scene {
        WindowGroup {
            TabNavigationView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch scenePhase {
            case .active:
                /// application became active
                break
            case .background:
                /// application went to background
                break
            case .inactive:
                /// application became inactive
                break
            default:
                break
            }
        }
    }
}
