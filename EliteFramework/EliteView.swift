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
    @available(*, deprecated, renamed: "renderGradient")
    func renderGradientEffects(withDirection direction: EliteDirection, colorsArray: Array<UIColor>) {
        layer.renderGradientEffects(withDirection: direction, colorsArray: colorsArray)
    }
    
    func renderGradient(from: RenderDirection, to: RenderDirection, colors: [UIColor]) {
        layer.renderGradient(from: from, to: to, colors: colors)
    }
}
