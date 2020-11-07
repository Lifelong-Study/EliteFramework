//
//  EliteDate.m
//  EliteFramework
//
//  Created by Lifelong-Study on 2016/3/20.
//  Copyright © 2016年 Lifelong-Study. All rights reserved.
//

#import "EliteDate.h"

@implementation NSDate (EliteDateCategory)

- (NSString *)formatString:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:format];
    
    return [dateFormatter stringFromDate:self];
}

@end
