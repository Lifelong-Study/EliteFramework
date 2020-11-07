//
//  EliteCategories.h
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EliteConfig.h"

@interface UIImage (EliteImageCategory)

+ (UIImage *)imageWithView:(UIView *)view;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithLayer:(CALayer *)layer;

- (UIImage *)scaledToSize:(CGSize)size;

// 影像壓縮
// maxWidth : 影像的最大寬度
// maxHeight: 影像的最大高度
// quality  : 影像品質的壓縮比( 0.0 ~ 1.0 )
- (UIImage *)imageCompressWithMaxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight quality:(CGFloat)quality;


- (UIImage *)clearColor:(UIColor *)color;
- (UIImage *)changeColor:(UIColor *)fromColor toColor:(UIColor *)toColor;
//- (UIImage *)rotate:(UIImage *)src orientation:(UIImageOrientation)orientation;



// 調整影像尺寸
//- (UIImage *)scaledToSize:(CGSize)size;

// 影像剪裁
- (UIImage *)trimImageWithMask:(CGRect)maskFrame;


@end
