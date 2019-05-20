//
//  EliteString.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/15.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension String {
    
    var floatValue:     Float     { return (self as NSString).floatValue }
    var doubleValue:    Double    { return (self as NSString).doubleValue }
    var integerValue:   NSInteger { return (self as NSString).integerValue }
    var intValue:       Int       { return Int((self as NSString).integerValue) }
    
    var isNumber: Bool {
        get{
            return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    }
    
    func height(withFont font: UIFont) -> CGFloat {
        return height(withFont: font, constrainedWidth: CGFloat.greatestFiniteMagnitude)
    }
    
    func height(withFont font: UIFont, constrainedWidth width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height + 1.0
    }
    
    func width(withFont font: UIFont) -> CGFloat {
        return width(withFont: font, constrainedHeight: CGFloat.greatestFiniteMagnitude)
    }
    
    func width(withFont font: UIFont, constrainedHeight height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.width + 1.0
    }
    
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}

public extension NSInteger {
    var stringValue: String { return NSNumber(value: self as Int).stringValue }
}

public extension Float {
    var stringValue: String {
        return isNaN || isNormal ? "" : NSNumber(value: self as Float).stringValue
    }
}

public extension Double {
    var stringValue: String { return isNaN || isNormal ? "" : NSNumber(value: self as Double).stringValue }
    
    func stringValue(_ fractionDigits: NSInteger) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = fractionDigits
        
        return numberFormatter.string(from: NSNumber(value: self as Double))!
    }
}
