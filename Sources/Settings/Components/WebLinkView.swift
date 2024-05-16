//
//  WebLinkView.swift
//  PillsTracker
//
//  Created by Majdi Felah on 14/05/2024.
//

import SwiftUI
import WebKit

struct WebLinkView: View {

    @State var url: String
    @State var title: String

    var body: some View {
        NavigationView {
            WebView(url: URL(string: url)!)
                .ignoresSafeArea()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WebView: UIViewRepresentable {
    // 1
    let url: URL


    // 2
    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }

    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: url)
        webView.load(request)
    }
}

