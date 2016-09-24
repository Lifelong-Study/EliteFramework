//
//  EliteLayoutConstraint.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/5/28.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
    //!
    public class func constraintsWithVisualFormat(format: String, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return constraintsWithVisualFormat(format, options: .DirectionLeadingToTrailing, metrics: nil, views: views)
    }
}
