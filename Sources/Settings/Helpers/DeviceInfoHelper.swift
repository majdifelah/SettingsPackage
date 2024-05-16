//
//  DeviceInfoHelper.swift
//  SettingsView
//
//  Created by Majdi Felah on 16/05/2024.
//

import UIKit

struct DeviceInfoHelper {
    static var modelCode: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        return withUnsafePointer(to: &systemInfo.machine) {
           $0.withMemoryRebound(to: CChar.self, capacity: 1) {
               ptr in String.init(validatingUTF8: ptr) ?? ""
           }
        }
    }

    static var specificModelType: DeviceModel {

        let modelType = DeviceModel(modelCode: modelCode)
        if modelType == .simulator {
            return .simulator
            // Future
            //            if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            //                return DeviceModel(modelCode: simModelCode)
            //            }
        } else {
            return modelType
        }
    }
}
public enum DeviceModel: String, CaseIterable {
    //Simulator
    case simulator          = "simulator/sandbox"

    //iPod
    case iPod1              = "iPod 1"
    case iPod2              = "iPod 2"
    case iPod3              = "iPod 3"
    case iPod4              = "iPod 4"
    case iPod5              = "iPod 5"
    case iPod6              = "iPod 6"
    case iPod7              = "iPod 7"

    //iPad
    case iPad2              = "iPad 2"
    case iPad3              = "iPad 3"
    case iPad4              = "iPad 4"
    case iPad5              = "iPad 5"
    case iPad6              = "iPad 6"
    case iPad7              = "iPad 7"
    case iPad8              = "iPad 8"
    case iPad9              = "iPad 9"

    //iPad Air
    case iPadAir            = "iPad Air"
    case iPadAir2           = "iPad Air 2"
    case iPadAir3           = "iPad Air 3"
    case iPadAir4           = "iPad Air 4"
    case iPadAir5           = "iPad Air 5"

    //iPad Mini
    case iPadMini           = "iPad Mini"
    case iPadMini2          = "iPad Mini 2"
    case iPadMini3          = "iPad Mini 3"
    case iPadMini4          = "iPad Mini 4"
    case iPadMini5          = "iPad Mini 5"
    case iPadMini6          = "iPad Mini 6"

    //iPad Pro
    case iPadPro9_7         = "iPad Pro 9.7"
    case iPadPro10_5        = "iPad Pro 10.5"
    case iPadPro11          = "iPad Pro 11"
    case iPadPro2_11        = "iPad Pro 11 2"
    case iPadPro12_9        = "iPad Pro 12.9"
    case iPadPro2_12_9      = "iPad Pro 12.9 2"
    case iPadPro3_12_9      = "iPad Pro 12.9 3"
    case iPadPro4_12_9      = "iPad Pro 12.9 4"
    case iPadPro11_5        = "iPad Pro 11 5"
    case iPadPro12_5        = "iPad Pro 12.9 5"
    case iPad10thGen        = "iPad 10th Gen"
    case iPadPro11_4        = "iPad Pro 4th Gen"
    case iPadPro11_6        = "iPad Pro 6th Gen"

