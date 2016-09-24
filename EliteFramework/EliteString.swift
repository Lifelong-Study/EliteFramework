//
//  EliteString.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/15.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension String {
    var length: Int { return self.characters.count }
    
    var floatValue: Float { return (self as NSString).floatValue }
    var doubleValue: Double { return (self as NSString).doubleValue }
    var integerValue: NSInteger { return (self as NSString).integerValue }
    
    func ints() -> Double {
        if length == 0 {
            return 0
        } else {
            return (self as NSString).doubleValue
        }
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    func dateWithFormat(format: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.dateFromString(self)
    }
}

public extension NSInteger {
    var stringValue: String { return NSNumber(integer: self).stringValue }
}

public extension Float {
    var stringValue: String {
        
        if isNaN { print("s1") }
        if isNormal { print("s2") }
        if isZero { print("s3") }
        if isFinite { print("s4") }
        
        return isNaN || isNormal ? "" : NSNumber(float: self).stringValue
    }
}

public extension Double {
    var stringValue: String { return isNaN || isNormal ? "" : NSNumber(double: self).stringValue }
    
    public func stringValue(fractionDigits: NSInteger) -> String {
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.maximumFractionDigits = fractionDigits
        
        return numberFormatter.stringFromNumber(NSNumber(double: self))!
    }
}

public extension NSUserDefaults {
    public func ss(ssa: Double, key: String) {
    
    }
    
}
