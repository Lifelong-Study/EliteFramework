//
//  EliteCategories.m
//  BLEDrawingPad
//
//  Created by Lifelong-Study on 2015/4/21.
//  Copyright (c) 2015年 PaoYo Ding. All rights reserved.
//

#import "EliteString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (EliteStringCategory)

+ (NSString *)binStringWithData:(NSData *)data interval:(char)interval
{
    NSString *string = @"";
    
    NSInteger length = data.length;
    
    unsigned char *bytes = (unsigned char *)[data bytes];
    
    
    for (int i = 0 ; i < length ; i++) {
        for (int j = 7 ; j >= 0 ; j--) {
            string = [string stringByAppendingFormat:@"%zd", [self getValueWithBytes:bytes[i] bits:j]];
        }
        
        if (i + 1 < length && interval != 0) {
            string = [string stringByAppendingFormat:@"%c", interval];
        }
    }
    
    return string;
}

+ (NSString *)hexStringWithData:(NSData *)data interval:(char)interval
{
    NSString *string = @"";
    
    NSInteger length = data.length;
    
    unsigned char *bytes = (unsigned char *)[data bytes];
    
    
    for (int i = 0 ; i < length ; i++) {
        string = [string stringByAppendingFormat:@"%02X", bytes[i]];
        
        if (i + 1 < length && interval != 0) {
            string = [string stringByAppendingFormat:@"%c", interval];
        }
    }
    
    return string;
}

+ (NSInteger)getValueWithBytes:(char)bytes bits:(NSInteger)bits
{
    return bytes >> bits & 0x01;
}

- (NSString *)convertToMD5String
{
    const char *cstr = [self UTF8String];
    
    unsigned char result[16];
    
    CC_MD5(cstr, (unsigned int)strlen(cstr), result);
    
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

+ (NSString *)convertToASCIIStringWithInteger:(NSInteger)value
{
    return [NSString stringWithFormat:@"%@", [[@(value) stringValue] dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
