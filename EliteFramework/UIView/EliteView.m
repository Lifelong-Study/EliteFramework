//
//  EliteViewManager.m
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/2/22.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

#import "EliteView.h"
#import "EliteLayer.h"

@implementation UIView (EliteViewCategory)

- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colowWithCGColorsArray:(id)colowWithCGColorsArray
{
    [self.layer renderGradientEffectsWithDirection:direction colorWithCGColorsArray:colowWithCGColorsArray];
}

- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithUIColor:(UIColor *)colors, ...
{
    UIColor *color = nil;
    
    va_list args;
    va_start(args, colors);
    
    if (colors != nil) {
        NSMutableArray *colorsArray = [[NSMutableArray alloc] initWithObjects:(id)colors.CGColor, nil];
        
        while ((color = va_arg(args, id))) {
            [colorsArray addObject:(id)color.CGColor];
        }
        
        [self.layer renderGradientEffectsWithDirection:direction colorWithCGColorsArray:colorsArray];
    }
    
    va_end(args);
}

- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithCGColor:(id)colors, ...
{
    id color = nil;
    
    va_list args;
    va_start(args, colors);
    
    if (colors != nil) {
        NSMutableArray *colorsArray = [[NSMutableArray alloc] initWithObjects:colors, nil];
        
        while ((color = va_arg(args, id))) {
            [colorsArray addObject:color];
        }
        
        [self.layer renderGradientEffectsWithDirection:direction colorWithCGColorsArray:colorsArray];
    }
    
    va_end(args);
}

- (void)setBorderColor:(UIColor *)color
{
    [self.layer setBorderColor:color.CGColor];
}

- (void)setBorderWidth:(CGFloat)width
{
    [self.layer setBorderWidth:width];
}

- (void)addConstraintAttributeCenterX:(UIView *)superview
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superview
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
}

- (void)addConstraintAttributeCenterY:(UIView *)superview
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superview
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
}

- (void)addConstraintAttributeEqualSuperview:(UIView *)superview attribute:(NSLayoutAttribute)attribute
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                          attribute:attribute
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superview
                                                          attribute:attribute
                                                         multiplier:1.0
                                                           constant:0.0]];
}

//- (void)constraintWithItem:(UIView *)superview attribute:(NSLayoutAttribute)attribute
//{
//    constraintWithItem attribute
//    
//    [superview addConstraint:[NSLayoutConstraint constraintWithItem:self
//                                                          attribute:attribute
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:superview
//                                                          attribute:attribute
//                                                         multiplier:1.0
//                                                           constant:0.0]];
//}

@end
