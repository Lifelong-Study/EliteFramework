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
    class func constraint(item item: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return constraint(item: item, attribute: attribute, offset: 0.0)
    }
    
    //
    class func constraint(item item: UIView, attribute: NSLayoutAttribute, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: item.superview, attribute: attribute, multiplier: 1.0, constant: offset)
    }
    
    //
    class func constraints(withVisualFormat format: String, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return constraintsWithVisualFormat(format, options: .DirectionLeadingToTrailing, metrics: nil, views: views)
    }
    
    //
    class func constraints(withVisualFormat format: String, metrics: [String : AnyObject]?, views: [String : AnyObject]) -> [NSLayoutConstraint] {
        return constraintsWithVisualFormat(format, options: .DirectionLeadingToTrailing, metrics: metrics, views: views)
    }
    
    //
    class func equal(item item: UIView, toItem: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return equal(item: item, toItem: toItem, attribute: attribute, offset: 0.0)
    }
    
    //
    class func equal(item item: UIView, toItem: UIView, attribute: NSLayoutAttribute, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: toItem, attribute: attribute, multiplier: 1.0, constant: offset)
    }
    
    //
    class func equal(item item: UIView, attribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return equal(item: item, toItem: item.superview!, attribute: attribute, offset: 0.0)
    }
    
    //
    class func equal(item item: UIView, attribute: NSLayoutAttribute, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: item.superview!, attribute: attribute, multiplier: 1.0, constant: offset)
    }
    
    //
    class func equal(item item: UIView, attribute: NSLayoutAttribute, toAttribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return equal(item: item, attribute: attribute, toAttribute: toAttribute, multiplier: 1.0)
    }
    
    //
    class func equal(item item: UIView, attribute: NSLayoutAttribute, toAttribute: NSLayoutAttribute, multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: item.superview!, attribute: toAttribute, multiplier: multiplier, constant: 0.0)
    }
    
    //
    class func equal(item item: UIView, toItem: UIView) -> [NSLayoutConstraint] {
        return [equal(item: item, toItem: toItem, attribute: .Width),
                equal(item: item, toItem: toItem, attribute: .Height),
                equal(item: item, toItem: toItem, attribute: .CenterX),
                equal(item: item, toItem: toItem, attribute: .CenterY)]
    }
    
    //
    class func constraint(item item: UIView, attribute: NSLayoutAttribute, equalAttribute: NSLayoutAttribute) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: item, attribute: equalAttribute, multiplier: 1.0, constant: 0.0)
    }
    
    //
    class func constraint(item item: UIView, attribute: NSLayoutAttribute, equalAttribute: NSLayoutAttribute, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: item, attribute: equalAttribute, multiplier: 1.0, constant: offset)
    }
    
    //
    class func constraint(item item: UIView, width: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: width)
    }
    
    //
    class func constraint(item item: UIView, height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: height)
    }
}