    //iPhone
    case iPhone4            = "iPhone 4"
    case iPhone4S           = "iPhone 4S"
    case iPhone5            = "iPhone 5"
    case iPhone5S           = "iPhone 5S"
    case iPhone5C           = "iPhone 5C"
    case iPhone6            = "iPhone 6"
    case iPhone6Plus        = "iPhone 6 Plus"
    case iPhone6S           = "iPhone 6S"
    case iPhone6SPlus       = "iPhone 6S Plus"
    case iPhoneSE           = "iPhone SE"
    case iPhone7            = "iPhone 7"
    case iPhone7Plus        = "iPhone 7 Plus"
    case iPhone8            = "iPhone 8"
    case iPhone8Plus        = "iPhone 8 Plus"
    case iPhoneX            = "iPhone X"
    case iPhoneXS           = "iPhone XS"
    case iPhoneXSMax        = "iPhone XS Max"
    case iPhoneXR           = "iPhone XR"
    case iPhone11           = "iPhone 11"
    case iPhone11Pro        = "iPhone 11 Pro"
    case iPhone11ProMax     = "iPhone 11 Pro Max"
    case iPhoneSE2          = "iPhone SE 2n"
    case iPhone12Mini       = "iPhone 12 Mini"
    case iPhone12           = "iPhone 12"
    case iPhone12Pro        = "iPhone 12 Pro"
    case iPhone12ProMax     = "iPhone 12 Pro Max"
    case iPhone13Mini       = "iPhone 13 Mini"
    case iPhone13           = "iPhone 13"
    case iPhone13Pro        = "iPhone 13 Pro"
    case iPhone13ProMax     = "iPhone 13 Pro Max"
    case iPhoneSE3          = "iPhone SE 3n"
    case iPhone14           = "iPhone 14"
    case iPhone14Plus       = "iPhone 14 Plus"
    case iPhone14Pro        = "iPhone 14 Pro"
    case iPhone14ProMax     = "iPhone 14 Pro Max"

    // Apple Watch
    case AppleWatch1         = "Apple Watch 1"
    case AppleWatchS1        = "Apple Watch Series 1"
    case AppleWatchS2        = "Apple Watch Series 2"
    case AppleWatchS3        = "Apple Watch Series 3"
    case AppleWatchS4        = "Apple Watch Series 4"
    case AppleWatchS5        = "Apple Watch Series 5"
    case AppleWatchSE        = "Apple Watch SE"
    case AppleWatchS6        = "Apple Watch Series 6"

    //Apple TV
    case AppleTV1           = "Apple TV 1"
    case AppleTV2           = "Apple TV 2"
    case AppleTV3           = "Apple TV 3"
    case AppleTV4           = "Apple TV 4"
    case AppleTV_4K         = "Apple TV 4K"

    case unrecognized       = "?unrecognized?"


