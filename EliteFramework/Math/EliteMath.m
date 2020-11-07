//
//  EliteCategories.m
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import "EliteMath.h"
#import <CommonCrypto/CommonDigest.h>

@implementation EliteMath : NSObject

+ (NSInteger)convertASCIIByteToInteger:(char)byte
{
    return byte - '0';
}

+ (NSInteger)convertASCIIByteToInteger:(char)byte base:(NSInteger)base
{
    return byte - '0';
}

+ (NSInteger)ascii2int2:(char)byte
{
    return byte - '0';
}

@end
