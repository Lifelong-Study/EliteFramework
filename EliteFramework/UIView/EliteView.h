//
//  EliteViewManager.h
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/22.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EliteConfig.h"

@interface UIView (EliteViewCategory)

// 設置漸層效果
- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colowWithCGColorsArray:(id)colowWithCGColorsArray;
- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithUIColor:(UIColor *)colors, ...;
- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithCGColor:(id)colors, ...;

- (void)setBorderColor:(UIColor *)color;
- (void)setBorderWidth:(CGFloat)width;

- (void)addConstraintAttributeCenterX:(UIView *)superview;
- (void)addConstraintAttributeCenterY:(UIView *)superview;

@end
