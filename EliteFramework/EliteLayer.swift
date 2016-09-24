//
//  EliteLayer.swift
//  Transformer
//
//  Created by Lifelong-Study on 2016/1/19.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public enum EliteDirection {
    case fromTopToBottom  // Top    -> Bottom
    case fromBottomToTop  // Bottom -> Top
    case fromLeftToRight  // Left   -> Right
    case fromRightToLeft  // Right  -> Left
}

public extension CALayer {
    public func renderGradientEffectsWithDirection(_ direction: EliteDirection, cgcolorsArray: Array<CGColor>) {
        
        // 初始化漸層效果
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = getStartPointWithDirection(direction)
        gradientLayer.endPoint   = getEndPointWithDirection(direction)
        gradientLayer.frame      = bounds
        gradientLayer.colors     = cgcolorsArray
        gradientLayer.name       = "GradientEffectsLayer"
        
        // 套用漸層效果
        if sublayers != nil && sublayers![0].name == "GradientEffectsLayer" {
            print("replaceSublayer")
            replaceSublayer(sublayers![0], with: gradientLayer)
        } else {
            insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func getStartPointWithDirection(_ direction: EliteDirection) -> CGPoint {
        switch (direction) {
            case .fromTopToBottom:      return CGPoint(x: 0.5, y: 0)
            case .fromBottomToTop:      return CGPoint(x: 0.5, y: 1)
            case .fromLeftToRight:      return CGPoint(x: 0, y: 0.5)
            case .fromRightToLeft:      return CGPoint(x: 1, y: 0.5)
        }
    }
    
    func getEndPointWithDirection(_ direction: EliteDirection) -> CGPoint {
        switch (direction) {
            case .fromTopToBottom:      return CGPoint(x: 0.5, y: 1)
            case .fromBottomToTop:      return CGPoint(x: 0.5, y: 0)
            case .fromLeftToRight:      return CGPoint(x: 1, y: 0.5)
            case .fromRightToLeft:      return CGPoint(x: 0, y: 0.5)
        }
    }
}
