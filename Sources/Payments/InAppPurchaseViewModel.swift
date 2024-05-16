//
//  InAppPurchaseViewModel.swift
//  PillsTracker
//
//  Created by Majdi Felah on 14/05/2024.
//

//import Glassfy
import SwiftUI

class InAppPurchaseViewModel: ObservableObject {

  // MARK: Error Properties
  @Published var errorMessage: String = ""
  @Published var showError: Bool = false
  @Published var isLoading: Bool = false

  // MARK: User Status
  @AppStorage("premiumUser") var premiumUser: Bool = true

  init() {
    checkPurchase()
    fetchProducts()
    checkForVIPUsers()
  }

  func fetchProducts() {
//    Glassfy.offerings { offers, _ in
//
//      // MARK: Offerings ID
//      if let offering = offers?["premium"] {
//        self.products = offering.skus
//        self.product = offering.skus.first
//      }
//    }
  }

  func purchase(completion: @escaping (Bool)->Void) { // should return success or error
//    isLoading = true
//    guard let product = product else { return }
//    Glassfy.purchase(sku: product) { transaction, e in
//      self.isLoading = false
//      if let error = e {
//        self.errorMessage = error.localizedDescription
//        self.showError.toggle()
//        completion(false)
//        return
//      }
//      // update app status accondingly
//      if let permisson = transaction?.permissions["premium"], permisson.isValid {
//        print("Purchased Successfully!")
//        self.premiumUser = true
//        completion(true)
//      }
//    }
  }

  func restorePurchase(completion: @escaping (Bool)->Void) {
//    isLoading = true
//    Glassfy.restorePurchases { permissions, err in
//      self.isLoading = false
//      if let error = err {
//        self.errorMessage = error.localizedDescription
//        self.showError.toggle()
//        return
//      }
//
//      if let permissions, let permission = permissions["premium"], permission.isValid {
//        print("Restored Successfully!")
//        self.premiumUser = true
//        self.errorMessage = "Purchase Restored Sucessfully!"
//        self.showError.toggle()
//      } else {
//        self.errorMessage = "No Purchase to Restore!"
//        self.showError.toggle()
//      }
//    }
  }

  // MARK: Check Whether the User is Cancelled or Expired the Subscription
  func checkPurchase() {
//    Glassfy.permissions { permissions, _ in
//      if let permissions,
//         let permission = permissions["premium"],
//         permission.isValid {
//
//        // MARK: Do Your Action
//        self.premiumUser = true
//      } else {
//        // I'm Simply Removing Special Access
//        self.premiumUser = false
//        self.checkForVIPUsers()
//      }
//    }
  }
  func checkForVIPUsers() {
//    if let regionCode = Locale.current.regionCode {
//      if StartupAPI.sharedInstance.listOfVipRegions.contains(regionCode) {
//        self.premiumUser = true
//      }
//    }
//    if let deviceUUID = UIDevice.current.identifierForVendor?.uuidString {
//      if StartupAPI.sharedInstance.listOfVipDevices.contains(deviceUUID) {
//        self.premiumUser = true
//      }
//    }
  }
}
