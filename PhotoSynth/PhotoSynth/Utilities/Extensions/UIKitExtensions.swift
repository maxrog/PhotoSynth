//
//  UIKitExtensions.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/11/23.
//

import UIKit

// MARK: UIApplication

extension UIApplication {
    
    /// The main scene used throughout the app
    public static var mainScene: UIScene? {
        Self.shared.connectedScenes.first
    }
    
}
