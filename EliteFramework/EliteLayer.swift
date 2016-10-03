//
//  EliteLayer.swift
//  Transformer
//
//  Created by Lifelong-Study on 2016/1/19.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

import UIKit

public enum EliteDirection {
    case FromTopToBottom  // Top    -> Bottom
    case FromBottomToTop  // Bottom -> Top
    case FromLeftToRight  // Left   -> Right
    case FromRightToLeft  // Right  -> Left
}

public extension CALayer {
    public func renderGradientEffectsWithDirection(direction: EliteDirection, colorsArray: [UIColor]) {
        
        var cgcolorArray: [CGColor] = Array()
        
        for color in colorsArray {
            cgcolorArray.append(color.CGColor)
        }
        
        // 初始化漸層效果
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = getStartPointWithDirection(direction)
        gradientLayer.endPoint   = getEndPointWithDirection(direction)
        gradientLayer.frame      = bounds
        gradientLayer.colors     = cgcolorArray
        gradientLayer.name       = "GradientEffectsLayer"
        
        // 套用漸層效果
        if sublayers != nil && sublayers![0].name == "GradientEffectsLayer" {
            print("replaceSublayer")
            replaceSublayer(sublayers![0], with: gradientLayer)
        } else {
            insertSublayer(gradientLayer, atIndex: 0)
        }
    }
    
    func getStartPointWithDirection(direction: EliteDirection) -> CGPoint {
        switch (direction) {
            case .FromTopToBottom:      return CGPointMake(0.5, 0)
            case .FromBottomToTop:      return CGPointMake(0.5, 1)
            case .FromLeftToRight:      return CGPointMake(0, 0.5)
            case .FromRightToLeft:      return CGPointMake(1, 0.5)
        }
    }
    
    func getEndPointWithDirection(direction: EliteDirection) -> CGPoint {
        switch (direction) {
            case .FromTopToBottom:      return CGPointMake(0.5, 1)
            case .FromBottomToTop:      return CGPointMake(0.5, 0)
            case .FromLeftToRight:      return CGPointMake(1, 0.5)
            case .FromRightToLeft:      return CGPointMake(0, 0.5)
        }
    }
}
