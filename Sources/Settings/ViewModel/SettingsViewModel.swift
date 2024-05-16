//
//  SettingsViewModel.swift
//  PillsTracker
//
//  Created by Majdi Felah on 14/05/2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {

    @Published var theme: ColorScheme? = nil
    @Published var appThemeColor: Color = Color.appTheme

    @Published var shouldShowLocalNotification: Bool = AppUserDefaults.shouldshowLocalNotification

    @Published var title = ""
    @Published var message = ""
    @Published var defaultButtonTitle = "OK"
    @Published var showAlert = false

    init() {
        theme = getTheme()
    }

    func getTheme() -> ColorScheme? {
        let theme = AppUserDefaults.preferredTheme
        var _theme: ColorScheme?
        if theme == 0 {
            _theme = nil
        } else if theme == 1 {
            _theme = ColorScheme.light
        } else {
            _theme = ColorScheme.dark
        }
        return _theme
    }

    func changeAppTheme(theme: Int) {
        AppUserDefaults.preferredTheme = theme
        self.theme = getTheme()
    }

    func changeAppColor(color: Color) {
        let hex = color.uiColor().toHexString()
        if hex.count == 7 {
            AppUserDefaults.appThemeColor = hex
        }
        appThemeColor = Color.appTheme
    }

    func showAlert(title: String = "", message: String = "") {
        self.title = title
        self.message = message
        showAlert = true
    }
}
