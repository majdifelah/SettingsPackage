//
//  ReviewManager.swift
//  SettingsView
//
//  Created by Majdi Felah on 16/05/2024.
//

import SwiftUI
import StoreKit

class ReviewManager {

  static func requestForReview() {
    DispatchQueue.main.async {
      if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
        SKStoreReviewController.requestReview(in: scene)
      }
    }
  }

  static func requestReviewManually() {
    let url = "https://apps.apple.com/app/id6482983484?action=write-review"
    guard let writeReviewURL = URL(string: url)
    else { return }
    UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
  }
}

struct UserDefaultsKeys {
  static let appStartUpsCountKey = "appStartUpsCountKey"
  static let appPremiumOfferKey = "appPremiumOfferKey"
  static let lastVersionPromptedForReviewKey = "lastVersionPromptedForReviewKey"
}