    init(modelCode: String) {
        switch modelCode {
        /* Simulator */
        case "i386", "x86_64" :
            self = .simulator


        /* iPod */
        case "iPod1,1":
            self = .iPod1
        case "iPod2,1":
            self = .iPod2
        case "iPod3,1":
            self = .iPod3
        case "iPod4,1":
            self = .iPod4
        case "iPod5,1":
            self = .iPod5
        case "iPod7,1":
            self = .iPod6
        case "iPod9,1":
            self = .iPod7


        /* iPad */
        // iPad
        case "iPad2,1":
            self = .iPad2
        case "iPad2,2":
            self = .iPad2
        case "iPad2,3":
            self = .iPad2
        case "iPad2,4":
            self = .iPad2
        case "iPad3,1":
            self = .iPad3
        case "iPad3,2":
            self = .iPad3
        case "iPad3,3":
            self = .iPad3
        case "iPad3,4":
            self = .iPad4
        case "iPad3,5":
            self = .iPad4
        case "iPad3,6":
            self = .iPad4
        case "iPad6,11":
            self = .iPad5
        case "iPad6,12":
            self = .iPad5
        case "iPad7,5":
            self = .iPad6
        case "iPad7,6":
            self = .iPad6
        case "iPad7,11":
            self = .iPad7
        case "iPad7,12":
            self = .iPad7
        case "iPad11,6":
            self = .iPad8
        case "iPad11,7":
            self = .iPad8
        case "iPad12,1":
            self = .iPad9
        case "iPad12,2":
            self = .iPad9

            // iPad Mini
        case "iPad2,5":
            self = .iPadMini
        case "iPad2,6":
            self = .iPadMini
        case "iPad2,7":
            self = .iPadMini
        case "iPad4,4":
            self = .iPadMini2
        case "iPad4,5":
            self = .iPadMini2
        case "iPad4,6":
            self = .iPadMini2
        case "iPad4,7":
            self = .iPadMini3
        case "iPad4,8":
            self = .iPadMini3
        case "iPad4,9":
            self = .iPadMini3
        case "iPad5,1":
            self = .iPadMini4
        case "iPad5,2":
            self = .iPadMini4
        case "iPad11,1":
            self = .iPadMini5
        case "iPad11,2":
            self = .iPadMini5
        case "iPad14,1":
            self = .iPadMini6
        case "iPad14,2":
            self = .iPadMini6

        // iPad Pro
        case "iPad6,3":
            self = .iPadPro9_7
        case "iPad6,4":
            self = .iPadPro9_7
        case "iPad7,3":
            self = .iPadPro10_5
        case "iPad7,4":
            self = .iPadPro10_5
        case "iPad6,7":
            self = .iPadPro12_9
        case "iPad6,8":
            self = .iPadPro12_9
        case "iPad7,1":
            self = .iPadPro2_12_9
        case "iPad7,2":
            self = .iPadPro2_12_9
        case "iPad8,1":
            self = .iPadPro11
        case "iPad8,2":
            self = .iPadPro11
        case "iPad8,3":
            self = .iPadPro11
        case "iPad8,4":
            self = .iPadPro11
        case "iPad8,9":
            self = .iPadPro2_11
        case "iPad8,10":
            self = .iPadPro2_11
        case "iPad8,5":
            self = .iPadPro3_12_9
        case "iPad8,6":
            self = .iPadPro3_12_9
        case "iPad8,7":
            self = .iPadPro3_12_9
        case "iPad8,8":
            self = .iPadPro3_12_9
        case "iPad8,11":
            self = .iPadPro4_12_9
        case "iPad8,12":
            self = .iPadPro4_12_9
        case "iPad13,4":
            self = .iPadPro11_5
        case "iPad13,5":
            self = .iPadPro11_5
        case "iPad13,6":
            self = .iPadPro11_5
        case "iPad13,7":
            self = .iPadPro11_5
        case "iPad13,8":
            self = .iPadPro11_5
        case "iPad13,9":
            self = .iPadPro11_5
        case "iPad13,10":
            self = .iPadPro12_5
        case "iPad13,11":
            self = .iPadPro12_5
        case "iPad13,18", "iPad13,19":
            self = .iPad10thGen
        case "iPad14,3-A", "iPad14,3-B", "iPad14,4-A", "iPad14,4-B":
            self = .iPadPro11_4
        case "iPad14,5-A", "iPad14,5-B", "iPad14,6-A", "iPad14,6-B":
            self = .iPadPro11_6

            // iPad Air
        case "iPad4,1":
            self = .iPadAir
        case "iPad4,2":
            self = .iPadAir
        case "iPad4,3":
            self = .iPadAir
        case "iPad5,3":
            self = .iPadAir2
        case "iPad5,4":
            self = .iPadAir2
        case "iPad11,3":
            self = .iPadAir3
        case "iPad11,4":
            self = .iPadAir3
        case "iPad13,1":
            self = .iPadAir4
        case "iPad13,2":
            self = .iPadAir4
        case "iPad13,16":
            self = .iPadAir5
        case "iPad13,17":
            self = .iPadAir5

        /* iPhone */
        case "iPhone3,1":
            self = .iPhone4
        case "iPhone3,2":
            self = .iPhone4
        case "iPhone3,3":
            self = .iPhone4
        case "iPhone4,1":
            self = .iPhone4S
        case "iPhone5,1" :
            self = .iPhone5
        case "iPhone5,2":
            self = .iPhone5
        case "iPhone5,3":
            self = .iPhone5C
        case "iPhone5,4":
            self = .iPhone5C
        case "iPhone6,1":
            self = .iPhone5S
        case "iPhone6,2":
            self = .iPhone5S
        case "iPhone7,1":
            self = .iPhone6Plus
        case "iPhone7,2":
            self = .iPhone6
        case "iPhone8,1":
            self = .iPhone6S
        case "iPhone8,2":
            self = .iPhone6SPlus
        case "iPhone8,4":
            self = .iPhoneSE
        case "iPhone9,1":
            self = .iPhone7
        case "iPhone9,3":
            self = .iPhone7
        case "iPhone9,2":
            self = .iPhone7Plus
        case "iPhone9,4":
            self = .iPhone7Plus
        case "iPhone10,1":
            self = .iPhone8
        case "iPhone10,4":
            self = .iPhone8
        case "iPhone10,2":
            self = .iPhone8Plus
        case "iPhone10,5":
            self = .iPhone8Plus
        case "iPhone10,3":
            self = .iPhoneX
        case "iPhone10,6":
            self = .iPhoneX
        case "iPhone11,2":
            self = .iPhoneXS
        case "iPhone11,4":
            self = .iPhoneXSMax
        case "iPhone11,6":
            self = .iPhoneXSMax
        case "iPhone11,8":
            self = .iPhoneXR
        case "iPhone12,1":
            self = .iPhone11
        case "iPhone12,3":
            self = .iPhone11Pro
        case "iPhone12,5":
            self = .iPhone11ProMax
        case "iPhone12,8":
            self = .iPhoneSE2
        case "iPhone13,1":
            self = .iPhone12Mini
        case "iPhone13,2":
            self = .iPhone12
        case "iPhone13,3":
            self = .iPhone12Pro
        case "iPhone13,4":
            self = .iPhone12ProMax
        case "iPhone14,2":
            self = .iPhone13Mini
        case "iPhone14,3":
            self = .iPhone13
        case "iPhone14,4":
            self = .iPhone13Pro
        case "iPhone14,5":
            self = .iPhone13ProMax
        case "iPhone14,6":
            self = .iPhoneSE3
        case "iPhone14,7":
            self = .iPhone14
        case "iPhone14,8":
            self = .iPhone14Plus
        case "iPhone15,2":
            self = .iPhone14Pro
        case "iPhone15,3":
            self = .iPhone14ProMax

        /* Apple Watch */
        case "Watch1,1":
            self = .AppleWatch1
        case "Watch1,2":
            self = .AppleWatch1
        case "Watch2,6":
            self = .AppleWatchS1
        case "Watch2,7":
            self = .AppleWatchS1
        case "Watch2,3":
            self = .AppleWatchS2
        case "Watch2,4":
            self = .AppleWatchS2
        case "Watch3,1":
            self = .AppleWatchS3
        case "Watch3,2":
            self = .AppleWatchS3
        case "Watch3,3":
            self = .AppleWatchS3
        case "Watch3,4":
            self = .AppleWatchS3
        case "Watch4,1":
            self = .AppleWatchS4
        case "Watch4,2":
            self = .AppleWatchS4
        case "Watch4,3":
            self = .AppleWatchS4
        case "Watch4,4":
            self = .AppleWatchS4
        case "Watch5,1":
            self = .AppleWatchS5
        case "Watch5,2":
            self = .AppleWatchS5
        case "Watch5,3":
            self = .AppleWatchS5
        case "Watch5,4":
            self = .AppleWatchS5
        case "Watch5,9":
            self = .AppleWatchSE
        case "Watch5,10":
            self = .AppleWatchSE
        case "Watch5,11":
            self = .AppleWatchSE
        case "Watch5,12":
            self = .AppleWatchSE
        case "Watch6,1":
            self = .AppleWatchS6
        case "Watch6,2":
            self = .AppleWatchS6
        case "Watch6,3":
            self = .AppleWatchS6
        case "Watch6,4":
            self = .AppleWatchS6


        /* Apple TV */
        case "AppleTV1,1":
            self = .AppleTV1
        case "AppleTV2,1":
            self = .AppleTV2
        case "AppleTV3,1":
            self = .AppleTV3
        case "AppleTV3,2":
            self = .AppleTV3
        case "AppleTV5,3":
            self = .AppleTV4
        case "AppleTV6,2":
            self = .AppleTV_4K


        default:
            self = .unrecognized
        }
    }
}

extension UIDevice {

    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
}

extension UIDevice {
    var hasNotch: Bool {
            if #available(iOS 11.0, *) {
                let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                return keyWindow?.safeAreaInsets.bottom ?? 0 > 0
            }
            return false
        }
}
