//
//  AppIconView.swift
//  PillsTracker
//
//  Created by Majdi Felah on 14/05/2024.
//

import SwiftUI

struct AppIconView: View {

  private let fixedColumn = [

          GridItem(.flexible(minimum: 90, maximum: 120)),
          GridItem(.flexible(minimum: 90, maximum: 120)),
          GridItem(.flexible(minimum: 90, maximum: 120))
      ]


  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: fixedColumn, alignment: .center, spacing: 24) {
          ForEach(AppIcon.allCases) { appIcon in
              Button {
                UIApplication.shared.setAlternateIconName(appIcon.value)
              } label: {
                Image(uiImage: UIImage(named: appIcon.rawValue) ?? UIImage())
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(height: 90)
                  .cornerRadius(12)
              }
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .cornerRadius(20)
      }
    }
  }
}

enum AppIcon: String, CaseIterable, Identifiable {
  var id: String { rawValue }
  case appIcon = "AppIcon"
  case appIcon1 = "AppIcon1"
  case appIcon2 = "AppIcon2"
  case appIcon3 = "AppIcon3"
  case appIcon4 = "AppIcon4"

  var value: String? {
    switch self {
    case .appIcon:
      nil
    case .appIcon1:
      "AppIcon1"
    case .appIcon2:
      "AppIcon2"
    case .appIcon3:
      "AppIcon3"
    case .appIcon4:
      "AppIcon4"
    }
  }
}
