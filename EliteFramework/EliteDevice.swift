//
//  EliteDevice.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/14.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit


public enum MachineName {
    // Unknown Device
    case unknown_Device
    
    // iPhone
    case iPhone_1
    case iPhone_3G
    case iPhone_3GS
    case iPhone_4
    case iPhone_4S
    case iPhone_5
    case iPhone_5C
    case iPhone_5S
    case iPhone_6
    case iPhone_6_Plus
    case iPhone_6S
    case iPhone_6S_Plus
    case iPhone_SE
    
    
    // iPad
    case iPad_1
    case iPad_2
    case iPad_3
    case iPad_4
    case iPad_Pro
    case iPad_mini_1
    case iPad_mini_2
    case iPad_mini_3
    case iPad_mini_4
    case iPad_Air_1
    case iPad_Air_2
    
    // iPod Touch
    case iPod_Touch_1
    case iPod_Touch_2
    case iPod_Touch_3
    case iPod_Touch_4
    case iPod_Touch_5
    case iPod_Touch_6
    
    // Simulator
    case iPhone_Simulator
    case iPad_Simulator
}


public extension UIDevice {
//    let swf: MachineName!
    
    public class func machineName() -> MachineName {
        let screenSize = UIScreen.main.bounds.size
        
        
        if false {
        } else if screenSize.width == 320 && screenSize.height == 480 {
            return .iPhone_4
        } else if screenSize.width == 320 && screenSize.height == 568 {
            return .iPhone_5
        } else if screenSize.width == 375 && screenSize.height == 667 {
            return .iPhone_6
        } else if screenSize.width == 414 && screenSize.height == 736 {
            return .iPhone_6_Plus
        } else {
            return .iPhone_6_Plus
        }
    }
    
    fileprivate static var _model: MachineName? = nil
    
    public class var model: MachineName? {
    
        if UIDevice._model != nil {
            return UIDevice._model
        }

