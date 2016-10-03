//
//  EliteView.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/9/22.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public extension UIView {
    
    //
//    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIView? {
//        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
//    }
    
    //
    func renderGradientEffects(withDirection direction: EliteDirection, colorsArray: Array<UIColor>) {
        layer.renderGradientEffects(withDirection: direction, colorsArray: colorsArray)
    }
    
}
