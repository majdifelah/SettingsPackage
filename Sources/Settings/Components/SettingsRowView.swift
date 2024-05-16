//
//  SettingsRowView.swift
//  PillsTracker
//
//  Created by Majdi Felah on 14/05/2024.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil

    var body: some View {
        VStack {
            HStack {
                IconBackgroundView(icon: "swift",
                                   symbolVariant: .fill,
                                   font: .system(size: 20, weight: .bold, design: .default),
                                   color: Color.orange,
                                   frame: 24,
                                   padding: 12,
                                   backgroundColor: Color.orange.opacity(0.12),
                                   cornerRadius: 12)

                Text(LocalizedStringKey(name))
                    .foregroundColor(.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if linkLabel != nil && linkDestination != nil {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}
