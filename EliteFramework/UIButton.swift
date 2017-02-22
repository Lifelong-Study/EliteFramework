//
//  UIButton.swift
//  EliteFramework
//
//  Created by Lifelong-Study on 2017/1/17.
//  Copyright © 2017年 Lifelong-Study. All rights reserved.
//

import UIKit
import Foundation

public extension UIButton {
    private struct associatedKeys {
        static var titleRect: CGRect = .zero
        static var imageRect: CGRect = .zero
    }
    
    func titleRectForContentRect(rect: CGRect) -> CGRect {
        
        if associatedKeys.titleRect.isEmpty != true && associatedKeys.titleRect.equalTo(.zero) != true {
            return associatedKeys.titleRect
        }
        
        return rect
    }
    
    func imageRectForContentRect(rect: CGRect) -> CGRect {
        
        if associatedKeys.imageRect.isEmpty != true && associatedKeys.imageRect.equalTo(.zero) != true {
            return associatedKeys.imageRect
        }
        
        return rect
    }
}
