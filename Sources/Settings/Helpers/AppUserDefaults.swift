//
//  AppUserDefaults.swift
//  PillTracker
//
//  Created by Majdi Felah on 15/05/2024.
//

import Foundation

struct AppUserDefaults {
    @UserDefault("appThemeColor", defaultValue: "")
    static var appThemeColor: String

    @UserDefault("preferredTheme", defaultValue: 0)
    static var preferredTheme: Int

    @UserDefault("shouldshowLocalNotification", defaultValue: false)
    static var shouldshowLocalNotification: Bool

    @UserDefault("isOnboarding", defaultValue: true)
    static var isOnboarding: Bool

    @UserDefault("reminderDate", defaultValue: 0.0)
    static var reminderDate: Double

    @UserDefault("shouldShowInitScreen", defaultValue: true)
    static var shouldShowInitScreen: Bool

    @UserDefault("shouldShowWelcomeScreen", defaultValue: true)
    static var shouldShowWelcomeScreen: Bool

    @UserDefault("shouldShowPaymentScreen", defaultValue: true)
    static var shouldShowPaymentScreen: Bool

    @UserDefault("counter", defaultValue: 0)
    static var counter: Int
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

