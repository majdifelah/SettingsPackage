//
//  SettingsView.swift
//  PillsTracker
//
//  Created by Majdi Felah on 12/05/2024.
//

import CoreLocation
import SwiftUI

var DEVELOPER = "Copyright © Majdi Felah"
var WEBSITE_LABEL = "www.majdielfelah.co.uk"
var WEBSITE_LINK = "www.majdielfelah.co.uk"

public struct SettingsView: View {
    @ObservedObject var inAppPurchaseViewModel = InAppPurchaseViewModel()
    @ObservedObject var settingsViewModel = SettingsViewModel()

    @State private var themeType = AppUserDefaults.preferredTheme
    @State private var showSubscriptionFlow: Bool = false
    @State private var showPrivacyPolicy = false
    @State private var showTerms = false
    @State private var showApps = false

    /// Email Body
    @State private var sendEmail = false
    @State private var suggestFeatureEmail = false
    @State private var reportBugEmail = false

    @State private var stocksBalance: Double = 0.0

    @State private var mailData = ComposeMailData(subject: "Feedback/Suggest Feature/Report Bug",
                                                  recipients: ["contact.startechnology@gmail.com"],
                                                  message: "Please write a message",
                                                  attachments: [AttachmentData(data: "\(Bundle.main.appName), App Version \(Bundle.main.versionNumber)(\(Bundle.main.buildNumber)), OS version: \(UIDevice.current.systemVersion), Device \(UIDevice.current.name), Device Model: \(DeviceInfoHelper.specificModelType)".data(using: .utf8)!,
                                                                               mimeType: "text/plain",
                                                                               fileName: "text.txt")])

  public init() {}

  public var body: some View {
        NavigationView {
            List {
                Section(header: Text("Preferences")) {
                    HStack {
                        IconBackgroundView(icon: Icons.paintbrush,
                                           symbolVariant: .fill,
                                           font: .system(size: 20, weight: .bold, design: .default),
                                           color: Color.pink,
                                           frame: 24,
                                           padding: 12,
                                           backgroundColor: Color.pink.opacity(0.12),
                                           cornerRadius: 12)

                        ColorPicker("Tint Color", selection: $settingsViewModel.appThemeColor.onChange(colorChange))
                    }

                    HStack {
                        IconBackgroundView(icon: Icons.moon,
                                           symbolVariant: .fill,
                                           font: .system(size: 20, weight: .bold, design: .default),
                                           color: Color.purple,
                                           frame: 24,
                                           padding: 12,
                                           backgroundColor: Color.purple.opacity(0.12),
                                           cornerRadius: 12)
                        Text("Theme")
                        Spacer()
                        Picker("Theme", selection: $themeType.onChange(themeChange)) {
                            Text("System")
                                .tag(0)
                            Text("Light")
                                .tag(1)
                            Text("Dark")
                                .tag(2)
                        }
                        // .fixedSize()
                        .pickerStyle(.segmented)
                    }
                }

                Section(header: Text("General")) {
                  NavigationLink {
                    AppIconView()
                  } label: {
                      IconBackgroundView(icon: Icons.app,
                                         symbolVariant: .fill,
                                         font: .system(size: 20, weight: .bold, design: .default),
                                         color: Color.darkBlue,
                                         frame: 24,
                                         padding: 12,
                                         backgroundColor: Color.darkBlue.opacity(0.12),
                                         cornerRadius: 12)
                      Text("Text Themes")
                  }
                    SettingsItemView(imageName: Icons.share, color: Color.indigo, title: "Share with your friends") {
                        actionSheet()
                    }
                    SettingsItemView(imageName: Icons.review, color: Color.red, title: "Write Review") {
                        ReviewManager.requestReviewManually()
                    }

                    SettingsItemView(imageName: Icons.email, color: Color.brown, title: "Email US") {
                        self.sendEmail = true
                    }
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $sendEmail) {
                        MailView(data: $mailData) { result in
                            print(result)
                        }
                    }
                    SettingsItemView(imageName: Icons.app, color: Color.orange, title: "Our Apps", subtitle: "Check them out!") {
                        //                        showApps = true
                        if let url = URL(string: "itms-apps://itunes.apple.com/developer/majdi-el-felah/id1556342005") {
                            UIApplication.shared.open(url)
                        }
                    }
                }

                Section(header: Text("Rewards")) {
                    SettingsItemView(imageName: Icons.bug, color: Color.loss, title: "Report a bug", subtitle: "Get qualified for VIP!") {
                        self.reportBugEmail = true
                    }
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $reportBugEmail) {
                        MailView(data: $mailData) { result in
                            print(result)
                        }
                    }

                    SettingsItemView(imageName: Icons.feature, color: Color.yellow, title: "Suggest New Feature", subtitle: "Get qualified for VIP user or a coupon!") {
                        self.suggestFeatureEmail = true
                    }
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $suggestFeatureEmail) {
                        MailView(data: $mailData) { result in
                            print(result)
                        }
                    }
                }

                Section("Legal") {
                    SettingsItemView(imageName: Icons.handRaised, color: Color.green, title: "Privacy Policy") {
                        showPrivacyPolicy = true
                    }
                    SettingsItemView(imageName: Icons.docPlanText, color: Color.profit, title: "Terms of Services") {
                        showTerms = true
                    }
                }

                Section(header: Text("Application")) {
                    HStack {
                        IconBackgroundView(icon: "network",
                                           symbolVariant: .fill,
                                           font: .system(size: 20, weight: .bold, design: .default),
                                           color: Color.mint,
                                           frame: 24,
                                           padding: 12,
                                           backgroundColor: Color.mint.opacity(0.12),
                                           cornerRadius: 12)

                        Link(DEVELOPER, destination: URL(string: "https://\(WEBSITE_LINK)")!)
                            .foregroundColor(.textColor)
                        Spacer()
                        Image(systemName: "arrow.up.right.square")
                            .foregroundColor(Color.appTheme)
                    }
                    SettingsRowView(name: "Version", content: "\(Bundle.main.versionNumber)")
                }
            }
            .padding(.top)
            .navigationBarTitle("Settings")
            .sheet(isPresented: $showPrivacyPolicy) {
                WebLinkView(url: "https://majdielfelah.co.uk/legal/privacy-policy.html", title: "Privacy Policy")
            }
            .sheet(isPresented: $showTerms) {
                WebLinkView(url: "https://majdielfelah.co.uk/legal/terms-conditions.html", title: "Terms and Conditions")
            }
            .sheet(isPresented: $showApps) {
                WebLinkView(url: "https://apps.apple.com/us/developer/majdi-el-felah/id1556342005", title: "Other Apps")
            }
        }
    }

    func themeChange(_ tag: Int) {
        settingsViewModel.changeAppTheme(theme: tag)
    }

    func colorChange(_ color: Color) {
        settingsViewModel.changeAppColor(color: color)
    }

    func actionSheet() {
        guard let urlShare = URL(string: "https://apps.apple.com/us/app/pills-minder/id6482983484") else { return }
        let activityVC = UIActivityViewController(activityItems: ["Feel free to download this amazing Pill Reminder app", urlShare], applicationActivities: nil)
        UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension Double {
    var formattedString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
