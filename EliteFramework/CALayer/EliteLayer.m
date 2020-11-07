//
//  EliteLayer.m
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/1/9.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

#import "EliteLayer.h"

@implementation CALayer (EliteLayerCategory)

// 渲染漸層效果
- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithCGColorsArray:(NSArray *)colorsArray
{
    // 初始化漸層效果
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.startPoint = [self getStartPointWithDirection:direction];
    gradientLayer.endPoint   = [self getEndPointWithDirection:direction];
    gradientLayer.frame      = [self bounds];
    gradientLayer.colors     = colorsArray;
    gradientLayer.name       = @"GradientEffectsLayer";
    
    // 套用漸層效果
    if ([[[[self sublayers] objectAtIndex:0] name] isEqualToString:@"GradientEffectsLayer"]){
        [self replaceSublayer:[[self sublayers] objectAtIndex:0] with:gradientLayer];
    } else {
        [self insertSublayer:gradientLayer atIndex:0];
    }
}

- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithUIColor:(UIColor *)colors, ...
{
    UIColor *color = colors;
    
    NSMutableArray *colorsArray = [[NSMutableArray alloc] init];
    
    va_list args;
    va_start(args, colors);
    
    [colorsArray addObject:(id)color.CGColor];
    while ((color = va_arg(args, UIColor *)) != nil) {
        [colorsArray addObject:(id)color.CGColor];
    }
    
    va_end(args);
    
    if (colorsArray.count > 0) {
        [self renderGradientEffectsWithDirection:direction colorWithCGColorsArray:colorsArray];
    }
}

- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithCGColor:(id)colors, ...
{
    id color = nil;
    
    NSMutableArray *colorsArray = [[NSMutableArray alloc] init];
    
    va_list args;
    va_start(args, colors);
    
    [colorsArray addObject:colors];
    while ((color = va_arg(args, id)) != nil) {
        [colorsArray addObject:color];
    }
    
    va_end(args);
    
    if (colorsArray.count > 0) {
        [self renderGradientEffectsWithDirection:direction colorWithCGColorsArray:colorsArray];
    }
}

//- (void)renderGradientEffectsWithDirection:(EliteDirection)direction colorWithCGColors:(NSArray *)colors
//{
//    id color = nil;
//    
//    NSMutableArray *colorsArray = [[NSMutableArray alloc] init];
//    
////    va_list args;
////    va_start(args, colors);
//    
//    [colorsArray addObject:colors];
//    while ((color = va_arg(args, id)) != nil) {
//        [colorsArray addObject:color];
//    }
//    
//    va_end(args);
//    
//    if (colorsArray.count > 0) {
//        [self renderGradientEffectsWithDirection:direction colorWithCGColorsArray:colorsArray];
//    }
//}

-  (CGPoint)getStartPointWithDirection:(EliteDirection)direction
{
    switch (direction) {
        case EliteDirectionFromTopToBottom:     return CGPointMake(0.5, 0);
        case EliteDirectionFromBottomToTop:     return CGPointMake(0.5, 1);
        case EliteDirectionFromLeftToRight:     return CGPointMake(0, 0.5);
        case EliteDirectionFromRigthToLeft:     return CGPointMake(1, 0.5);
        default:                                return CGPointMake(0.5, 0);
    }
}

-  (CGPoint)getEndPointWithDirection:(EliteDirection)direction
{
    switch (direction) {
        case EliteDirectionFromTopToBottom:     return CGPointMake(0.5, 1);
        case EliteDirectionFromBottomToTop:     return CGPointMake(0.5, 0);
        case EliteDirectionFromLeftToRight:     return CGPointMake(1, 0.5);
        case EliteDirectionFromRigthToLeft:     return CGPointMake(0, 0.5);
        default:                                return CGPointMake(0.5, 1);
    }
}

@end
