//
//  EliteCategories.m
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import "EliteDevice.h"
#import <sys/utsname.h>
#include "TargetConditionals.h"

// Unknown Device
#define __UNKNOWN_DEVICE          @"Unknown Device"

// iPhone
#define __IPHONE_1          @"iPhone 1"
#define __IPHONE_3G         @"iPhone 3G"
#define __IPHONE_3GS        @"iPhone 3GS"
#define __IPHONE_4          @"iPhone 4"
#define __IPHONE_4S         @"iPhone 4S"
#define __IPHONE_5          @"iPhone 5"
#define __IPHONE_5C         @"iPhone 5C"
#define __IPHONE_5S         @"iPhone 5S"
#define __IPHONE_6          @"iPhone 6"
#define __IPHONE_6_PLUS     @"iPhone 6 Plus"
#define __IPHONE_6S         @"iPhone 6S"
#define __IPHONE_6S_PLUS    @"iPhone 6S Plus"


// iPad
#define __IPAD_1            @"iPad 1"
#define __IPAD_2            @"iPad 2"
#define __IPAD_3            @"iPad 3"
#define __IPAD_4            @"iPad 4"
#define __IPAD_PRO          @"iPad Pro"
#define __IPAD_MINI_1       @"iPad mini 1"
#define __IPAD_MINI_2       @"iPad mini 2"
#define __IPAD_MINI_3       @"iPad mini 3"
#define __IPAD_MINI_4       @"iPad mini 4"
#define __IPAD_AIR_1        @"iPad Air 1"
#define __IPAD_AIR_2        @"iPad Air 2"

// iPod Touch
#define __IPOD_TOUCH_1      @"iPod Touch 1"
#define __IPOD_TOUCH_2      @"iPod Touch 2"
#define __IPOD_TOUCH_3      @"iPod Touch 3"
#define __IPOD_TOUCH_4      @"iPod Touch 4"
#define __IPOD_TOUCH_5      @"iPod Touch 5"
#define __IPOD_TOUCH_6      @"iPod Touch 6"

// Simulator
#define __IPHONE_SIMULATOR  @"iPhone Simulator"
#define __IPAD_SIMULATOR    @"iPad Simulator"


#define isStringEqual(a, b)      [(a) isEqualToString:(b)]


@implementation UIDevice (EliteDeviceCategory)

