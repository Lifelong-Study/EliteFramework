//
//  EliteCategories.m
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import "EliteViewController.h"
#import <UIKit/UIKit.h>

@implementation UIViewController (EliteViewControllerCategory)

+ (id)initWithStoryboardName:(NSString *)name viewControllerIdentifier:(NSString *)identifier
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    if (storyboard) {
        return [storyboard instantiateViewControllerWithIdentifier:identifier];
    }
    
    return nil;
}

#pragma mark -
- (void)transferViewController:(NSString *)identifier animation:(EliteAnimation)animation
{
    [self transferWithStoryboard:self.storyboard identifier: identifier animation: animation];
}

#pragma mark -
- (void)transferViewController:(NSString *)name identifier:(NSString *)identifier animation:(EliteAnimation)animation
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    [self transferWithStoryboard:storyboard identifier:identifier animation:animation];
}

#pragma mark -
- (void)transferWithStoryboard:(UIStoryboard *)storyboard identifier:(NSString *)identifier animation:(EliteAnimation)animation
{
    UIViewController *tatgetViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    CATransition *transition = [[CATransition alloc] init];
    
    //
    switch (animation) {
        case EliteAnimationPush: {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController pushViewController:tatgetViewController animated:animation];
            });
        } break;
        case EliteAnimationPresent: {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.navigationController presentViewController:tatgetViewController animated:animation completion: nil];
            });
        } break;
        case EliteAnimationEaseIn: {
            transition.type = kCATransitionFade;
            transition.duration = 0.2;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view.window.layer addAnimation:transition forKey:nil];
                [self presentViewController:tatgetViewController animated:NO completion:nil];
            });
        } break;
        case EliteAnimationEaseOut: {
            transition.type = kCATransitionFade;
            transition.duration = 0.2;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.view.window.layer addAnimation:transition forKey:nil];
                [self presentViewController:tatgetViewController animated:NO completion:nil];
            });
        } break;
        default:
            break;
    }
}

- (void)alertView:(NSString *)title buttonTitle:(NSString *)buttonTitle
{
    [self alertView:title message:nil buttonTitle:buttonTitle];
}

- (void)alertView:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:nil]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end
