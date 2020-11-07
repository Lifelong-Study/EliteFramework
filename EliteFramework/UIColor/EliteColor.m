//
//  EliteCategories.m
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import "EliteColor.h"

@implementation UIColor (EliteColorCategory)

+ (UIColor *)colorWithHex:(unsigned int)hex
{
    return [self colorWithHex:hex alpha:1];
}

+ (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

+ (NSInteger)getRedColorWithHex:(unsigned int)hex
{
    return (hex & 0xFF0000) >> 16;
}

+ (NSInteger)getGreenColorWithHex:(unsigned int)hex
{
    return (hex & 0x00FF00) >> 8;
}

+ (NSInteger)getBlueColorWithHex:(unsigned int)hex
{
    return hex & 0x00FF;
}

@end