- (NSString *)getMachineIdentifier
{
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

- (EliteMachineName)machineName
{
    static EliteMachineName machineName = AppleUnknown;
    
    if (machineName) {
        return machineName;
    }
    
    NSString *machineString = self.machineString;
    
    //
    if (NO) {
    } else if ([machineString isEqualToString:__IPHONE_1]           ){ machineName = iPhone_1;
    } else if ([machineString isEqualToString:__IPHONE_3G]          ){ machineName = iPhone_3G;
    } else if ([machineString isEqualToString:__IPHONE_3GS]         ){ machineName = iPhone_3GS;
    } else if ([machineString isEqualToString:__IPHONE_4]           ){ machineName = iPhone_4;
    } else if ([machineString isEqualToString:__IPHONE_4S]          ){ machineName = iPhone_4S;
    } else if ([machineString isEqualToString:__IPHONE_5]           ){ machineName = iPhone_5;
    } else if ([machineString isEqualToString:__IPHONE_5C]          ){ machineName = iPhone_5C;
    } else if ([machineString isEqualToString:__IPHONE_5S]          ){ machineName = iPhone_5S;
    } else if ([machineString isEqualToString:__IPHONE_6]           ){ machineName = iPhone_6;
    } else if ([machineString isEqualToString:__IPHONE_6_PLUS]      ){ machineName = iPhone_6_Plus;
    } else if ([machineString isEqualToString:__IPHONE_6S]          ){ machineName = iPhone_6S;
    } else if ([machineString isEqualToString:__IPHONE_6S_PLUS]     ){ machineName = iPhone_6S_Plus;
        
    //
    } else if ([machineString isEqualToString:__IPAD_1]             ){ machineName = iPad_1;
    } else if ([machineString isEqualToString:__IPAD_2]             ){ machineName = iPad_2;
    } else if ([machineString isEqualToString:__IPAD_3]             ){ machineName = iPad_3;
    } else if ([machineString isEqualToString:__IPAD_4]             ){ machineName = iPad_4;
    } else if ([machineString isEqualToString:__IPAD_MINI_1]        ){ machineName = iPad_mini_1;
    } else if ([machineString isEqualToString:__IPAD_MINI_2]        ){ machineName = iPad_mini_2;
    } else if ([machineString isEqualToString:__IPAD_MINI_3]        ){ machineName = iPad_mini_3;
    } else if ([machineString isEqualToString:__IPAD_MINI_4]        ){ machineName = iPad_mini_4;
    } else if ([machineString isEqualToString:__IPAD_AIR_1]         ){ machineName = iPad_Air_1;
    } else if ([machineString isEqualToString:__IPAD_AIR_2]         ){ machineName = iPad_Air_2;
    } else if ([machineString isEqualToString:__IPAD_PRO]           ){ machineName = iPad_Pro;
    
 
    // iPod Touch
    } else if ([machineString isEqualToString:__IPOD_TOUCH_1]      ){ machineName = iPod_Touch_1;
    } else if ([machineString isEqualToString:__IPOD_TOUCH_2]      ){ machineName = iPod_Touch_2;
    } else if ([machineString isEqualToString:__IPOD_TOUCH_3]      ){ machineName = iPod_Touch_3;
    } else if ([machineString isEqualToString:__IPOD_TOUCH_4]      ){ machineName = iPod_Touch_4;
    } else if ([machineString isEqualToString:__IPOD_TOUCH_5]      ){ machineName = iPod_Touch_5;
    
    // Simulator
    } else if ([machineString isEqualToString:__IPHONE_SIMULATOR]   ){ machineName = iOSSimulator;
    } else if ([machineString isEqualToString:__IPAD_SIMULATOR]     ){ machineName = iOSSimulator;
    
    //
    } else    { NSLog(@"無法辨識的 machineString: %@", machineString); }
    
    return machineName;
}

- (EliteMachineType)type
{
//    _type = type;
    
    static EliteMachineType _type = MachineTypeUnknown;

    if (_type != MachineTypeUnknown) {
        return _type;
    }
    
//    if (NO) {
//    } else if ([self.machineString containsString:@"i386"]   ){     _type = MachineTypeWatch;
//    } else if ([self.machineString containsString:@"iPhone"] ){     _type = MachineTypeiPhone;
//    } else if ([self.machineString containsString:@"iPad"]   ){     _type = MachineTypeiPad;
//    } else if ([self.machineString containsString:@"iPod"]   ){     _type = MachineTypeiPod;
//    } else if ([self.machineString containsString:@"AppleTV"]){     _type = MachineTypeTV;
//    } else if ([self.machineString containsString:@"Watch"]  ){     _type = MachineTypeWatch;
//    } else {                                                        _type = MachineTypeUnknown;
//    }
    
    if (NO) {
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {    _type = MachineTypeiPhone;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {      _type = MachineTypeiPad;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomTV) {      _type = MachineTypeTV;
//    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomCarPlay) {      _type = iPad;
//    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {      _type = iPad;
    }
    
    
    return _type;
}

- (NSString *)machineString
{
    static NSString *string = __UNKNOWN_DEVICE;;
    
    if (string) {
        return string;
    }
    
    NSString *identifier = [self getMachineIdentifier];
    
    NSLog(@"Device identifier = %@", identifier);
    // Model information retrieved from http://theiphonewiki.com/wiki/Models
    
    // iPhone
    if (NO) {
    } else if (isStringEqual(identifier, @"iPhone1,1")){ string = __IPHONE_1;         // iPhone 2G GSM
    } else if (isStringEqual(identifier, @"iPhone1,2")){ string = __IPHONE_3G;        // iPhone 3G GSM
    } else if (isStringEqual(identifier, @"iPhone2,1")){ string = __IPHONE_3GS;       // iPhone 3GS GSM
    } else if (isStringEqual(identifier, @"iPhone3,1")){ string = __IPHONE_4;         // iPhone 4 GSM
    } else if (isStringEqual(identifier, @"iPhone3,2")){ string = __IPHONE_4;         // iPhone 4 GSM Rev A
    } else if (isStringEqual(identifier, @"iPhone3,3")){ string = __IPHONE_4;         // iPhone 4 CDMA
    } else if (isStringEqual(identifier, @"iPhone4,1")){ string = __IPHONE_4S;        // iPhone 4S
    } else if (isStringEqual(identifier, @"iPhone5,1")){ string = __IPHONE_5;         // iPhone 5 GSM
    } else if (isStringEqual(identifier, @"iPhone5,2")){ string = __IPHONE_5;         // iPhone 5 GSM+CDMA
    } else if (isStringEqual(identifier, @"iPhone5,3")){ string = __IPHONE_5C;        // iPhone 5C GSM
    } else if (isStringEqual(identifier, @"iPhone5,4")){ string = __IPHONE_5C;        // iPhone 5C Global
    } else if (isStringEqual(identifier, @"iPhone6,1")){ string = __IPHONE_5S;        // iPhone 5S GSM
    } else if (isStringEqual(identifier, @"iPhone6,2")){ string = __IPHONE_5S;        // iPhone 5S Global
    } else if (isStringEqual(identifier, @"iPhone7,1")){ string = __IPHONE_6_PLUS;    //
    } else if (isStringEqual(identifier, @"iPhone7,2")){ string = __IPHONE_6;         //
    } else if (isStringEqual(identifier, @"iPhone8,1")){ string = __IPHONE_6S;        //
    } else if (isStringEqual(identifier, @"iPhone8,2")){ string = __IPHONE_6S_PLUS;   //
        
    // iPad
    } else if (isStringEqual(identifier, @"iPad2,1")  ){ string = __IPAD_1;           // iPad 1 Wi-Fi/GSM
    } else if (isStringEqual(identifier, @"iPad2,1")  ){ string = __IPAD_2;           // iPad 2 Wi-Fi
    } else if (isStringEqual(identifier, @"iPad2,2")  ){ string = __IPAD_2;           // iPad 2 GSM
    } else if (isStringEqual(identifier, @"iPad2,3")  ){ string = __IPAD_2;           // iPad 2 CDMA
    } else if (isStringEqual(identifier, @"iPad2,4")  ){ string = __IPAD_2;           // iPad 2 Wi-Fi Rev A
    } else if (isStringEqual(identifier, @"iPad2,5")  ){ string = __IPAD_MINI_1;      // iPad Mini 1G Wi-Fi
    } else if (isStringEqual(identifier, @"iPad2,6")  ){ string = __IPAD_MINI_1;      // iPad Mini 1G GSM
    } else if (isStringEqual(identifier, @"iPad2,7")  ){ string = __IPAD_MINI_1;      // iPad Mini 1G GSM+CDMA
    } else if (isStringEqual(identifier, @"iPad3,1")  ){ string = __IPAD_3;           // iPad 3 Wi-Fi
    } else if (isStringEqual(identifier, @"iPad3,2")  ){ string = __IPAD_3;           // iPad 3 GSM+CDMA
    } else if (isStringEqual(identifier, @"iPad3,3")  ){ string = __IPAD_3;           // iPad 3 GSM
    } else if (isStringEqual(identifier, @"iPad3,4")  ){ string = __IPAD_4;           // iPad 4 Wi-Fi
    } else if (isStringEqual(identifier, @"iPad3,5")  ){ string = __IPAD_4;           // iPad 4 GSM
    } else if (isStringEqual(identifier, @"iPad3,6")  ){ string = __IPAD_4;           // iPad 4 GSM+CDMA
    } else if (isStringEqual(identifier, @"iPad4,1")  ){ string = __IPAD_AIR_1;       // iPad Air Wi-Fi
    } else if (isStringEqual(identifier, @"iPad4,2")  ){ string = __IPAD_AIR_1;       // iPad Air Cellular
    } else if (isStringEqual(identifier, @"iPad4,3")  ){ string = __IPAD_AIR_1;       // iPad Air Cellular
    } else if (isStringEqual(identifier, @"iPad4,4")  ){ string = __IPAD_MINI_2;      // iPad Mini 2
    } else if (isStringEqual(identifier, @"iPad4,5")  ){ string = __IPAD_MINI_2;      // iPad Mini 2
    } else if (isStringEqual(identifier, @"iPad4,6")  ){ string = __IPAD_MINI_2;      // iPad Mini 2
    } else if (isStringEqual(identifier, @"iPad4,7")  ){ string = __IPAD_MINI_3;      // iPad Mini 3
    } else if (isStringEqual(identifier, @"iPad4,8")  ){ string = __IPAD_MINI_3;      // iPad Mini 3
    } else if (isStringEqual(identifier, @"iPad4,9")  ){ string = __IPAD_MINI_3;      // iPad Mini 3
    } else if (isStringEqual(identifier, @"iPad5,1")  ){ string = __IPAD_MINI_4;      // iPad Mini 4
    } else if (isStringEqual(identifier, @"iPad5,2")  ){ string = __IPAD_MINI_4;      // iPad Mini 4
    } else if (isStringEqual(identifier, @"iPad5,3")  ){ string = __IPAD_AIR_2;       // iPad Mini 4
    } else if (isStringEqual(identifier, @"iPad5,4")  ){ string = __IPAD_AIR_2;       // iPad Mini 4
    } else if (isStringEqual(identifier, @"iPad6,7")  ){ string = __IPAD_PRO;         //
    } else if (isStringEqual(identifier, @"iPad6,8")  ){ string = __IPAD_PRO;         //
        
    // iPod Touch
    } else if (isStringEqual(identifier, @"iPod1,1")  ){ string = __IPOD_TOUCH_1;    // iPod Touch 1
    } else if (isStringEqual(identifier, @"iPod2,1")  ){ string = __IPOD_TOUCH_2;    // iPod Touch 2
    } else if (isStringEqual(identifier, @"iPod3,1")  ){ string = __IPOD_TOUCH_3;    // iPod Touch 3
    } else if (isStringEqual(identifier, @"iPod4,1")  ){ string = __IPOD_TOUCH_4;    // iPod Touch 4
    } else if (isStringEqual(identifier, @"iPod5,1")  ){ string = __IPOD_TOUCH_5;    // iPod Touch 5
    } else if (isStringEqual(identifier, @"iPod6,1")  ){ string = __IPOD_TOUCH_6;    // iPod Touch 6
        
    // Simulator
    } else if (isStringEqual(identifier, @"i386")     ){
        if (NO) {
        } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {    string = __IPHONE_SIMULATOR;
        } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {      string = __IPAD_SIMULATOR;
        }
    }
    
    return string;
}

@end
