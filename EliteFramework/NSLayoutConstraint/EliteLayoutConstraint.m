//
//  EliteLayoutConstraint.m
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/3/22.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

#import "EliteLayoutConstraint.h"

@implementation NSLayoutConstraint (EliteLayoutConstraint)

//
+ (instancetype _Nonnull)constraintWithItem:(nonnull UIView *)subview attribute:(NSLayoutAttribute)attribute
{
    return [self constraintWithItem:subview
                          attribute:attribute
                          relatedBy:NSLayoutRelationEqual
                             toItem:subview.superview
                          attribute:attribute
                         multiplier:1.0
                           constant:0.0];
}

//
+ (instancetype _Nonnull)constraintWithItem:(nonnull UIView *)subview width:(CGFloat)width
{
    return [self constraintWithItem:subview
                          attribute:NSLayoutAttributeWidth
                          relatedBy:NSLayoutRelationEqual
                             toItem:nil
                          attribute:NSLayoutAttributeNotAnAttribute
                         multiplier:1.0
                           constant:width];
}

//
+ (instancetype _Nonnull)constraintWithItem:(nonnull UIView *)subview height:(CGFloat)height
{
    return [self constraintWithItem:subview
                          attribute:NSLayoutAttributeHeight
                          relatedBy:NSLayoutRelationEqual
                             toItem:nil
                          attribute:NSLayoutAttributeNotAnAttribute
                         multiplier:1.0
                           constant:height];
}

//
+ (instancetype _Nonnull)constraintEqualWidthWithItem:(nonnull UIView *)view1 toItem:(nonnull UIView *)view2
{
    return [self constraintWithItem:view1
                          attribute:NSLayoutAttributeWidth
                          relatedBy:NSLayoutRelationEqual
                             toItem:view2
                          attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                           constant:0.0];
}

//
+ (instancetype _Nonnull)constraintEqualHeightWithItem:(nonnull UIView *)view1 toItem:(nonnull UIView *)view2
{
    return [self constraintWithItem:view1
                          attribute:NSLayoutAttributeHeight
                          relatedBy:NSLayoutRelationEqual
                             toItem:view2
                          attribute:NSLayoutAttributeHeight
                         multiplier:1.0
                           constant:0.0];
}

//
+ (NSArray<__kindof NSLayoutConstraint *> * _Nonnull)constraintsWithVisualFormat:(nonnull NSString *)format views:(NSDictionary<NSString *, id> * _Nonnull)views
{
    return [self constraintsWithVisualFormat:format options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views];
}

@end
