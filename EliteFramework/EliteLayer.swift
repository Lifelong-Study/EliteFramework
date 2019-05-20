//
//  EliteLayer.swift
//  Transformer
//
//  Created by Lifelong-Study on 2016/1/19.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

//public enum EliteDirection {
//    case fromTopToBottom  // Top    -> Bottom
//    case fromBottomToTop  // Bottom -> Top
//    case fromLeftToRight  // Left   -> Right
//    case fromRightToLeft  // Right  -> Left
//}

public enum RenderDirection {
    case top
    case topLeft
    case topRight
    case bottom
    case bottomLeft
    case bottomRight
    case left
    case right
}

public extension CALayer {
    func renderGradient(from: RenderDirection, to: RenderDirection, colors: [UIColor]) {
        
        var cgColorsArray: [CGColor] = Array()
        
        for color in colors {
            cgColorsArray.append(color.cgColor)
        }
        
        // 初始化漸層效果
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint    = getPoint(direction: from)
        gradientLayer.endPoint      = getPoint(direction: to)
        gradientLayer.frame         = bounds
        gradientLayer.colors        = cgColorsArray
        gradientLayer.name          = "GradientEffectsLayer"
        
        // 套用漸層效果
        if sublayers != nil && sublayers![0].name == "GradientEffectsLayer" {
            replaceSublayer(sublayers![0], with: gradientLayer)
        } else {
            insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func removeRenderGradient() {
        guard let sublayers = sublayers else {
            return
        }
        
        for sublayer in sublayers {
            if sublayer.name == "GradientEffectsLayer" {
                sublayer.removeFromSuperlayer()
            }
        }
    }
    
    func getPoint(direction: RenderDirection) -> CGPoint {
        switch (direction) {
        case .top:          return CGPoint(x: 0.5, y: 0.0)
        case .topLeft:      return CGPoint(x: 0.0, y: 0.0)
        case .topRight:     return CGPoint(x: 1.0, y: 0.0)
        case .bottom:       return CGPoint(x: 0.5, y: 1.0)
        case .bottomLeft:   return CGPoint(x: 0.0, y: 1.0)
        case .bottomRight:  return CGPoint(x: 1.0, y: 1.0)
        case .left:         return CGPoint(x: 0.0, y: 0.5)
        case .right:        return CGPoint(x: 1.0, y: 0.5)
        }
    }
    
    func rotation(duration: Float) {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue        = NSNumber(value: Float.pi * 2.0)  // 旋轉角度
        animation.duration       = CFTimeInterval(duration)         // 旋轉週期
        animation.isCumulative   = true                             // 旋轉累加角度
        animation.repeatCount    = .infinity                        // 旋轉次數
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        add(animation, forKey: "rotationAnimation")
    }
}