        switch UIDevice.getMachineIdentifier() {
            case "iPhone1,1":   UIDevice._model = .iPhone_1         // iPhone 2G GSM
            case "iPhone1,2":   UIDevice._model = .iPhone_3G        // iPhone 3G GSM
            case "iPhone2,1":   UIDevice._model = .iPhone_3GS       // iPhone 3GS GSM
            case "iPhone3,1":   UIDevice._model = .iPhone_4         // iPhone 4 GSM
            case "iPhone3,2":   UIDevice._model = .iPhone_4         // iPhone 4 GSM Rev A
            case "iPhone3,3":   UIDevice._model = .iPhone_4         // iPhone 4 CDMA
            case "iPhone4,1":   UIDevice._model = .iPhone_4S        // iPhone 4S
            case "iPhone5,1":   UIDevice._model = .iPhone_5         // iPhone 5 GSM
            case "iPhone5,2":   UIDevice._model = .iPhone_5         // iPhone 5 GSM+CDMA
            case "iPhone5,3":   UIDevice._model = .iPhone_5C        // iPhone 5C GSM
            case "iPhone5,4":   UIDevice._model = .iPhone_5C        // iPhone 5C Global
            case "iPhone6,1":   UIDevice._model = .iPhone_5S        // iPhone 5S GSM
            case "iPhone6,2":   UIDevice._model = .iPhone_5S        // iPhone 5S Global
            case "iPhone7,1":   UIDevice._model = .iPhone_6_Plus    //
            case "iPhone7,2":   UIDevice._model = .iPhone_6         //
            case "iPhone8,1":   UIDevice._model = .iPhone_6S        //
            case "iPhone8,2":   UIDevice._model = .iPhone_6S_Plus   //
            case "iPhone8,4":   UIDevice._model = .iPhone_SE        //
            
            // iPad
            case "iPad2,1":     UIDevice._model = .iPad_1           // iPad 1 Wi-Fi/GSM
            case "iPad2,1":     UIDevice._model = .iPad_2           // iPad 2 Wi-Fi
            case "iPad2,2":     UIDevice._model = .iPad_2           // iPad 2 GSM
            case "iPad2,3":     UIDevice._model = .iPad_2           // iPad 2 CDMA
            case "iPad2,4":     UIDevice._model = .iPad_2           // iPad 2 Wi-Fi Rev A
            case "iPad2,5":     UIDevice._model = .iPad_mini_1      // iPad Mini 1G Wi-Fi
            case "iPad2,6":     UIDevice._model = .iPad_mini_1      // iPad Mini 1G GSM
            case "iPad2,7":     UIDevice._model = .iPad_mini_1      // iPad Mini 1G GSM+CDMA
            case "iPad3,1":     UIDevice._model = .iPad_3           // iPad 3 Wi-Fi
            case "iPad3,2":     UIDevice._model = .iPad_3           // iPad 3 GSM+CDMA
            case "iPad3,3":     UIDevice._model = .iPad_3           // iPad 3 GSM
            case "iPad3,4":     UIDevice._model = .iPad_4           // iPad 4 Wi-Fi
            case "iPad3,5":     UIDevice._model = .iPad_4           // iPad 4 GSM
            case "iPad3,6":     UIDevice._model = .iPad_4           // iPad 4 GSM+CDMA
            case "iPad4,1":     UIDevice._model = .iPad_Air_1       // iPad Air Wi-Fi
            case "iPad4,2":     UIDevice._model = .iPad_Air_1       // iPad Air Cellular
            case "iPad4,3":     UIDevice._model = .iPad_Air_1       // iPad Air Cellular
            case "iPad4,4":     UIDevice._model = .iPad_mini_2      // iPad Mini 2
            case "iPad4,5":     UIDevice._model = .iPad_mini_2      // iPad Mini 2
            case "iPad4,6":     UIDevice._model = .iPad_mini_2      // iPad Mini 2
            case "iPad4,7":     UIDevice._model = .iPad_mini_3      // iPad Mini 3
            case "iPad4,8":     UIDevice._model = .iPad_mini_3      // iPad Mini 3
            case "iPad4,9":     UIDevice._model = .iPad_mini_3      // iPad Mini 3
            case "iPad5,1":     UIDevice._model = .iPad_mini_4      // iPad Mini 4
            case "iPad5,2":     UIDevice._model = .iPad_mini_4      // iPad Mini 4
            case "iPad5,3":     UIDevice._model = .iPad_Air_2       // iPad Air 2
            case "iPad5,4":     UIDevice._model = .iPad_Air_2       // iPad Air 2
            case "iPad6,7":     UIDevice._model = .iPad_Pro         //
            case "iPad6,8":     UIDevice._model = .iPad_Pro         //
            
            // iPod Touch
            case "iPod1,1":     UIDevice._model = .iPod_Touch_1    // iPod Touch 1
            case "iPod2,1":     UIDevice._model = .iPod_Touch_2    // iPod Touch 2
            case "iPod3,1":     UIDevice._model = .iPod_Touch_3    // iPod Touch 3
            case "iPod4,1":     UIDevice._model = .iPod_Touch_4    // iPod Touch 4
            case "iPod5,1":     UIDevice._model = .iPod_Touch_5    // iPod Touch 5
            case "iPod6,1":     UIDevice._model = .iPod_Touch_6    // iPod Touch 6
            
            // Simulator
            case "i386":        if false {
                                } else if UI_USER_INTERFACE_IDIOM() == .phone {     UIDevice._model = .iPhone_Simulator
                                } else if UI_USER_INTERFACE_IDIOM() == .pad   {     UIDevice._model = .iPad_Simulator
                                }
            
            //
            default:            UIDevice._model = .unknown_Device
        }
        
        return UIDevice._model
    }
    
    class func getMachineIdentifier() -> String {
        
        var systemInfo = utsname()
        
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }
}
