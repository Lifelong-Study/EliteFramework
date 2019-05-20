//
//  EliteColor.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2015/12/17.
//  Copyright © 2015年 Lifelong-Study. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    convenience init(hex: UInt64) {
        self.init(  red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                    green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
                    blue: ((CGFloat) (hex & 0xFF)) / 255.0,
                    alpha: 1.0)
    }
    
    convenience init(hex: UInt64, alpha: CGFloat) {
        self.init(  red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                    green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
                    blue: ((CGFloat) (hex & 0xFF)) / 255.0,
                    alpha: alpha)
    }
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int) {
        self.init(red, green, blue, alpha: 1.0)
    }
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    static let random = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
}
