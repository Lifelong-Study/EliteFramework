//
//  EliteCategories.h
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define EliteViewController(StoryboardName, ViewControllerIdentifier)   [UIViewController initWithStoryboardName:(StoryboardName) viewControllerIdentifier:(ViewControllerIdentifier)]

//#define eliteView(title, buttonTitle)           [self alertView:title buttonTitle:buttonTitle];
//#define EliteView(title, message, buttonTitle)  [self alertView:title message:message buttonTitle:buttonTitle];


#define AlertView(a, b, c)      [self alertView:(a) message:(b) buttonTitle:(c)];


// 過場動畫
typedef NS_ENUM(NSUInteger, EliteAnimation) {
    EliteAnimationPush,
    EliteAnimationPresent,
    EliteAnimationEaseIn,
    EliteAnimationEaseOut
};

@interface UIViewController (EliteViewControllerCategory)

+ (id)initWithStoryboardName:(NSString *)name viewControllerIdentifier:(NSString *)identifier;

#pragma mark -
- (void)transferViewController:(NSString *)identifier animation:(EliteAnimation)animation;
- (void)transferViewController:(NSString *)name identifier:(NSString *)identifier animation:(EliteAnimation)animation;
- (void)transferWithStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier animation:(EliteAnimation)animation;


- (void)alertView:(NSString *)title buttonTitle:(NSString *)buttonTitle;
- (void)alertView:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle;

@end

