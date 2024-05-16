//
//  SettingsItemView.swift
//  PillsTracker
//
//  Created by Majdi Felah on 14/05/2024.
//

import SwiftUI

struct SettingsItemView: View {
    @State var imageName: String
    @State var color: Color
    @State var title: String
    @State var subtitle: String?
    var action : () -> Void

    var body: some View {
        Button {
            self.action()
        } label: {
            HStack {
                IconBackgroundView(icon: imageName,
                                   symbolVariant: .fill,
                                   font: .system(size: 20, weight: .bold, design: .default),
                                   color: color,
                                   frame: 24,
                                   padding: 12,
                                   backgroundColor: color.opacity(0.12),
                                   cornerRadius: 12)

                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(Font.body)
                        .foregroundColor(.textColor)
                    if let subtitle {
                        Text(subtitle)
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
