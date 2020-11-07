//
//  EliteCategories.h
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import <UIKit/UIKit.h>

// 裝置類型
#define IS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_APPLE_TV     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomTV)

typedef NS_ENUM(NSUInteger, EliteDirection)
{
    EliteDirectionLeft,
    EliteDirectionRight,
    EliteDirectionTop,
    EliteDirectionBottom,
//    EliteDirectionLeftToRight,
//    EliteDirectionTopToBottom,
    
    EliteDirectionFromTopToBottom,  // Top    -> Bottom
    EliteDirectionFromBottomToTop,  // Bottom -> Top
    EliteDirectionFromLeftToRight,  // Left   -> Right
    EliteDirectionFromRigthToLeft   // Right  -> Left
};