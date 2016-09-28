//
//  EliteLayoutConstraint.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/5/28.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {
    
    //
    class func constraintWithView(item: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return constraint(item: item, attribute: attribute, offset: 0.0)
    }
    
    //
    class func constraint(item: UIView, attribute: NSLayoutAttribute, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: item.superview, attribute: attribute, multiplier: 1.0, constant: offset)
    }
    
    //
    class func constraints(withVisualFormat format: String, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return constraints(withVisualFormat: format, options: .directionLeadingToTrailing, metrics: nil, views: views)
    }
    
    //
    class func constraints(withVisualFormat format: String, metrics: [String : Any]?, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return constraints(withVisualFormat: format, options: .directionLeadingToTrailing, metrics: metrics, views: views)
    }
    
    
}
