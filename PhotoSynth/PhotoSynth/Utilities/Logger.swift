//
//  Logger.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/6/23.
//

import UIKit

struct Logger {
    
    static var logLevel: LogLevel = .verbose
    
    /// Log an app event
    /// - Parameters:
    ///   - logType: error, fatal, warning, success, action, cancelled
    ///   - message: Simple message to log
    ///   - sender: String describing callsite
    ///   - verbose: Additional log messaging to provide
    static func log(_ logType: LogType, _ message: String, sender: String, verbose: String? = nil) {
        guard logLevel != .none else { return }
        switch logType {
        case .error:
            debugPrint("📕 Error: \(message) \(sender)")
        case .fatal:
            assertionFailure("📕 FATAL: \(message) \(sender)")
        case .warning:
            debugPrint("📙 Warning: \(message) \(sender)")
        case .success:
            debugPrint("📗 Success: \(message) \(sender)")
        case .action:
            debugPrint("📘 Action: \(message) \(sender)")
        case .cancelled:
            debugPrint("📓 Cancelled: \(message) \(sender)")
        }
        if let verbose = verbose, logLevel == .verbose {
            debugPrint("\(sender) \n \(verbose)")
        }
    }
    
}

enum LogType: String {
    case error
    case fatal
    case warning
    case success
    case action
    case cancelled
}

enum LogLevel {
    case none, standard, verbose
}
