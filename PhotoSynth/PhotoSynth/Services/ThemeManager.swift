//
//  ThemeManager.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import Foundation
import Combine
import SwiftUI

/*
TODO test system preference + changing back and forth
 */

/// Manager for the user's app/color theme preference
class ThemeManager: ObservableObject {
    
    let userDefaults = UserDefaults.standard
    
    init() {
        self.accentColor = userDefaults.object(forKey: ThemeUserDefaults.accentColorKey) as? Color ?? .green
    }
    
    // MARK: Preferences
    
    /// Mark the user's preferred theming style
    @Published private(set) var preferredStyle: PreferredUserInterfaceStyle = .system
    
    /// Whether user has opted to use something other than system settings
    var shouldOverrideSystemSetting: Bool {
        get { userDefaults.bool(forKey:ThemeUserDefaults.overrideSystemKey) }
        set {
            userDefaults.set(newValue, forKey:ThemeUserDefaults.overrideSystemKey)
            updateThemeSubject()
        }
    }
    
    /// Whether user has opted for a light or a dark mode
    var shouldApplyDarkMode: Bool {
        get { userDefaults.bool(forKey: ThemeUserDefaults.applyDarkModeKey) }
        set {
            userDefaults.set(newValue, forKey: ThemeUserDefaults.applyDarkModeKey)
            updateThemeSubject()
        }
    }
    
    /// Update the current value subject when settings change
    private func updateThemeSubject() {
        if shouldOverrideSystemSetting {
            preferredStyle = shouldApplyDarkMode ? .dark : .light
        } else {
            preferredStyle = .system
        }
    }
    
    // MARK: Colors
    
    /// Determines whether system is in dark mode
    private lazy var systemInDarkMode: Bool = {
        UIScreen.main.traitCollection.userInterfaceStyle == .dark
    }()
    
    /// Theme text color (if overriding system settings)
    var textColor: Color {
        switch preferredStyle {
        case .dark:
            return Color.white
        case .light:
            return Color.black
        case .system:
            return systemInDarkMode ? Color.white : Color.black
        }
    }
    
    /// Theme background color (if overriding system settings)
    var backgroundColor: Color {
        switch preferredStyle {
        case .dark:
            return Color.black
        case .light:
            return Color.white
        case .system:
            return systemInDarkMode ? Color.black : Color.white
        }
    }
    
    /// Theme accent color
    @Published var accentColor: Color = .green {
        didSet {
            userDefaults.setColor(accentColor, forKey: ThemeUserDefaults.accentColorKey)
        }
    }
    
}

/// User's preferred user interface style
enum PreferredUserInterfaceStyle {
    case dark, light, system
}

/// User Default Keys
private struct ThemeUserDefaults {
    static let overrideSystemKey = "rogers.max.photosynth.themeoverridesystemsettingkey"
    static let applyDarkModeKey = "rogers.max.photosynth.applydarkmodekey"
    
    static let accentColorKey = "rogers.max.themeaccentcolor"
}
